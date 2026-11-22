Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE6606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o/5USzF5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=SWz1hjky
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC33660612;
	Sun, 22 Nov 2026 18:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGeYkT2mbocf; Sun, 22 Nov 2026 18:38:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2DB386060B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795372698;
	b=pdTiis3SkcDq0S6MUw+CiYRYHAtkPPPXP5gVS+SEQiSJWNZeh/eAbNwGZI8fCQRbsljm
	 IkD46hLghL84avGpFGNaMTx1HqWZ4Et7u/1a2zvV5v30Wq+N2Tk5crxtnoH2RTlW//cLp
	 sCdImhc3hp9C/Mf/FjlX3bkv0T5R0BbHS9qGmzUauectBWxZZCVVGPMMnenm0zD2c9293
	 IFtjAHH+0P9VgdcH5n4FKA50g08PmNZcJic+9TE9YuoRC5Pj6wnAc6RxJcNBPMmQxzxuJ
	 osYeYEqQmj8wcjL25aP1IPpGk1AhbdK6zHrcLwg77Y/3EaLu4OnZhrNIJJ3NsuSJDZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795372698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tcZ9C3kQPU+CSxeb9/hjkOqdUWBngtpGulY5XU7QW4g=;
	b=oLfmsxCX2tPWdjBwcuBrEr36rmiJfk75E2ZhIx/kf1794s+YOLJcfR5anwlV3CjaFXXV
	 hNJmvyxeIb2JIqrbsMRVvHx1OtG0mhaL8jm0+USQ0oY8ZcAgUUAsBGES5SHBk2aIsU7Je
	 c6f7LpqDSW5c7UhsluKvcfGe19NuKzaJItKzphPbcMuMFraD/atbKP7098AzDdN/9GVxy
	 KGb172vamlEfMQ71VacJvIyy3Aqq7pxzl0DbxyiqGenRPgtA4j+Uq3+cCgVX/lUJYPpIy
	 Q+B17YYa7Fmxkg2hi5NvcmQdzxikYbzXJF25mUFPcKf6m37AuTo3u8DhmJvw1bZLGmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795372698;
	bh=tcZ9C3kQPU+CSxeb9/hjkOqdUWBngtpGulY5XU7QW4g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o/5USzF5lLf6+g2x2WWh6Poy3A5ZqUgALU2WbPi4QAmW1GqJ6GDMDiro+FzBT6/c+
	 ESOLra2oVVyPW8CmXdwKR38J1sZpogxLP4wVHTDbRys7wtFAwBv5c8JjEdx6/5hJgu
	 E/swb2tqX+zUA5L+G1OfS4inPbP+UTx+3yPAzCfFbxbX4OQY8vO/0Ybpjs5M74l/TS
	 IH5V61y8sv3F945u9DVV37yuTdwHscN4onTf3F7ClRNWDQ5ggs4LT1pA365QcnD8yG
	 FgNIqir0tnC+hrfPgGO1wCoZKKyBnqWbfCDbOM6eonMt+8yd5c24ysztUDBgOkOEB8
	 xD/nkqwsXvFGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB386060B;
	Sun, 22 Nov 2026 18:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0D9C1AB
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 18:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9278A400AC
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 18:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwh9J4IQateD for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 18:38:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1BFBB4008B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SWz1hjky
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BFBB4008B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795372690;
 bh=jyu78H6A9adbey3qdfq5nKlRw2CpUgWsIJvMRQvKwjs=;
 h=From:To:Subject:Date:From;
 b=SWz1hjkyNFBnCxLRvVuaeAy4MDBTe9Bm/E0WN0palicXWAxv0lV9F8UuFxtr5Zwai
 WKaE5BSN6CbnupSXP1T0KCOxu7iQBOfzOwGQl7DdOZxnYQiBRdGQi3y4YErBc0UhLf
 PWuQIyMFWb75LJldksvQ81k3wYQyDqn5u4wwlxUyHGTIS5lrL/DiiTTAT/61Hf1p1t
 cxBMWI6fmdy/Zj2ZNh+4tkz7ax7unviebFWU30TffhieXKfe44RNUa+k85WFVc6h5+
 UfrmNPm6mb4xposjHhLktWXpO88/6RWXNksNvutsAv3NmmmDIbCVBSJ389bMxRPr2V
 SAs/YNaCEmUhQ==
