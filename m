Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C0E54099B;
	Mon, 21 Mar 2022 16:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjy6Ay7Zl6pQ; Mon, 21 Mar 2022 16:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D5440207;
	Mon, 21 Mar 2022 16:58:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7801BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0EAF60EF1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkPMeQ2v-Jtp for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C7C60F02
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:55:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3F25684BCD; Mon, 21 Mar 2022 16:46:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:39:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2d31474b95c823757b231950369b29121eb272fb
X-Git-Newrev: 4a1adaa78b4df8c3cfce3e525192dc01293e1481
X-Patchwork-Hint: ignore
Message-Id: <20220321164613.3F25684BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/timescaledb:
 security bump to version 2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a1adaa78b4df8c3cfce3e525192dc01293e1481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-24128: Timescale TimescaleDB 1.x and 2.x before 2.5.2 may
allow privilege escalation during extension installation. The
installation process uses commands such as CREATE x IF NOT EXIST that
allow an unprivileged user to precreate objects. These objects will be
used by the installer (which executes as Superuser), leading to
privilege escalation. In order to be able to take advantage of this, an
unprivileged user would need to be able to create objects in a database
and then get a Superuser to install TimescaleDB into their database. (In
the fixed versions, the installation aborts when it finds that an object
already exists.)

"This release contains bug fixes since the 2.5.1 release.
This release is high priority for upgrade. We strongly recommend that
you upgrade as soon as possible."

https://github.com/timescale/timescaledb/releases/tag/2.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3398e8e6d4ecb3e06be6e41daf0a7a6542dc5116)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 5690ce65b3..556cdaf329 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  58a34a7a3a571339a019c0ae999b4ebb9f93e1e0cb828501e32bb073e0a25eac  timescaledb-2.5.1.tar.gz
+sha256  b1a20832189c22ce378f009f9a24ef1db61d7131f7f79bde74fdcde87bcf2d7c  timescaledb-2.5.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index b1e4342fe9..1d8b2a69a7 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.5.1
+TIMESCALEDB_VERSION = 2.5.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
