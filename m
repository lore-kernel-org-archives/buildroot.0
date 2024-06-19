Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC91AC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99503413D4;
	Wed, 19 Jun 2024 20:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXd34SS0GIcZ; Wed, 19 Jun 2024 20:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3130641563
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3130641563;
	Wed, 19 Jun 2024 20:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD95B1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C94B66065F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1l_7Iwm4two for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3D1260684
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3D1260684
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFD9B88030; Wed, 19 Jun 2024 20:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 22:12:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6b6587629e4fb902b990bab1fe7acbf7424c248
X-Git-Newrev: 62ee2060bbcfdb5b36a0ab41dc212e76b2a08815
X-Patchwork-Hint: ignore
Message-Id: <20240619201642.CFD9B88030@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pinentry: bump to version 1.3.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62ee2060bbcfdb5b36a0ab41dc212e76b2a08815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1]

License file hash changed, after updating the FSF address in [2].

The sha256 hash is moved out the "Locally computed" section in the hash
file, since it is now published on [3].

pinentry 1.3.0 updated its gpg-error.m4 macro file in [4] to detect
gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
will work in all host environments. See the log entry of commit
d7f2d8403e "package/gnupg2: fix build failure when host provides an
old gpgrt-config" [5] for a complete explanation.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=1ea7e76f836fe15fe7c59b954d7aab768bd090e6
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=66abf7cb1e1bde1ec71e13690dc6d6944c89cae9
[3] https://www.gnupg.org/download/integrity_check.html
[4] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=21e85333f9669ef369376e83eb80ccd7a8933842
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pinentry/pinentry.hash | 6 +++---
 package/pinentry/pinentry.mk   | 6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 187c86f9bd..9c54520da6 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  29daaf45f15cb5b8ec9b4a06284343f7a87082fb  pinentry-1.2.1.tar.bz2
+sha1  28effa1722865786cb984f3099a32db40f96ea26  pinentry-1.3.0.tar.bz2
+sha256  9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de  pinentry-1.3.0.tar.bz2
 # Locally computed
-sha256  457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067  pinentry-1.2.1.tar.bz2
-sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 338d61af2d..b49037c91b 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.2.1
+PINENTRY_VERSION = 1.3.0
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
@@ -18,6 +18,10 @@ PINENTRY_CONF_OPTS += \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--without-libcap       # requires PAM
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+PINENTRY_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PINENTRY_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
