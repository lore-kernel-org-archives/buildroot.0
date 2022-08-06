Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B23C25B0E
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8664381A95;
	Sat,  6 Aug 2022 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8664381A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OIaxtdhqTK0; Sat,  6 Aug 2022 21:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67EA9813EE;
	Sat,  6 Aug 2022 21:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EA9813EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFE581BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 059F9415A7
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 059F9415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5x3HZPfoZHJ for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:23:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968FA417D5
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968FA417D5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C8F9186E4D; Sat,  6 Aug 2022 21:08:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 23:22:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c6d007fc0c165d9da3bc39b48d2f2b07ce0aaf0
X-Git-Newrev: 72a009fa98a37825624f70dc2a1cf825a5999a0a
X-Patchwork-Hint: ignore
Message-Id: <20220806210853.C8F9186E4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lshw: bump to latest HEAD
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

commit: https://git.buildroot.net/buildroot/commit/?id=72a009fa98a37825624f70dc2a1cf825a5999a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-Fix-musl-build-basename-is-in-libgen.h.patch | 101 ---------------------
 ...02-Fix-musl-build-wrong-usage-of-LONG_BIT.patch |  38 --------
 package/lshw/lshw.hash                             |   2 +-
 package/lshw/lshw.mk                               |   6 +-
 4 files changed, 4 insertions(+), 143 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
