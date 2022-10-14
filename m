Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EB1C43217
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 13:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467B041BFF;
	Fri, 14 Oct 2022 13:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 467B041BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZ1TBsGOoGQq; Fri, 14 Oct 2022 13:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 065DD41887;
	Fri, 14 Oct 2022 13:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 065DD41887
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0181C1190
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D80F3400F2
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D80F3400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPMYgvLSPVmg for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC43C41194
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC43C41194
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D97EE86CA8; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 15:50:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0faa3b71c585cb70bcd6fa4bafb756b98130bd5
X-Git-Newrev: 026265bf7e09e0348aefa79e7a1f32add925f23b
X-Patchwork-Hint: ignore
Message-Id: <20221014135306.D97EE86CA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gesftpserver: bump to version 2
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

commit: https://git.buildroot.net/buildroot/commit/?id=026265bf7e09e0348aefa79e7a1f32add925f23b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Replace rjk_cv_python24 by rjk_cv_python3 due to
  https://github.com/ewxrjk/sftpserver/commit/6c0b4852a3654747e88f457a37b20530c5e426ca

http://www.chiark.greenend.org.uk/pipermail/sgo-software-announce/2022/000070.html
https://github.com/ewxrjk/sftpserver/blob/2/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...r-of-v3-attributes-according-to-draft-iet.patch | 30 ----------------------
 package/gesftpserver/gesftpserver.hash             |  2 +-
 package/gesftpserver/gesftpserver.mk               |  4 +--
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch b/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch
deleted file mode 100644
index 3697d0e525..0000000000
--- a/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4b5c7eb63894bd2b1fedeb2a8e9bd16bf3c8c555 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bernd=20Holzm=C3=BCller?=
- <bernd.holzmueller@tiggerswelt.net>
-Date: Mon, 11 Feb 2019 23:57:01 +0100
-Subject: [PATCH] Change order of v3-attributes according to
- draft-ietf-secsh-filexfer-00/02
-
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- v3.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/v3.c b/v3.c
-index 57cc31e..1fd86ad 100644
---- a/v3.c
-+++ b/v3.c
-@@ -121,8 +121,8 @@ static void v3_sendattrs(struct sftpjob *job, const struct sftpattr *attrs) {
-       fatal("sending out-of-range mtime");
-     if(a != attrs->atime.seconds)
-       fatal("sending out-of-range mtime");
--    sftp_send_uint32(job->worker, m);
-     sftp_send_uint32(job->worker, a);
-+    sftp_send_uint32(job->worker, m);
-   }
-   /* Note that we just discard unknown bits rather than reporting errors. */
- }
--- 
-2.14.1
-
diff --git a/package/gesftpserver/gesftpserver.hash b/package/gesftpserver/gesftpserver.hash
index 790cbe97c2..6d910a84dd 100644
--- a/package/gesftpserver/gesftpserver.hash
+++ b/package/gesftpserver/gesftpserver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4963b85787de3485085a5356c671c58b8b33125f528ff1b2fe8b534ed8a0c1bd  sftpserver-1.tar.gz
+sha256  b18b10405ef2b05c45450aafd6803f69efb4d2138e4e07fd186c1618027ee169  sftpserver-2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 20ad92d25a..b47ec1c5d3 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GESFTPSERVER_VERSION = 1
+GESFTPSERVER_VERSION = 2
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
 GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPL-2.0+
@@ -25,7 +25,7 @@ GESFTPSERVER_DEPENDENCIES += \
 
 # Python on the host is only used for tests, which we don't use in
 # Buildroot
-GESFTPSERVER_CONF_ENV += rjk_cv_python24=false
+GESFTPSERVER_CONF_ENV += rjk_cv_python3=false
 
 # openssh/dropbear looks here
 define GESFTPSERVER_ADD_SYMLINK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
