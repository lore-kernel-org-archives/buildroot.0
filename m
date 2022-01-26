Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1272C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9090384DF6;
	Wed, 26 Jan 2022 21:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TuIM-SnanK7W; Wed, 26 Jan 2022 21:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2DC684DF3;
	Wed, 26 Jan 2022 21:55:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFA61BF9B9
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E4DC84DF0
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMoCQgbmCIpJ for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:55:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716B784D51
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0389580538; Wed, 26 Jan 2022 21:48:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2c5bf66aceb795fbeb8e275f2df08788af1a864
X-Git-Newrev: 163509a8e0d558e6339c5489f072dfe805e0cc34
X-Patchwork-Hint: ignore
Message-Id: <20220126214844.0389580538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: bump to version 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=163509a8e0d558e6339c5489f072dfe805e0cc34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump and update project to its new location.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htpdate/Config.in       | 2 +-
 package/htpdate/S43htpdate      | 2 +-
 package/htpdate/htpdate.hash    | 4 ++--
 package/htpdate/htpdate.mk      | 6 +++---
 package/htpdate/htpdate.service | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/htpdate/Config.in b/package/htpdate/Config.in
index 42c10c308b..d2a71fb696 100644
--- a/package/htpdate/Config.in
+++ b/package/htpdate/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_HTPDATE
 	  The HTTP Time Protocol (HTP) is used to synchronize a
 	  computer's time with web servers as reference time source.
 
-	  https://github.com/angeloc/htpdate
+	  https://github.com/twekkel/htpdate
diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
index 75f9a995ff..5971d70639 100644
--- a/package/htpdate/S43htpdate
+++ b/package/htpdate/S43htpdate
@@ -9,7 +9,7 @@ test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -x "/usr/sbin/$DAEMON" \
 		-- -D -i "$PIDFILE" $HTPDATE_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index 824266c1bc..b56522ea99 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 d2cff522b8f53b00769dcca77d8025b19238ed35d702a4739dc05e387f718909  htpdate-1.2.6.tar.gz
-sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
+sha256  74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
+sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 52022346a9..200c3207a2 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.2.6
-HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
+HTPDATE_VERSION = 1.3.3
+HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HTPDATE_BUILD_OPTS = ENABLE_HTTPS=1
+HTPDATE_BUILD_OPTS = https
 HTPDATE_DEPENDENCIES += openssl host-pkgconf
 endif
 
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
index b7f1371b08..95220581d4 100644
--- a/package/htpdate/htpdate.service
+++ b/package/htpdate/htpdate.service
@@ -7,7 +7,7 @@ Type=forking
 PIDFile=/run/htpdate.pid
 Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
 EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/bin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
+ExecStart=/usr/sbin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
 
 [Install]
 WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
