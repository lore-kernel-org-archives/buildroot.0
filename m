Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775BBC28B20
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 01:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8234F2C5;
	Sat, 29 Mar 2025 01:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0_J5-i8mttj; Sat, 29 Mar 2025 01:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42214F2BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42214F2BE;
	Sat, 29 Mar 2025 01:00:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2252F1AB
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 01:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13A91850D0
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 01:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xm_CoAlsCWUg for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 01:00:44 +0000 (UTC)
X-Greylist: delayed 12593 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 29 Mar 2025 01:00:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B1E684F7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B1E684F7A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=87.98.158.110;
 helo=7.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 7.mo550.mail-out.ovh.net (7.mo550.mail-out.ovh.net
 [87.98.158.110])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B1E684F7A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 01:00:43 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.9.56])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZPYRt3DWlz1YPG
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 21:23:54 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mwkdb (unknown [10.108.54.173])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 106BB1FE31;
 Fri, 28 Mar 2025 21:23:53 +0000 (UTC)
Received: from armadeus.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-mwkdb with ESMTPSA
 id NidCLWkT52cpEwIAv+ikEA
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Fri, 28 Mar 2025 21:23:53 +0000
X-OVh-ClientIp: 92.148.253.243
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 28 Mar 2025 22:23:29 +0100
MIME-Version: 1.0
Message-Id: <20250328-fix-g2d-header-install-v1-1-99768aa27b15@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAFAT52cC/x2MSQqAMAwAvyI5G4hxQfyKeCg20YBUaUUE8e8Wj
 wMz80CSaJJgKB6IclmyPWSoygLm1YVF0HxmYOKWau5R7caFPa7ivES0kE63bajaNdIpESlDjo8
 o2fzH4/S+H6K19sdoAAAA
X-Change-ID: 20250328-fix-g2d-header-install-ff64e6f000f2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 1398930635971947488
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedvfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeetudffuedugeffuddvhfefjedufeejleekgefhjeeuuedtvdegheeikefhleehgeenucfkphepuddvjedrtddrtddruddpledvrddugeekrddvheefrddvgeefpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=0pkdPjIaWH/2oyDcrDcEZ1NJ6aIhsckCcDKcxnWv8II=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1743197034; v=1;
 b=KhPplAjPTzAoxpSKmhR5d89S6jJMmCKgN2ZdEqwM6lpdf/O4vIBMqKw8hBuQTqu7bfSi+stJ
 fzg+xg79d1eH34CrhRXvLtumFRPhCbOkO6Ega731wE6dFjSHtkFeTQaotGUc84GY8PmYKZl24D2
 WeOiJTIQf2BBGiyTMc263CbIGATy+bGp1a+c/aIQYV6o5rzhKAWdNeEmCPxttWAc9A+fXivFBWD
 R3yBKYi8K9YQVZk7u9smCg/La/u3ryIpyqY2X7fBu6fEMIjlW0w7j3qnZWryUS8ZXNIu+GD0Hit
 N0tvA3M3LEQfCfbDsmEZ7tq+K7g1KEXSnICfUnZA7NadA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=KhPplAjP
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002846d2159-8726-4960-bfc4-0a8c7cbb8b44,
 E281945361D4509FDF48CED0F770457AF138F1C8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-g2d: re-install
 headers to staging
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDQ0MzU1Zjc5OTgwNSAoInBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZDog
aW5zdGFsbCB0aGUKc3BlY2lmaWMgbGlicmFyeSBmb3IgaS5NWDhNTSIpIGFjY2lkZW50YWxseSBy
ZW1vdmUgdGhlIGhlYWRlcnMnCmluc3RhbGxhdGlvbiB0byB0aGUgc3RhZ2luZyBkaXJlY3Rvcnku
IEZpeCB0aGF0LgoKRml4ZXM6IDQ0MzU1Zjc5OTgwNSAoInBhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LWcyZDogaW5zdGFsbCB0aGUgc3BlY2lmaWMgbGlicmFyeSBmb3IgaS5NWDhNTSIpClNp
Z25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFy
bWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdw
dS1nMmQubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tayBiL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tawppbmRleCAxMTU0
OTQzYjNhZmNhMzUyYzM5MTJkMGQxYzU3NGJiODZjYThjNWJiLi4zZDY3ZDIyZjY3ZjU4ZGRhZDgz
ZjNiMThjNjA0OWNhYTE0NDdkYTE4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
aW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsKKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC1ncHUtZzJkL2lteC1ncHUtZzJkLm1rCkBAIC0yNiw2ICsyNiw3IEBAIGVuZGVmCiBJTVhfR1BV
X0cyRF9TVUJESVIgPSAkKGlmICQoQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9J
TVg4TU0pLG14OG1tLCkKIAogZGVmaW5lIElNWF9HUFVfRzJEX0lOU1RBTExfU1RBR0lOR19DTURT
CisJY3AgLWEgJChARCkvZzJkL3Vzci9pbmNsdWRlLyogJChTVEFHSU5HX0RJUikvdXNyL2luY2x1
ZGUvCiAJY3AgLWEgJChARCkvZzJkL3Vzci9saWIvJChJTVhfR1BVX0cyRF9TVUJESVIpL2xpYmcy
ZCogICQoU1RBR0lOR19ESVIpL3Vzci9saWIvCiBlbmRlZgogCgotLS0KYmFzZS1jb21taXQ6IGY4
YmMyNzExMTUzMWU5NjA3Zjc5MTIxNDE0ZjYxYzBjMmQ1ZjgzYzAKY2hhbmdlLWlkOiAyMDI1MDMy
OC1maXgtZzJkLWhlYWRlci1pbnN0YWxsLWZmNjRlNmYwMDBmMgoKQmVzdCByZWdhcmRzLAotLSAK
U8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
