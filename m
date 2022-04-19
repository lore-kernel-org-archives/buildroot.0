Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B24C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5F2833C6;
	Tue, 19 Apr 2022 21:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhGujI6Mm8rI; Tue, 19 Apr 2022 21:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C938378C;
	Tue, 19 Apr 2022 21:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDF9C1BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC11C607F1
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_YaWBj8F0qn for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:34:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3D5560881
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:34:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8B6F8FF808;
 Tue, 19 Apr 2022 21:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650404095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09ED768C3hc4iYZucCSYFZWhv9fqMbs1dVYrX0+cvUg=;
 b=A5YWRBqQb92n3Z6kFWX0UfGTM1wa5RsF896wzrgCuzwekMOJzvITz2FfBUoTB+y7wBg9v9
 A9+jL/yOjD1RNjZ23nwq2AEc1e4jO26NJ5SjvYfYO/rm1lNS4SYE8i4h+gvMRJmbcJxDsM
 IjV4KnCPGSNNq/ZDspSualMfzRLPwb8uv7FF8tKB/UiPGWI48mKpbXeCysK5WNanF06/O2
 qY0+EI9EojxZA5Ho5W61xAn86A9V4nJ2h0HQJ/oK/gtwjeMciE81DMqltNDa1/g3k8DzQN
 hjT6aoRmOWbiH+6E2aW6XOFGooqmcMexTev6E3KwIYRLyBuXFOYUEooe5gUMYg==
To: Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 Apr 2022 23:34:46 +0200
Message-Id: <20220419213450.887728-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] arch/Config.in: remove
 BR2_ARCH_HAS_MMU_MANDATORY from BR2_aarch64*
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

Selecting BR2_ARCH_HAS_MMU_MANDATORY from BR2_aarch64 and
BR2_aarch64_be doesn't make much sense, because the actual ARM cores
described in arch/Config.in.arm then all select
BR2_ARCH_HAS_MMU_OPTIONAL. So we end up with both
BR2_ARCH_HAS_MMU_OPTIONAL and BR2_ARCH_HAS_MMU_MANDATORY, which
doesn't make any sense.

To prevent this, we remove the selection of BR2_ARCH_HAS_MMU_MANDATORY
from BR2_aarch64 and BR2_aarch64_be, and let arch/Config.in.arm do its
job. What arch/Config.in.arm does is currently incorrect, but it will
be fixed in a separate commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index e51ef60f40..d0d8854c2d 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -60,7 +60,6 @@ config BR2_armeb
 config BR2_aarch64
 	bool "AArch64 (little endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
@@ -69,7 +68,6 @@ config BR2_aarch64
 config BR2_aarch64_be
 	bool "AArch64 (big endian)"
 	select BR2_ARCH_IS_64
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
