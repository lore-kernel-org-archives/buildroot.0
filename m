Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5329DCCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 18:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0737E611A8;
	Sun, 19 Oct 2025 18:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loG1Ssl74pK3; Sun, 19 Oct 2025 18:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3395C611A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3395C611A9;
	Sun, 19 Oct 2025 18:59:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E911CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9B4D611A8
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxcCl3kf7zbu for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 18:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2462611A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2462611A7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2462611A7
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:59:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8202E19F72F;
 Sun, 19 Oct 2025 20:59:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 20:59:17 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 20:59:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251013201518.3832459-1-dario.binacchi@amarulasolutions.com>
References: <20251013201518.3832459-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <77964949edef72d7b33470bdca66ddce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760900359;
 bh=CU9D8n8y9Vcq54UgZglTGdYS4mXnY5sQtITvak6CTqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h0HsfR01d8HqriyNacSaOqSeiU+1YweYTkVMP+pKs6JEj3ZznozvWQ87Hzv4O7prB
 PbawvdGioEdZBpAgDdsvo6jAZGHgHkJX22okRtQwMrimbWxUqhfcDcKwz5dJqIZP2Y
 GCBirhK+Y6z3SXTshqTYvZuJ2kqKJEACWk476gVMLEry5+lgmf9ekdpqgPx4RXAN2w
 Xb/liqL2rgcvdk0NO1Se2yxgs1x+CDT1cIktr9WpysAeeud9u5EtET4olimqUxAcUp
 3lO4EBY0aEn/cZksEVLuWCZLMSC+I+WxZIYyxbB9gNkjOt0Vb6dShXeBB/oyAye4rw
 UPP4r0sRmdDRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h0HsfR01
Subject: Re: [Buildroot] [PATCH 1/1] package/ifupdown: bump to version 0.8.44
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTMvMTAvMjAyNSAyMjoxNSwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQWRkaW5nIFBLR0xJ
QkRJUiB0byBDRkxBR1Mgd2FzIG5lY2Vzc2FyeSB0byBmaXggdGhlIGZvbGxvd2luZyBlcnJvcgo+
IHJhaXNlZCBkdXJpbmcgdGhlIGNvbXBpbGF0aW9uIG9mIHRoZSBuZXcgdmVyc2lvbjoKPiAKPiBl
eGVjdXRlLmM6IEluIGZ1bmN0aW9uIOKAmHNldF9lbnZpcm9u4oCZOgo+IGV4ZWN1dGUuYzoxMDc6
NDg6IGVycm9yOiDigJhQS0dMSUJESVLigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
Cj4gZnVuY3Rpb24pCj4gICAxMDcgfCAgICAgICAgICpwcGNoKysgPSBzZXRsb2NhbGVudigiJXM9
JXMiLCAiUEFUSCIsIFBLR0xJQkRJUiAKPiAiOi91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2FsL2Jp
bjovdXNyL3NiaW46L3Vzci9iaW46L3NiaW46L2JpbiIpOwo+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiBleGVjdXRlLmM6
MTA3OjQ4OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5
IAo+IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgo+IGV4ZWN1dGUuYzoxMDc6
NTc6IGVycm9yOiBleHBlY3RlZCDigJgp4oCZIGJlZm9yZSBzdHJpbmcgY29uc3RhbnQKPiAgIDEw
NyB8ICAgICAgICAgKnBwY2grKyA9IHNldGxvY2FsZW52KCIlcz0lcyIsICJQQVRIIiwgUEtHTElC
RElSIAo+ICI6L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jp
bjovc2JpbjovYmluIik7Cj4gCj4gVGhpcyBQS0dMSUJESVIgZGVmaW5lIHdhcyBhZGRlZCB1cHN0
cmVhbSBpbiBjb21taXQgWzFdIGluIHRoZSBNYWtlZmlsZQo+IGRlZmF1bHQgQ0ZMQUdTLCBidXQg
c2luY2UgQnVpbGRyb290IHJlZGVmaW5lcyB0aG9zZSBpdCBuZWVkcyB0byBiZSAKPiBhZGRlZAo+
IGJhY2suCj4gCj4gUmVsZWFzZSBub3RlcyBzaW5jZSAwLjguNDE6Cj4gaHR0cHM6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9pZnVwZG93bi8tL2Jsb2IvbWFzdGVyL2RlYmlhbi9jaGFuZ2Vsb2cj
TDEKPiAKPiBbMV0gCj4gaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9pZnVwZG93bi8t
L2NvbW1pdC8xZWVlN2EzMDQwZWI3YmEyOTVjNDRiZWRkYmZiNDRhYmYzNDJjYTJjCj4gU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
