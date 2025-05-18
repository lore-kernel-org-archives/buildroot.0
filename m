Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BEFC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 10:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDE966089D;
	Sun, 18 May 2025 10:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRnWIDk7CL5w; Sun, 18 May 2025 10:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF256077E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF256077E;
	Sun, 18 May 2025 10:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D83241BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 10:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDA5380DAB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 10:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkbCf_DxSs8W for <buildroot@buildroot.org>;
 Sun, 18 May 2025 10:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1DE880D81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DE880D81
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1DE880D81
 for <buildroot@buildroot.org>; Sun, 18 May 2025 10:01:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0FCF85FFAA;
 Sun, 18 May 2025 12:01:56 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 12:01:56 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 12:01:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250517210922.3620220-1-peter@korsgaard.com>
References: <20250517210922.3620220-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ff43a065ae3b4ef3395731c9d2f809dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747562518;
 bh=xSE1p0piMdt/WRZ0cQmEq9vyCIVkqtGF2EZ56Z3X9ok=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l1A3HWb6dLyatC9NcNu7vKCeMRevCKsnjwTpzHj08nem0mmzdqzqfEjyJixucre3S
 41Hvqp1lSURoLsI+0CzYXlRPUySFSrtBfEpE5tM25BXIp0IHXB5+0t9XCDvO6k+fk9
 Sq2BZkGwhNsIWmDiXGpCgeZzgzH8avkTBQJgpAkv2UKki8CMtD+rplgDB+Wwj2vfap
 u+hZALtZzOEsV1D64ZDKcLgcEEa2SDpswIN8i/8Kfqui+NqfYAkXLgWnWmGoJ5cuiL
 y/p3KnYaST2ortfSR8QBYfsjxfqhLG604xO9/tnRgfpL2KgW8xtt3/0kBk6H6KChlW
 mF+qsZMN62hUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l1A3HWb6
Subject: Re: [Buildroot] [PATCH] package/dhrystone: fix builds with GCC 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTcvMDUvMjAyNSAyMzowOSwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+IEdDQyAxNSBkZWZh
dWx0cyB0byAtc3RkPWdudTIzLCB3aGljaCBoYW5kbGVzIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyAK
PiB3aXRob3V0Cj4gcGFyYW1ldGVycyBkaWZmZXJlbnRseSBmcm9tIGVhcmxpZXIgQyBzdGFuZGFy
ZHMgbGVhZGluZyB0byBjb21waWxhdGlvbgo+IGVycm9yczoKPiAKPiBkaHJ5XzEuYzogSW4gZnVu
Y3Rpb24g4oCYbWFpbuKAmToKPiBkaHJ5XzEuYzoxNzY6MTk6IGVycm9yOiB0b28gbWFueSBhcmd1
bWVudHMgdG8gZnVuY3Rpb24g4oCYRnVuY18y4oCZOyAKPiBleHBlY3RlZCAwLCBoYXZlIDIKPiAg
IDE3NiB8ICAgICBCb29sX0dsb2IgPSAhIEZ1bmNfMiAoU3RyXzFfTG9jLCBTdHJfMl9Mb2MpOwo+
IAo+IGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTE1L3BvcnRpbmdfdG8uaHRtbCNjMjMtZm4tZGVj
bHMtd2l0aG91dC1wYXJhbWV0ZXJzCj4gCj4gQXMgYSB3b3JrYXJvdW5kLCBmb3JjZSB0aGUgYnVp
bGQgdG8gdXNlIC1zdGQ9Z251OTkgbW9kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3Jz
Z2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
