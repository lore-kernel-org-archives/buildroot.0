Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CCDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 15:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D92A540465;
	Sat, 30 Apr 2022 15:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-6VJrW203Z6; Sat, 30 Apr 2022 15:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D222A4040C;
	Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 330551BF28E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 191D64040C
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2-xz0gx-Xbr for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 15:46:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A09840393
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 15:46:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F0D1C846FC; Sat, 30 Apr 2022 15:35:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 17:42:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43b4017ba7c5f2636e6a3f674c63c50050956ea4
X-Git-Newrev: fdee03647f9ada725d739e3980d092c6f12d9d3b
X-Patchwork-Hint: ignore
Message-Id: <20220430153553.F0D1C846FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pahole: bump to commit 73383b3a39af
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdee03647f9ada725d739e3980d092c6f12d9d3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main goal is to use buildroot host-libbpf instead of pahole libbpf
git submodule (which ends up being the same thing anyway). However, this
creates compilation errors due to the use of deprecated APIs (like
btf__get_nr_types). Bump pahole to a commit that is compatible with
current libbpf:
73383b3a39af ("libbpf: Update libbpf to the latest git HEAD")

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pahole/pahole.hash |  2 +-
 package/pahole/pahole.mk   | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 420db15e75..8e5560b5e7 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cde85af68b368f50a913be387f94f6b43612a04af6c92387b4dcabb712a668fe  pahole-v1.23-br1.tar.gz
+sha256  3531396c0568793ef8ca1a2fbb44ef2e1e81bdd55496a4487b83ba4d95df9d99  pahole-73383b3a39afe86b22e098773e47b8546c48a649.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index da6d67e6a2..199fa8cc11 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = v1.23
-PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git
-PAHOLE_SITE_METHOD = git
-# pahole contains git submodule and relies on them to be built.
-PAHOLE_GIT_SUBMODULES = YES
-HOST_PAHOLE_DEPENDENCIES = host-elfutils
+PAHOLE_VERSION = 73383b3a39afe86b22e098773e47b8546c48a649
+PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
+HOST_PAHOLE_DEPENDENCIES = \
+	host-elfutils \
+	host-libbpf
 # Defining __LIB is needed to build pahole.
-HOST_PAHOLE_CONF_OPTS = -D__LIB=lib
+# Set LIBBPF_EMBEDDED to OFF to use host-libbpf.
+HOST_PAHOLE_CONF_OPTS = -D__LIB=lib -DLIBBPF_EMBEDDED=OFF
 PAHOLE_LICENSE = GPL-2.0
 PAHOLE_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
