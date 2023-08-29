Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CD7C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA4460FB6;
	Tue, 29 Aug 2023 21:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA4460FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmTFy775HGTg; Tue, 29 Aug 2023 21:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C2F60ECD;
	Tue, 29 Aug 2023 21:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C2F60ECD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4B31BF5A8
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5748240195
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 21:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5748240195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiIYI3CVHgki for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 21:32:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 728E34016F
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 21:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 728E34016F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BCE8864D9; Tue, 29 Aug 2023 21:32:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 14:55:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2ef47a4b56c5333bbc05ebc6f07e491646eb9ce
X-Git-Newrev: e8332e66b4f063eb842bb934e4806a26f3cacfd2
X-Patchwork-Hint: ignore
Message-Id: <20230829213208.5BCE8864D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/daemon: bump to
 version 0.8.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e8332e66b4f063eb842bb934e4806a26f3cacfd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update license info. COPYING hash updated because of added reference to
additional licenses. Licenses for local snprintf and getopt
implementations do not apply, since this code is not used for Linux
targets.

Add Tatu Ylonen Permissive license of the code in pseudo.c.

Add LGPL-2.0+ license text file.

Rename BSD-3-Clause text file and update hash because of text formatting
change.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/daemon/daemon.hash |  8 +++++---
 package/daemon/daemon.mk   | 10 +++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index 5ad7bf6ce2..f1346d269b 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,7 +1,9 @@
 # From http://www.libslack.org/daemon/
-sha256  b34b37543bba43bd086e59f4b754c8102380ae5c1728b987c890d5da4b4cf3ca  daemon-0.8.2.tar.gz
+sha256  fa28859ad341cb0a0b012c11c271814f870482013b49f710600321d379887cd1  daemon-0.8.4.tar.gz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
-sha256  35e31504fc0aec878e86900dde1d90a04404833c182f50d5678d873910bb11eb  COPYING
-sha256  5a93d5831e1297ab10fe643e1a631e83be392896da14ee2951285a79012df69d  LICENSES/BSD-3-Clause.txt
+sha256  34c8c7085e4d3920bfb8143b910d4f99194b9fc3e1cc3442c9b1b46db4382891  COPYING
+sha256  8587dc1ea896f33b657d9e57bd3bf03f0c11ce07d041f09e687f87e7a0087b38  LICENSES/LicenseRef-BSD-3-Clause-Almost.txt
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
+sha256  1aa57d2704f6783460f2750a9f3217d083ed5161eb95438ca43a5674213a7128  LICENSES/LicenseRef-Tatu-Ylonen-Permissive.txt
diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index 5e7e497ff1..d7709e03ef 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-DAEMON_VERSION = 0.8.2
+DAEMON_VERSION = 0.8.4
 DAEMON_SITE = http://libslack.org/daemon/download
-DAEMON_LICENSE = GPL-2.0+, LGPL-2.0+, BSD-3-Clause
-DAEMON_LICENSE_FILES = LICENSE COPYING LICENSES/BSD-3-Clause.txt LICENSES/GPL-2.0-or-later.txt
+DAEMON_LICENSE = GPL-2.0+, LGPL-2.0+, BSD-3-Clause, Tatu Ylonen permissive license
+DAEMON_LICENSE_FILES = LICENSE COPYING \
+	LICENSES/LicenseRef-BSD-3-Clause-Almost.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.0-or-later.txt \
+	LICENSES/LicenseRef-Tatu-Ylonen-Permissive.txt
 
 define DAEMON_CONFIGURE_CMDS
 	(cd $(@D); ./configure)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
