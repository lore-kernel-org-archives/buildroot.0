Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19DDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FFA160EF1;
	Tue, 19 Apr 2022 21:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwGt4vYTAKQI; Tue, 19 Apr 2022 21:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D1260EE8;
	Tue, 19 Apr 2022 21:35:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E8E71BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 688F8837AC
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbTKqkH9wnlf for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:35:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 903CC833C6
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:35:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C6554FF806;
 Tue, 19 Apr 2022 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650404099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJNTKFjLfqHM2n1HMVgGBa+BKlZy5wdrbf9fzKsscz8=;
 b=MmOwlnzYUjtfQ2iQSZYrMiMZbFzIUcfIByn8hsW0FsNhzf+on7arjuYnBaHNnhW7f3Kn+o
 61pEvZvFJHmzdmg1rbk2GvcTjy/Y0bVWE8JGd1edfeuF66XnuS4i9SYPI5KCID9YIltBq+
 owHZ8sfsIWx0qMbtMOxIPARYBWkDhY8fqjxIJIaJuv9ZLfZjT8Smh9m/1Oau1HVQNTneaD
 2OkAXzofYPqw33qZO5q1CkTAsjYSE1rmN8v1JpCOBoVMycc2QuHstwmg5Fm+pmEW/0lTI7
 oKKIQ0p27IRnBl8TjpcMuuIah3bcUBVlcF8c2fKRbI5j5T2ljCWcrdLYR5AfPw==
To: Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Apr 2022 23:34:49 +0200
Message-Id: <20220419213450.887728-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] arch/Config.in.sh: move
 BR2_ARCH_HAS_MMU_MANDATORY one level up
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all SuperH cores have a MMU, and must use it, move back the
select BR2_ARCH_HAS_MMU_MANDATORY one level up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in    | 1 +
 arch/Config.in.sh | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index d0d8854c2d..49e16fce38 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -226,6 +226,7 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
 	  (RISC) instruction set architecture (ISA) developed by
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index f00954bb5e..d3acc8ccf8 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -7,16 +7,12 @@ choice
 
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4eb
 	bool "sh4eb (SH4 big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4a
 	bool "sh4a (SH4A little endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 endchoice
 
 config BR2_ARCH
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
