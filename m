Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7826FC19F2D
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 07:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F33C741C72;
	Fri,  5 Aug 2022 07:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F33C741C72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzGAlY6qx9Gx; Fri,  5 Aug 2022 07:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F3A41C5A;
	Fri,  5 Aug 2022 07:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F3A41C5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBC721BF869
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E1F417E0
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E1F417E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZC4QCG4x6ru for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 07:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2504F4176A
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2504F4176A
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 07:23:47 +0000 (UTC)
Received: from opfedar03.francetelecom.fr (unknown [xx.xx.xx.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar21.francetelecom.fr (ESMTP service) with ESMTPS id 4LzcXJ4Z4Rz7tjr
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 09:23:44 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 09:23:42 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 5 Aug 2022 09:23:38 +0200
Message-ID: <11585_1659684224_62ECC580_11585_350_1_1272f902a9c39fd382b82b6054b7ca8034086c08.1659683862.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
References: <89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1659684224;
 bh=sd5iACKVgSl9ffQy1FJwLShS5vn3dIvKoQIwrgaYe9k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=c46/UNQx0Er71bN6RX0cbw9wNdNO4Bz6CYMmCHeODenG5u3Z9d5WNhw3PJaoQGFbS
 GMja0n8E4yNviFOI8CFp9jEPrXdKEhSifC7TPtyiraMWURjiYr0nHXvFE7RVK/8+uk
 SWZbTO0MVdsBnuEgk96XTSokG4PMydfa1U7wPAb0y7PKpTX5fflfxOWLteCZ0qzail
 PZVxhU3TYHzLhtlD8KleLuy7O8YjsKDmdCr4tMh7r0q+fUuyxv4BLyhj3ds63RdsYP
 4FHEDGqdzLGwu/MIYmQhYg97lihK+7UAGGb9pH5hBmlrAt0Rt2fLiCNJHXfiFaqnWu
 OIHcRSd8kveHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=c46/UNQx
Subject: [Buildroot] [PATCH 3/3] package/lshw: bump to latest HEAD
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

lshw is seldom released, the last one being more than two years ago.
Although the amount of changes is not huge, there have been some
significant changes and fixes, so it warrants a bump to the current
HEAD of the git repo.

lshw tries to build the translations with msgfmt, but as a development
and debugging aid, or as a backend to other scripts, translations are
not really useful. We disable that by overriding the LANGUAGES
variables to an empty list.

Patches are dropped: the basename() patch has been superseded by an
upstream change (introduced shortname() as a wrapper to it), and the
LONG_BIT fix has been applied. It was a bit difficult to find, as
upstream has not applied the patches, nor kept authorship, nor kept the
commit logs...

Of noteworthy attention, this fixes the JSON output format (at least for
the flaws we were hitting in our cases).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 ...x-musl-build-basename-is-in-libgen.h.patch | 101 ------------------
 ...x-musl-build-wrong-usage-of-LONG_BIT.patch |  38 -------
 package/lshw/lshw.hash                        |   2 +-
 package/lshw/lshw.mk                          |   6 +-
 4 files changed, 4 insertions(+), 143 deletions(-)
 delete mode 100644 package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
 delete mode 100644 package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch

diff --git a/package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch b/package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
deleted file mode 100644
index 0917260d4c..0000000000
--- a/package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 6bc5abf99ef01e5aeea4f5bce5f5bff7f1b8ddd9 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sat, 4 Jul 2020 20:02:53 -0300
-Subject: [PATCH] Fix musl build: basename() is in libgen.h.
-
-Also, its argument is not const, so add const_cast.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- src/core/sysfs.cc | 19 ++++++++++---------
- 1 file changed, 10 insertions(+), 9 deletions(-)
-
-diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
-index 32d65642f157..c2fa84fe8d0f 100644
---- a/src/core/sysfs.cc
-+++ b/src/core/sysfs.cc
-@@ -16,6 +16,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/mount.h>
-+#include <libgen.h>
- 
- 
- __ID("@(#) $Id$");
-@@ -100,7 +101,7 @@ static string sysfs_getbustype(const string & path)
-   {
-     devname =
-       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
--      "/devices/" + basename(path.c_str());
-+      "/devices/" + basename(const_cast<char*>(path.c_str()));
- 
-     if (samefile(devname, path))
-       return string(namelist[i]->d_name);
-@@ -140,7 +141,7 @@ static string sysfstobusinfo(const string & path)
- 
-   if (bustype == "usb")
-   {
--    string name = basename(path.c_str());
-+    string name = basename(const_cast<char*>(path.c_str()));
-     if (matches(name, "^[0-9]+-[0-9]+(\\.[0-9]+)*:[0-9]+\\.[0-9]+$"))
-     {
-       size_t colon = name.rfind(":");
-@@ -151,7 +152,7 @@ static string sysfstobusinfo(const string & path)
- 
-   if (bustype == "virtio")
-   {
--    string name = basename(path.c_str());
-+    string name = basename(const_cast<char*>(path.c_str()));
-     if (name.compare(0, 6, "virtio") == 0)
-       return "virtio@" + name.substr(6);
-     else
-@@ -159,10 +160,10 @@ static string sysfstobusinfo(const string & path)
-   }
- 
-   if (bustype == "vio")
--    return string("vio@") + basename(path.c_str());
-+    return string("vio@") + basename(const_cast<char*>(path.c_str()));
- 
-   if (bustype == "ccw")
--    return string("ccw@") + basename(path.c_str());
-+    return string("ccw@") + basename(const_cast<char*>(path.c_str()));
- 
-   if (bustype == "ccwgroup")
-   {
-@@ -240,7 +241,7 @@ string entry::driver() const
-   string driverlink = This->devpath + "/driver";
-   if (!exists(driverlink))
-     return "";
--  return basename(readlink(driverlink).c_str());
-+  return basename(const_cast<char*>(readlink(driverlink).c_str()));
- }
- 
- 
-@@ -328,7 +329,7 @@ string entry::name_in_class(const string & classname) const
- 
- string entry::name() const
- {
--  return basename(This->devpath.c_str());
-+  return basename(const_cast<char*>(This->devpath.c_str()));
- }
- 
- 
-@@ -340,12 +341,12 @@ entry entry::parent() const
- 
- string entry::classname() const
- {
--  return basename(dirname(This->devpath).c_str());
-+  return basename(const_cast<char*>(dirname(This->devpath).c_str()));
- }
- 
- bool entry::isvirtual() const
- {
--  return string(basename(dirname(dirname(This->devpath)).c_str())) == "virtual";
-+  return string(basename(const_cast<char*>(dirname(dirname(This->devpath)).c_str()))) == "virtual";
- }
- 
- string entry::string_attr(const string & name, const string & def) const
--- 
-2.17.1
-
diff --git a/package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch b/package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch
deleted file mode 100644
index dd8bdb5beb..0000000000
--- a/package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 246b9e07f22d551fae0718315273760c087b79ca Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sat, 4 Jul 2020 20:28:26 -0300
-Subject: [PATCH] Fix musl build: wrong usage of LONG_BIT
-
-LONG_BIT is not a sysconf value, it is either 32 or 64. Using it as
-a sysconf value will give weird results.
-
-Originally it was sysconf(_SC_LONG_BIT) (before it was "fixed" by the
-gentoo guys). But this is useless: it will always return a value
-equal to LONG_BIT: it's either compiled 32-bit or 64-bit so a runtime
-lookup doesn't make sense. For this reason, musl has removed the
-definition of _SC_LONG_BIT.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/core/abi.cc | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/src/core/abi.cc b/src/core/abi.cc
-index adff7b55acfa..76c664c03ce7 100644
---- a/src/core/abi.cc
-+++ b/src/core/abi.cc
-@@ -20,9 +20,7 @@ __ID("@(#) $Id: mem.cc 1352 2006-05-27 23:54:13Z ezix $");
- bool scan_abi(hwNode & system)
- {
-   // are we compiled as 32- or 64-bit process ?
--  long sc = sysconf(LONG_BIT);
--  if(sc==-1) sc = sysconf(_SC_LONG_BIT);
--  if(sc!=-1) system.setWidth(sc);
-+  system.setWidth(LONG_BIT);
- 
-   pushd(PROC_SYS);
- 
--- 
-2.17.1
-
diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 0b60b3b572..5626d7131e 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9bb347ac87142339a366a1759ac845e3dbb337ec000aa1b99b50ac6758a80f80  lshw-B.02.19.2.tar.gz
+sha256  c62c89d4b3305d897bd644524bbc816c1793c41c9fea10381b75f9d5b074e056  lshw-d76afbaaf40e953243da921844cddff8185324f3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 45b22e88e3..bf286647b6 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LSHW_VERSION = 02.19.2
-LSHW_SITE = http://ezix.org/software/files
-LSHW_SOURCE = lshw-B.$(LSHW_VERSION).tar.gz
+LSHW_VERSION = d76afbaaf40e953243da921844cddff8185324f3
+LSHW_SITE = $(call github,lyonel,lshw,$(LSHW_VERSION))
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
@@ -16,6 +15,7 @@ LSHW_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	AR="$(TARGET_AR)" \
+	LANGUAGES= \
 	RPM_OPT_FLAGS="$(TARGET_CFLAGS)"
 
 LSHW_MAKE_ENV = \
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
