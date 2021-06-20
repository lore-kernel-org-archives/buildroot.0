Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390B2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F131A60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F131A60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C705B414A0;
	Tue,  3 Aug 2021 23:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKTupe6fGJx7; Tue,  3 Aug 2021 23:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA94406A1;
	Tue,  3 Aug 2021 23:12:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC3DE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C43584067F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QceKiKSADxFW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91FD74063D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DFE29864A8; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:30:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 49a8f5e4e8766e085b1e83cc15af6948f000dc76
X-Git-Newrev: 0e0abdb034f50affe45e35da2891a77376c0bec7
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.DFE29864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfuse3: bump to
 version 3.10.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0e0abdb034f50affe45e35da2891a77376c0bec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From this version, tests can be disabled, so we pass
"tests=false" as a Meson option.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 49c71f402f..0414264bf8 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  c32527782cef620df58b162aa29901d1fb13253b029375d5860a2253a810344e  libfuse3-3.10.3.tar.gz
+sha256  bfcb2520fd83db29e9fefd57d3abd5285f38ad484739aeee8e03fbec9b2d984a  libfuse3-3.10.4.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index b1624ba887..fc747c5bfd 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.10.3
+LIBFUSE3_VERSION = 3.10.4
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
@@ -15,7 +15,8 @@ LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE3_CONF_OPTS = \
 	-Dexamples=false \
 	-Dudevrulesdir=/lib/udev/rules.d \
-	-Duseroot=false
+	-Duseroot=false \
+	-Dtests=false
 
 define LIBFUSE3_DEVICES
 	/dev/fuse  c  666  0  0  10  229  0  0  -
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
