Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7175606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fGmo0nOI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=LiaHsjfX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2CDC407AA;
	Tue, 24 Nov 2026 09:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voJ58nCnkDMs; Tue, 24 Nov 2026 09:08:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D22E40779
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795511290;
	b=QZ6lACUe4QopCRDPP6F6Utu/qAbYqgKxX3RZGwXFzQx4hbzOlWRUOgUykdTKO2cj238z
	 Diq7XQo1GI0C0AfER5oP0agfRwdBrJdpwr/iab+gFbUPYXOfZrPOKcClI0QqVSH1PXy6E
	 aGGZhQ6tgjPTQyuly+x0c0xKcCGzEpcvlrxuH0PqqIB5duPX0azaAeKjNGee8mB5s7Bm1
	 DREv70FvolTkQZgBCp9VIn/HXsDC+1qdjRtbzyKh73rOXqvwF9hnYEcCWTbhR0Pi09X+B
	 7AmhR2rj3W2OqfVgAWEOi2GWEQ1z+JAZh0aNgkM1c8f57i+u5HHBTfNk6XtRaz12p/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795511290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ocCf5feodC6o3pkxIo7Gh/MqJGNBHgIDBYgeMWfbvkk=;
	b=P+Tb7B2PDKqSK95AC6B9SC1kMJMdqlkv+WLj9SVxP1/RmZEIBHJ7pua1n6kvVVfIJ18F
	 cNoraVP28iOPNdXfgczkTyifRMFquPRDwQTmHjwnCcyT5DbFFVwnUm0lgFltuicUJKdVX
	 UC3Z62OEOIgrwpySbjvf35pQ7NpKo4DevJeXzpj+pXJRwTOJo8hxSrxXqtAvcOOpZncgr
	 3KbHyBkRRrtHQOJlU0H38RLnH9hNqlWFiesOq8hCc3niEPndH8czjEIMqUB29AHNq8qaR
	 HZ+rAEY6t50y9tO3jPJRQYu6jUAVUzupeJ6IUxRKGUD3QS67hoC9pZvljIiJp629Pxg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795511290;
	bh=ocCf5feodC6o3pkxIo7Gh/MqJGNBHgIDBYgeMWfbvkk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fGmo0nOIBWo+yoKj33LlEWwhs00iDIaq1cqDvm/1G2jJnk8GJqFz9eJv38o+PSf6J
	 VWCTikHh1kWVZo8PTPcxebRPa1fbJA6tPiLmz/032gh8OZS1sYOwflzkGcAkEblxfu
	 MXny71F+j21x2ttqv4kL4BUJTjlC2Qc+9dYREmiPKq8CQ26JDxtv4lW9SHXYvjfY2L
	 fkr/IRrwu0KLSQK1b3Y/rQpJR0M5yMtNbjEtcSjUneIs+aPXaRZs7t421bXC47FXmM
	 Z93IDWIoh3NuoKU/+jnNFsQvZiSW/4+IzHeGJwcVK9s/gY6Zf21F23kHGmLhsUDFD1
	 bxGAUR1r1d9yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D22E40779;
	Tue, 24 Nov 2026 09:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EEC6FBB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FBBC400AE
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGDkHm6fZP3p for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 09:08:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6369940068
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LiaHsjfX
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6369940068
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:08:04 +0000 (UTC)
Received: from localhost.localdomain ([79.7.167.199])
 by Aruba SMTP with ESMTPSA
 id VmVNxDqreW41bVmVNxvtBT; Tue, 24 Nov 2026 10:08:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795511282; bh=DKYBZ0nCGgQcVtm512J3JFRFOtiVnTvoq+7AgEVTqaU=;
 h=From:To:Subject:Date:MIME-Version;
 b=LiaHsjfXKJdKTyeqC4/j/HgAot1YnsHfeF5xIrwqmYtAYJ2uonYVo14DYQdpD0HAv
 K32OPiWtkdA6Vb5HneyxBbaL1yz6esv5RMbZmULW4lU3OIeUXRXH8duZafJ36qKJ0X
 62DPCASt++CYlMKkyXhSFvo7LPE4JvZMYYYjMO1v68KukAcuAg7nuHm7OspBoVg4/p
 6sL0/n3OVyav/0ErEIyz/k2c/T2rS/F30u70c8HLBSz1Xslg5dAbWIQBNSCdNWizF6
 2YfvFU+ttKvXiDY8BSeyuBIn7mKA83plXdSXlgYxy/ZIq/SXdACcCDALGoKYHoVBfy
 6ReLo8I/f4rPQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Nov 2026 10:08:01 +0100
Message-ID: <20261124090801.316109-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH8mQEihkeww8I5dgljUDmpOPbVL3t26nTQacM4qZR97WV7w/v1ciIBR3mk5N2r1uMtZjRLrojX/eV09rjD2562qQePut/YhCkrz3ITE/sLvJOsaW+Do
 gk142xVthsqKQ3VISA1jdWNMQ3PtgZmlcOnDkbiX2cehJMEootKgpMrhWwFRGKO1gJiZquV8OO624lBJxqQCbTMdIeUtzWaDNhwt5efYq7MGpSyYDSSPnu8Z
 uKNfp0YGP03qjeMwOnmqh7LbpAhYvMf5sjSNR2d73Ls=
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a stable security bug-fix release that hardens on-disk metadata
validation (LUKS1/LUKS2, OPAL, BITLK, verity) and fixes keyring handling.

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.9/docs/v2.8.9-ReleaseNotes

Assisted-By: Claude Opus 5.5
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index a0ef7aea9b..3e5e4ae572 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35  cryptsetup-2.8.8.tar.xz
+sha256  8667085a4f59174928948b501b4a2a68f7f1cce1cfe46170b8f40fa6534742b3  cryptsetup-2.8.9.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 643a2b3f59..11657bf557 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).9
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
