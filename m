Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA9CEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DEFC811E7;
	Sun, 16 Jul 2023 06:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DEFC811E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HAGS6pDauGkO; Sun, 16 Jul 2023 06:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADA79813B1;
	Sun, 16 Jul 2023 06:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADA79813B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF0F1BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A154081BA9
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A154081BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjnLaH6_9UNg for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:22:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D875D81B9D
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D875D81B9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B160B870E5; Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:06:02 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 474354c08df492c94ca9b607f0355d89e4d2466b
X-Git-Newrev: 19fc429a864be5234305bf093d4f3fd234da52d5
X-Patchwork-Hint: ignore
Message-Id: <20230716062213.B160B870E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/dbus: security
 bump to version 1.2.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=19fc429a864be5234305bf093d4f3fd234da52d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

- CVE-2023-34969: Fix an assertion failure in dbus-daemon when a privileged
  Monitoring connection (dbus-monitor, busctl monitor, gdbus monitor or
  similar) is active, and a message from the bus driver cannot be delivered
  to a client connection due to <deny> rules or outgoing message quota.
  This is a denial of service if triggered maliciously by a local attacker.

- Fix an incorrect assertion that could be used to crash dbus-daemon or
  other users of DBusServer prior to authentication, if libdbus was compiled
  with assertions enabled.

For details, see the NEWS file:
https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 52ae2a4e1d10da4ea46bc730db69a40d79eb835a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 17c70004ba..0e48d4dafd 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.24.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.28.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38  dbus-1.12.24.tar.gz
+sha256  9da1e3f2b73f75eec0a9e4509d64be43909d1f2853fe809528a0a53984d76420  dbus-1.12.28.tar.gz
 
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index b3a79c431d..99d2c4301c 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.12.24
+DBUS_VERSION = 1.12.28
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
