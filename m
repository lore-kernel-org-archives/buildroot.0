Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9792CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855924088C;
	Sun,  7 Apr 2024 15:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkDGuF2D0JQU; Sun,  7 Apr 2024 15:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2111640872
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2111640872;
	Sun,  7 Apr 2024 15:37:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F11A91BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C26660902
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZT9G0zH0aaBm for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59CCA60A45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59CCA60A45
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5414C85637; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02905fe54cb2136c15cc71d2840d60537f1513a8
X-Git-Newrev: 21c2a8ef8f91e87e8e1eb2444c9b0ec9f0a84335
X-Patchwork-Hint: ignore
Message-Id: <20240407153657.5414C85637@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vsftpd: add libxcrypt optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=21c2a8ef8f91e87e8e1eb2444c9b0ec9f0a84335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/062dbadf1f2f8e25747f7689974a693163932113

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vsftpd/Config.in | 1 +
 package/vsftpd/vsftpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 464d6f27e3..fb74b14501 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 6742843c19..14c1b6be13 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -35,6 +35,10 @@ VSFTPD_DEPENDENCIES += libcap
 VSFTPD_LIBS += -lcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+VSFTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 VSFTPD_DEPENDENCIES += linux-pam
 VSFTPD_LIBS += -lpam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
