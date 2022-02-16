Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBE8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A9D60E32;
	Wed, 16 Feb 2022 19:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkjjBPGLFHuP; Wed, 16 Feb 2022 19:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A501D607A4;
	Wed, 16 Feb 2022 19:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBBB41BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C347B40874
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQQWKIQm7pXA for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:53:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0531440892
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:53:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 60FC3835A2; Wed, 16 Feb 2022 19:45:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 20:49:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f5a8485963dc0112c0201e712d599d31f0081035
X-Git-Newrev: d1ca33e81230eaa5fe41c4945075c62821128a8b
X-Patchwork-Hint: ignore
Message-Id: <20220216194559.60FC3835A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mutt: bump to version
 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1ca33e81230eaa5fe41c4945075c62821128a8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libgsasl is an optional dependency since
https://gitlab.com/muttmua/mutt/-/commit/68caf9140c8217ecf6c848460c4b4d27996b2922

http://www.mutt.org/relnotes/2.2/
https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mutt/mutt.hash |  2 +-
 package/mutt/mutt.mk   | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index d439b23aa3..bbc9d459b0 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  92a309e47e363a97d62425bcb71adceae5ab5c4c413dbcac37fa98ed70c12be0  mutt-2.1.5.tar.gz
+sha256  e84597f06d03ca82f8ca3b5ec8bc294c150709b43ed2a0177bf479c3e3345314  mutt-2.2.0.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 7e9046fe8a..51178ef03d 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.1.5
+MUTT_VERSION = 2.2.0
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
@@ -53,8 +53,15 @@ else
 MUTT_CONF_OPTS += --disable-pop
 endif
 
-# SSL support is only used by imap or pop3 module
+# SASL and SSL support are only used by imap or pop3 module
 ifneq ($(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
+ifeq ($(BR2_PACKAGE_LIBGSASL),y)
+MUTT_DEPENDENCIES += libgsasl
+MUTT_CONF_OPTS += --with-gsasl
+else
+MUTT_CONF_OPTS += --without-gsasl
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MUTT_DEPENDENCIES += openssl
 MUTT_CONF_OPTS += \
@@ -72,6 +79,7 @@ MUTT_CONF_OPTS += \
 endif
 else
 MUTT_CONF_OPTS += \
+	--without-gsasl \
 	--without-gnutls \
 	--without-ssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
