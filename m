Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F38C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 458124019A;
	Sun, 12 Dec 2021 14:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVz74MooUuAY; Sun, 12 Dec 2021 14:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0432841285;
	Sun, 12 Dec 2021 14:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8CB51BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B62E64019A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZXGMkMZ87so for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C17C94014E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DDA0182D93; Sun, 12 Dec 2021 14:06:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:04:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04d69e105bc0de2926332ace94fb08b87cf7b5f6
X-Git-Newrev: 07230bfcbc4b3c760a1d96a2595e3557c5e7278b
X-Patchwork-Hint: ignore
Message-Id: <20211212140652.DDA0182D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: bump to version 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=07230bfcbc4b3c760a1d96a2595e3557c5e7278b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updating attached patch and configure parameters to the latest
cups version.

NOTICE changed hash: author "Michael R Sweet" changed to "OpenPrinting"

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Arnout: handle changed hash of NOTICE]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-Remove-man-from-BUILDDIRS-in-configure.patch | 21 ++++++++++++---------
 package/cups/cups.hash                              |  4 ++--
 package/cups/cups.mk                                |  6 +++---
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index 7fcf7133c8..6b81a93de2 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -8,23 +8,26 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Michael: updated for 2.3.3]
 Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
+[Angelo: updated for 2.4.0]
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 ---
  config-scripts/cups-common.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
-index a460a73..d427acb 100644
+index 3a162b6d5..fb629fdfd 100644
 --- a/config-scripts/cups-common.m4
 +++ b/config-scripts/cups-common.m4
-@@ -434,7 +434,7 @@ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
+@@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
+ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
  
- case "$COMPONENTS" in
- 	all)
--		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
-+		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
- 		;;
- 
- 	core)
+ AS_CASE(["$COMPONENTS"], [all], [
+-    BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
++    BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
+ ], [core], [
+     BUILDDIRS="tools examples locale"
+ ], [corelite], [
+
 -- 
 2.17.1
 
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 22e081255c..b0e3654b3d 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c94318a74efec86f96df  cups-2.3.3op2-source.tar.gz
+sha256  9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de  cups-2.4.0-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  1f8e5879fb8b15e3ee5111809fd3ca22c606d0897d6b5e74329e480c348e034d  NOTICE
+sha256  a2a46d024e4d78dd2475d89f2f3d905578edfeca7dcb041e1d0ba079d9a87b48  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 80aecdba5e..e406d3bc64 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.3.3op2
+CUPS_VERSION = 2.4.0
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
@@ -50,10 +50,10 @@ CUPS_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-CUPS_CONF_OPTS += --enable-gnutls
+CUPS_CONF_OPTS += --with-tls=yes
 CUPS_DEPENDENCIES += gnutls
 else
-CUPS_CONF_OPTS += --disable-gnutls
+CUPS_CONF_OPTS += --with-tls=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
