Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DD4C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 14:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2589605B1;
	Thu, 11 Apr 2024 14:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9UlPcWNo8p2; Thu, 11 Apr 2024 14:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0187C605C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0187C605C3;
	Thu, 11 Apr 2024 14:53:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61D7E1BF370
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 14:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0BF40201
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 14:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvz3CceEBgAL for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 14:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCF0640196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF0640196
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCF0640196
 for <buildroot@uclibc.org>; Thu, 11 Apr 2024 14:53:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1ruvnX-0005L4-7b
 for buildroot@uclibc.org; Thu, 11 Apr 2024 16:53:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 11 Apr 2024 16:52:29 +0200
Message-ID: <pan$3d837$cb823dab$8de00bc6$91f65040@ID-313208.user.individual.net>
References: <20240411133507.82781-1-alexis.lothore__16970.9278432251$1712842540$gmane$org@bootlin.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v2 0/3] package/pppd: fix pppd startup with
 upstream patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gVGh1LCAxMSBBcHIgMjAyNCAxNTozNTowNCArMDIwMCBzY2hyaWViIEFsZXhpcyBMb3Rob3LD
qSB2aWEgYnVpbGRyb290OgoKPiBUaGUgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiBkZXRlY3RlZCBh
bmQgZml4ZWQgdXBzdHJlYW0gKHNlZSBbMV0pIGFuZCBpcwo+IGV4cGVjdGVkIHRvIGJlIHJlbGVh
c2VkIG9uIGEgdjIuNS4xLCBidXQgdGhpcyByZWxlYXNlIHNlZW1zIHRvIGJlCj4gc3RhbGxlZCBm
b3Igbm93IChzZWUgWzJdKS4gQSBtZXJlIGJ1bXAgb2YgdGhlIHBhY2thZ2UgaXMgdGhlbiBub3QK
PiBjdXJyZW50bHkgcG9zc2libGUKCkhpIEFsZXhpcywKCmEgYnVtcCB0byBjdXJyZW50IGdpdCBI
RUFEIGlzIHBvc3NpYmxlIHdoaWNoIHdvdWxkIGFsbG93IHVzIHRvIGRyb3AgZm91ciAKcHJlc2Vu
dCBwYXRjaGVzIGluc3RlYWQgb2YgYWRkaW5nIHRocmVlIG1vcmU6CgpodHRwczovL2dpdGh1Yi5j
b20vYmt1aGxzL2J1aWxkcm9vdC9jb21taXQvCjhlODA2MjUzNWE5NzU2MWM1ZWUyMGQ3OGQxMzI4
M2Y4Y2I4MjZhOGIKCkkgZGlkIG5vdCBoYXZlIHRoZSB0aW1lIHlldCB0byBzZW5kIHRoaXMgcGF0
Y2ggaGVyZSB3aXRoIGEgcHJvcGVyIGNvbW1pdCAKbG9nIGJ1dCBJIG5vdGljZWQgdGhlIGJ1Z3Mg
eW91IG1lbnRpb25lZCBhcyB3ZWxsIGFuZCB0aGV5IGFyZSBhbGwgZml4ZWQgYnkgCnRoZSB1cHN0
cmVhbSBjb21taXRzLgoKUmVnYXJkcywgQmVybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
