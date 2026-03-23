Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804BFF483F7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08FF60843;
	Mon, 23 Mar 2026 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0qyi9eFayfg; Mon, 23 Mar 2026 20:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257A7607E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774297667;
	bh=Xcci62xrKUj5MPCSw0BuPCmj7dYbzqloJjDyDdWvQYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gjqAUeMCFjaszZhqt7jb7AggkRcOh5HfapKPswmWFpmMGVr/I0R7xf6pICNryP2WG
	 +vI+eHqbPZNEaceYIm83jxt33N3G0ci0UPrw7qo5jFsq6P1ON0HjidWWhsyXJ91VSK
	 /8md+h62xvtLy2VB/ccupByT60jX+h2Rx1zo7JFTsqo/mwaFdMReR0QgOBvWIZXk1a
	 OPCMw/KQxz55Qj7nVwwmhGpJSnENBgI+pef9J2EFm+QJd2LX2UI3yVJjRIWgtZ82zj
	 kRYv68xy9rFlmVmEk4mcE6ZkJGqH0Cnz6rhupgZgIkrq+kKgCTv/ynKOYlxihROCG1
	 0Vh4tzyANC7aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257A7607E4;
	Mon, 23 Mar 2026 20:27:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AE6FF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C69E400B0
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tW6DKoZ20w3f for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714FE40081
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714FE40081
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:27:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D05484159; Mon, 23 Mar 2026 20:27:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:22:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf9a58b042feca2366107593904c14331ad5799a
X-Git-Newrev: dd75f2f6a08f8275040976a2517eaf17242482b9
X-Patchwork-Hint: ignore
Message-Id: <20260323202743.8D05484159@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.18.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd75f2f6a08f8275040976a2517eaf17242482b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index e80d39ac56..0274d179fb 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  adb6b7eed09331d72cbbe6d5ef3597024ab46a1d61c6ca7cdd495e51600f8957  libfuse3-3.18.1.tar.gz
+sha256  55a97cfd8661a9b42ff0123b44af52cac49feaec36987f4d968c046f93b42e1d  libfuse3-3.18.2.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6418c5798b..5492d997c3 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.18.1
+LIBFUSE3_VERSION = 3.18.2
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
