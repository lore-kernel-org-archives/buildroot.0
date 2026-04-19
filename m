Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E06EA719A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED00282347;
	Sun, 19 Apr 2026 16:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_ytA6XPAV-W; Sun, 19 Apr 2026 16:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9A882313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776616750;
	bh=lVdpsKYSnxR1yqOtTMmkC00T4mAfQULcQCPTMCzTSBY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CBTmCwDWcQgZ9Mcd0soFTGSbcdjXjR08UMh7dyRrqiOmbrMv+UjhoC5EwypqGjUjV
	 0ksJE48WwmBOJU1LtUrY9nlSo5KCZ1roDc7hYAvmxvJNZCnGsEZGvzKvlO+H7Gi064
	 Jusni83GevDP3MRsnHxwFf9B2pdLhX7FLjxNwd2oIJIBJELWiov0NU30PS+X5IK/+F
	 Riakke4xbAbvCKLd0yBw1LPDIe3JuZqrUrEUrkQYsNZFnF7WUuXbBChNOzmDUegpis
	 PrQfXKNmbK5bMbanT6se9zoMO80TNBzszdTl9jhuG01XH6KOxFqc8WQktEaYWzqI0c
	 6F7oT4VlIrFiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9A882313;
	Sun, 19 Apr 2026 16:39:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FC162B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DED840F7B
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV0fnp6JnSEG for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 16:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2CC840F45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2CC840F45
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C0E581E34; Sun, 19 Apr 2026 16:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 18:20:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9bc1ef49a88515a24b880b5e71675c02584568c
X-Git-Newrev: 93f486ac566d26a3b0014d6ad3b34ec85e6558e4
X-Patchwork-Hint: ignore
Message-Id: <20260419163908.4C0E581E34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump version to 1.12.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93f486ac566d26a3b0014d6ad3b34ec85e6558e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gpg/libgcrypt/blob/libgcrypt-1.12.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 60050b856e..7be6554d56 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  02f80e9bc9967609b7041ef874eae4e542f240a5  libgcrypt-1.12.0.tar.bz2
-sha256  0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5  libgcrypt-1.12.0.tar.bz2
+sha1  7b8ff21966a0b6e7a735466b9b9b55d9dac9fa87  libgcrypt-1.12.2.tar.bz2
+sha256  7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e  libgcrypt-1.12.2.tar.bz2
 # Locally calculated
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 4dffbdc3bf..0bc281da42 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.12.0
+LIBGCRYPT_VERSION = 1.12.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
