Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4C5EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD6A612A1;
	Sun, 25 Jun 2023 19:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDD6A612A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TN74TloGKXze; Sun, 25 Jun 2023 19:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E2B60BCD;
	Sun, 25 Jun 2023 19:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E2B60BCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1910B1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6ADD60BCD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6ADD60BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jqn9cjVQW7Iw for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:26:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008E86070A
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008E86070A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D571E84CA1; Sun, 25 Jun 2023 19:26:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:24:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afbc2f47fb0bd820e5a98e14c2271f016b9fdce4
X-Git-Newrev: 52ae2a4e1d10da4ea46bc730db69a40d79eb835a
X-Patchwork-Hint: ignore
Message-Id: <20230625192619.D571E84CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus: security bump to version
 1.2.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=52ae2a4e1d10da4ea46bc730db69a40d79eb835a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
