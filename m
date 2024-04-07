Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12863CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54AF407CD;
	Sun,  7 Apr 2024 15:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQ30GDoDp8Iy; Sun,  7 Apr 2024 15:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4098640827
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4098640827;
	Sun,  7 Apr 2024 15:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70ABD1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C383407A2
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJGadd46p9-N for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56064407B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56064407B1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4075785633; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c08c98c889ef3e7622717c5247000d4f505a24ce
X-Git-Newrev: 02905fe54cb2136c15cc71d2840d60537f1513a8
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.4075785633@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: add libxcrypt optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=02905fe54cb2136c15cc71d2840d60537f1513a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/instance-0/output-1/host/lib/gcc/arc-buildroot-linux-gnu/13.1.1/../../../../arc-buildroot-linux-gnu/bin/ld: /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libaprutil-1.so: undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/f0f55d9d66b07cb3408086d2632f8cd1bebb670e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apache/Config.in | 1 +
 package/apache/apache.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..bc3133ea00 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APACHE
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_PCRE2
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Apache HTTP Server Project is an effort to develop and
 	  maintain an open-source HTTP server for modern operating
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 1b095c5eb1..619d13726e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -52,6 +52,10 @@ else
 APACHE_CONF_OPTS += --disable-brotli
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+APACHE_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
