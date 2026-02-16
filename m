Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958D9E8383C
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 327E760E1D;
	Mon, 16 Feb 2026 21:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uybVjTzKFoO; Mon, 16 Feb 2026 21:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC10660E15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771278064;
	bh=1RnB6i4tU7VTPpfWz321swIGFh+DbAXSMeq/eyPoxKQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rOt2ipL8j2Wdu/q7mjcjF/AItLMXW9ziV/nFmAsbDD7Q6d3FTSinWxRrk3xtmJ5j4
	 bqssBeq1L7nB6zP0Yb60mrPkO7cGWbY9Wj/ZtdDck6tX0eK/yPgiSwBxUBU3J/Ay5Q
	 Nr4KKa2EFslSqZdnnb1tmCRjPcw1oUSStQnHodJDOEzw0a4JY+62j+0UTT5W7qqNJI
	 oW7PSLtaUOcvlK0LWPi8AxZOtuU3pDok/zzcz8zHZTOofOVBsd0fHIRnoKF/3CUNTG
	 1hERnJ+e8xRLJ3qLN3j8ItRehaBpriYEMA3UfqB20KBhRO/kxEQ4RnqCMs68suua13
	 51zTTF2OsGJ5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC10660E15;
	Mon, 16 Feb 2026 21:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CBF1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D0340C3C
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6RiqGCXBVfX for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 21:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC0A740C39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC0A740C39
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:41:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D16D86F50; Mon, 16 Feb 2026 21:41:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 21:56:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 388b9b5965c32e90caf5991b81d95e451b5a2165
X-Git-Newrev: 13034387c4ce31eff70dbef5578635a6aa3d4110
X-Patchwork-Hint: ignore
Message-Id: <20260216214101.9D16D86F50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: bump to
 binutils 2.46.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13034387c4ce31eff70dbef5578635a6aa3d4110
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the binutils-bare-metal package to version 2.46.0.

Release notes can be found here:
https://sourceware.org/pipermail/binutils/2026-February/148149.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
index 9fec966c72..99556d8b15 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
+sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3d1b9db343..3239dfb18a 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.45.1
+BINUTILS_BARE_METAL_VERSION = 2.46.0
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
