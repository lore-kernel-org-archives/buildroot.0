Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5710CC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 10:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1240280FA8;
	Sun,  5 Jul 2026 10:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDRBCtJVqea0; Sun,  5 Jul 2026 10:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FEA780FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783246180;
	bh=vqe1i7A02IbzVIb9SuoxxBaDaSLQxn7derEws0UEKbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pPrIonJ9oGcxsDJH2+TD6elZKf4O0TNldUAcrW5kxf7GPRGTKoKVOX5nNmphfF0FW
	 Pi3HAFQjK7/f7lERQYly13g2yc4FRTPRDYTctpLmwqjkrsd8vuOiLTTxRLdQoEEFtZ
	 RUXE4/6+Fh1jkSOxeR7Jf97iAemEGCsTqDpXhhHHaBi5B8US7HQhHkOQjQ+GXS+lgQ
	 FyjhbF4QCRLdhWJNaAgaz1ZHPrn28hhYCzaRtwpkNhKZdWxK9JHhoCladOgecTxAI4
	 +91kcxjx5gqhtWtVVOXb3KL5KFwoID8OqlFH6BJaLYKzkoYPQrsfqC8bLmg2Dqce/m
	 u9EcL+J9g1LEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FEA780FB3;
	Sun,  5 Jul 2026 10:09:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3223F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99F2606E0
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPkIBkTkpaD4 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 10:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7CE4606D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7CE4606D7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:09:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 924CF8846C; Sun,  5 Jul 2026 10:09:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 12:02:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: def2405f39f949813148cc973660845bff30b3ca
X-Git-Newrev: be70e1b9f30eb0df8b0a40ff06fe5056ed853504
X-Patchwork-Hint: ignore
Message-Id: <20260705100907.924CF8846C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: security bump version to
 2.5.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be70e1b9f30eb0df8b0a40ff06fe5056ed853504
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000506.html

Fixes CVE-2026-34182.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f69b7c6eac..a53f46c67a 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  96371ec0260da5a22edbf8e4d3bf0e54b3ea5b8e  gnupg-2.5.20.tar.bz2
-sha256  6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6  gnupg-2.5.20.tar.bz2
+sha1  51fae4f4d902787624eb7047f6d3e7c263ad7690  gnupg-2.5.21.tar.bz2
+sha256  e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352  gnupg-2.5.21.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 7756023798..05acd4811d 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.20
+GNUPG2_VERSION = 2.5.21
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