X-KAS-Sym: v3:f51bdf72230551df:FTRs9IFV2xqTrxdD2FlbFImptDQjGKOqDpQh2kLD3VzVM
 l2Z9LDuqdfEWdutYMI3ZhCRuiSI28NuafZLqOO0LqnICsdE5KqNNIGYi+6IHrAk3AnXrYE6hOlh
 COnPowAH4/UOKF0xsZCzzKIYWtNKTehGyU6hwUaAZj583Kvzt3oqNHqwo+UereXLnT7C9j80cQe
 k8/mB/b2gSP+OyB3U6P1R+KZTPWJqjq5rRYlW8Ml5YSdSLCJcXRGkZKrJBagazYnZ7G3Rzs+sTF
 2Pn6ZxFtAl7971JYHYAQQVoouCCQiNobEf6h/wd5982G5VIXw20/6ro2O37oF3KoI61LfxrA==:
 n0PrI5pq+iGx3mZIA/643MVd4s66ZN8QlHqedW1oIxz7ciB8M6yJbuZ0vl0u3KVuYt3z9t5zjhp
 TOFR5r0Zzc4vhN0nUqHsg0XIPzwTVBuU79yKakihoRZmkS0utxPyslpJDwiaqyWG/TeGaPedd7S
 FAETAJfUBdPPHKOOAa/MmPqMyTCoAv6b1cD6CZR57APqj3LRIm44s+GhybelrZxE/Kj7rbwnKYJ
 yEkPf6WJS46QLMuK+WheYsprRCmNlUQ9pG31Lck8YsKGDvw3r/RNGJdqqOf1wOPGNqJTzZE7iQO
 WmhcTU/i0p81Z/AKRy2LO93dgUv8SRyKEH+N8I2HK1LiYID7mtvuUjcXJXH9JfZI5DClbyjVNhP
 8Ks3OfPHTS1KGTesDArdt75iK4rgtL92BZQwKTLSJGIjzb6AbFtUff4vHAZVcS+X1c3hz6bAl0p
 BySsoMlrEVoDbBhTaeV7nkP2e4HlVg1WeN7s3ePdmrbOS6rOwNQxWn2aNPAOMYBXUO1z4WuTL3H
 7ozbZGE4xqwFSqh12l3+e6yw9VEuFSE6Qa7hGprwxBK11afQ/E=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9769AA4C50DF
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 19:38:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38656)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVCS2-000000005hE-0vHb
 for buildroot@buildroot.org; Sun, 22 Nov 2026 18:38:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 19:38:08 +0100
Message-ID: <20261122183809.3916943-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to version
 3.8.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aHR0cHM6Ly9naXRsYWIuY29tL2dudXRscy9nbnV0bHMvLS9ibG9iLzMuOC4xNC9ORVdTCmh0dHBz
Oi8vc2VjbGlzdHMub3JnL29zcy1zZWMvMjAyNi9xNC83ODQKCkZpeGVzIENWRS0yMDI2LTEyNzAz
OSwgQ1ZFLTIwMjYtMTI3MDQwICYgQ1ZFLTIwMjYtMTI3MjMxLgoKQWRkZWQgcGF0Y2ggMDAwMSB0
byBmaXggYSBidWlsZCBlcnJvciBmb3VuZCBieSB0aGUgR2l0bGFiIHBpcGVsaW5lcyB0aGF0Cndv
dWxkIGJlIGludHJvZHVjZWQgYnkgdGhpcyBidW1wOgoKR251dGxzIGFkZHMgZ251bGliIGFzIGEg
c3VicHJvamVjdCB0byBpdHMgdHJlZSBmcm9tCmh0dHBzOi8vZ2l0bGFiLmNvbS9saWJpZG4vZ251
bGliLW1pcnJvci4KR251dGxzIGJ1bXBlZCB0aGUgZ251bGliIHZlcnNpb24gYnkgY29tbWl0Cmh0
dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0LzI2MzVlMjdjMTg0NWY2NTZm
MGE1MDI4NTQwNjVmOGIyM2VjMjk1N2YKZmlyc3QgcmVsZWFzZWQgaW4gZ251dGxzIDMuOC4xNC4K
ClRoaXMgZ251bGliIHJlcG8gYnVtcCBjb250YWlucyB1cHN0cmVhbSBjb21taXQKaHR0cHM6Ly9n
aXRsYWIuY29tL2xpYmlkbi9nbnVsaWItbWlycm9yLy0vY29tbWl0LzI1MDg4MWM0ZjgzOWUxODcz
N2ExZDZkODA3MzM3YTc2MDE1Y2M3MjIKCnRoYXQgY2F1c2VzIGEgYnVpbGQgZXJyb3Igd2l0aCBk
ZWZjb25maWcgYnItYXJtLWZ1bGwtbm90aHJlYWQuCgpVcHN0cmVhbSBnbnVsaWIgZml4ZWQgdGhl
IHByb2JsZW0gYnkgY29tbWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS9jb3JldXRpbHMvZ251bGliL2Nv
bW1pdC84OGJkZTc0NmQ5MGVmODA2MjU3NzNiNTk1OWFkNDUwYjMyYWQwNzcyCnNlbnQgdG8gdGhl
IG1haWxpbmcgbGlzdCBpbiBBcHJpbCAyMDI2OgpodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2
ZS9odG1sL2J1Zy1nbnVsaWIvMjAyNi0wNC9tc2cwMDE4MC5odG1sCgpUaGlzIGZpeCBpcyBub3Qg
aW5jbHVkZWQgaW4gdGhlIGxpYmlkbi9nbnVsaWItbWlycm9yIHVzZWQgYnkgR251dGxzLApldmVu
IG1vcmUgdGhhdCBtaXJyb3IgaXMgc3RydWN0dXJlZCBkaWZmZXJlbnRseS4gV2hpbGUgZ251bGli
IHVwc3RyZWFtCmFkZGVkIHRoZSBmaXggdG8gbGliL2dsdGhyZWFkL2NvbmQuaCB0aGlzIGZpbGUg
ZG9lcyBub3QgZXhpc3QgaW4gdGhlCmxpYmlkbi9nbnVsaWItbWlycm9yIHJlcG8uCgpJbnN0ZWFk
IHdlIG5lZWQgdG8gcGF0Y2ggZ2wvZ2x0aHJlYWQvbG9jay5oIGFuZCBuZWVkIHRvIHJlLWFkZCB0
aGUKaW5jbHVkZSBvZiBlcnJuby5oIHJldmVydGluZyB0aGUgbG9jay5oIGNoYW5nZSBvZiBjb21t
aXQKaHR0cHM6Ly9naXRsYWIuY29tL2xpYmlkbi9nbnVsaWItbWlycm9yLy0vY29tbWl0LzI1MDg4
MWM0ZjgzOWUxODczN2ExZDZkODA3MzM3YTc2MDE1Y2M3MjIKClNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0
cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzQ0M2IxN2ZhM2JlNjI1
YzkwNjk0OTBlMWRlNjUzODU0YzFjNmI1YTIKCiAuLi4tY29uZC1hbHdheXMtaW5jbHVkZS1nbHRo
cmVhZC1sb2NrLmgucGF0Y2ggfCA0MSArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2dudXRs
cy9nbnV0bHMuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogcGFja2FnZS9nbnV0bHMv
Z251dGxzLm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2dudXRscy8wMDAxLWNvbmQtYWx3YXlzLWluY2x1ZGUtZ2x0aHJlYWQtbG9jay5oLnBhdGNo
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnV0bHMvMDAwMS1jb25kLWFsd2F5cy1pbmNsdWRlLWds
dGhyZWFkLWxvY2suaC5wYXRjaCBiL3BhY2thZ2UvZ251dGxzLzAwMDEtY29uZC1hbHdheXMtaW5j
bHVkZS1nbHRocmVhZC1sb2NrLmgucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uZThlZWFhMDhjZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ251dGxzLzAw
MDEtY29uZC1hbHdheXMtaW5jbHVkZS1nbHRocmVhZC1sb2NrLmgucGF0Y2gKQEAgLTAsMCArMSw0
MSBAQAorRnJvbSA4OGJkZTc0NmQ5MGVmODA2MjU3NzNiNTk1OWFkNDUwYjMyYWQwNzcyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGF1bCBFZ2dlcnQgPGVnZ2VydEBjcy51Y2xhLmVk
dT4KK0RhdGU6IFNhdCwgMjUgQXByIDIwMjYgMTU6MTk6MjcgLTA3MDAKK1N1YmplY3Q6IFtQQVRD
SF0gY29uZDogYWx3YXlzIGluY2x1ZGUgZ2x0aHJlYWQvbG9jay5oCitNSU1FLVZlcnNpb246IDEu
MAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0CisKKyogbGliL2dsdGhyZWFkL2NvbmQuaDogUmV2ZXJ0IG15IDIw
MjYtMDMtMzEgbmFtZXNwYWNlIGNsZWFudXAKK3BhdGNoLCB3aGljaCB3YXMgaW5jb3JyZWN0IGJl
Y2F1c2UgdGhpcyBoZWFkZXLigJlzCitnbF9jb25kX3RpbWVkd2FpdF9mdW5jIGZ1bmN0aW9uIHVz
ZXMgbG9ja190IGV2ZW4gd2hlbiB0aHJlYWRpbmcgaXMKK2Rpc2FibGVkLgorCitVcHN0cmVhbTog
aHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9idWctZ251bGliLzIwMjYtMDQvbXNn
MDAxODAuaHRtbAoraHR0cHM6Ly9naXRodWIuY29tL2NvcmV1dGlscy9nbnVsaWIvY29tbWl0Lzg4
YmRlNzQ2ZDkwZWY4MDYyNTc3M2I1OTU5YWQ0NTBiMzJhZDA3NzIKKworW3JlYmFzZWQgZm9yIGdu
dXRscyAzLjguMTRdCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0
PgorLS0tCisgZ2wvZ2x0aHJlYWQvbG9jay5oIHwgNyArKy0tLS0tCisgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKKworZGlmZiAtdU5yIGEvZ2wvZ2x0aHJl
YWQvbG9jay5oIGIvZ2wvZ2x0aHJlYWQvbG9jay5oCistLS0gYS9nbC9nbHRocmVhZC9sb2NrLmgK
KysrKyBiL2dsL2dsdGhyZWFkL2xvY2suaAorQEAgLTgwLDEzICs4MCwxMCBAQAorICAjZXJyb3Ig
IlBsZWFzZSBpbmNsdWRlIGNvbmZpZy5oIGZpcnN0LiIKKyAjZW5kaWYKKyAKKysjaW5jbHVkZSA8
ZXJybm8uaD4KKyAjaW5jbHVkZSA8c3RkbGliLmg+CisgCistI2lmIChVU0VfSVNPQ19USFJFQURT
IHx8IFVTRV9QT1NJWF9USFJFQURTIHx8IFVTRV9JU09DX0FORF9QT1NJWF9USFJFQURTIFwKKy0g
ICAgIHx8IFVTRV9XSU5ET1dTX1RIUkVBRFMpCistIyBpbmNsdWRlICJnbHRocmVhZC9vbmNlLmgi
CistLyogYzExX3RocmVhZHNfaW5fdXNlKCkgaXMgZGVmaW5lZCBpbiBnbHRocmVhZC9vbmNlLmgu
ICAqLworLSNlbmRpZgorKyNpbmNsdWRlICJnbHRocmVhZC9vbmNlLmgiCisgCisgLyogPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PSAqLworIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnV0bHMvZ251dGxzLmhhc2gg
Yi9wYWNrYWdlL2dudXRscy9nbnV0bHMuaGFzaAppbmRleCA5OWE3MjFkMjA4Li5jZDhhMWFkZTEy
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dudXRscy9nbnV0bHMuaGFzaAorKysgYi9wYWNrYWdlL2du
dXRscy9nbnV0bHMuaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkIGFm
dGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUKLSMgaHR0cHM6Ly93d3cuZ251cGcub3JnL2Z0cC9n
Y3J5cHQvZ251dGxzL3YzLjgvZ251dGxzLTMuOC4xMy50YXIueHouc2lnCi1zaGEyNTYgIGZmZWQ4
ZWMxYmYwOWMyNDI2ZDRmMTRhYWUzNzdkZTQ3NTNiNTNlNTM3ZDY4NWU2MDRlOTlhOGIxNmNhOWM5
N2UgIGdudXRscy0zLjguMTMudGFyLnh6CisjIGh0dHBzOi8vd3d3LmdudXBnLm9yZy9mdHAvZ2Ny
eXB0L2dudXRscy92My44L2dudXRscy0zLjguMTQudGFyLnh6LnNpZworc2hhMjU2ICA3ZTJkMjU4
MDcxZjVkYjk2MjBhYTdmZjM0MjU5MzMxZDAwNGY3YmVhZmEzZWIxODU2MGNmYWY2MGFjZmJmMDJh
ICBnbnV0bHMtMy44LjE0LnRhci54egogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgMzk3
MmRjOTc0NGY2NDk5ZjBmOWIyZGJmNzY2OTZmMmFlN2FkOGFmOWIyM2RkZTY2ZDZhZjg2YzlkZmIz
Njk4NiAgQ09QWUlORwogc2hhMjU2ICAyMGU1MGZlN2FhZTNlNTYzNzhlYmYwNDE3ZDlkZTkwNGY1
NWEwZTYxZTRkZjMxNTMzM2U2MzJhNGQzNTU1ZDk1ICBDT1BZSU5HLkxFU1NFUnYyCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2dudXRscy9nbnV0bHMubWsgYi9wYWNrYWdlL2dudXRscy9nbnV0bHMubWsK
aW5kZXggYWUxY2FhYTIyMS4uNDkyZTE5ZTY1ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9nbnV0bHMv
Z251dGxzLm1rCisrKyBiL3BhY2thZ2UvZ251dGxzL2dudXRscy5tawpAQCAtNiw3ICs2LDcgQEAK
IAogIyBXaGVuIGJ1bXBpbmcsIG1ha2Ugc3VyZSAqYWxsKiAtLXdpdGhvdXQtbGliZm9vLXByZWZp
eCBvcHRpb25zIGFyZSBpbiBHTlVUTFNfQ09ORl9PUFRTCiBHTlVUTFNfVkVSU0lPTl9NQUpPUiA9
IDMuOAotR05VVExTX1ZFUlNJT04gPSAkKEdOVVRMU19WRVJTSU9OX01BSk9SKS4xMworR05VVExT
X1ZFUlNJT04gPSAkKEdOVVRMU19WRVJTSU9OX01BSk9SKS4xNAogR05VVExTX1NPVVJDRSA9IGdu
dXRscy0kKEdOVVRMU19WRVJTSU9OKS50YXIueHoKIEdOVVRMU19TSVRFID0gaHR0cHM6Ly93d3cu
Z251cGcub3JnL2Z0cC9nY3J5cHQvZ251dGxzL3YkKEdOVVRMU19WRVJTSU9OX01BSk9SKQogR05V
VExTX0xJQ0VOU0UgPSBMR1BMLTIuMSsgKGNvcmUgbGlicmFyeSkKLS0gCjIuNDcuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
