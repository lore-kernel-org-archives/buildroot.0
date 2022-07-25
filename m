Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93994C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 08:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9904157F;
	Mon, 25 Jul 2022 08:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F9904157F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvoGiHKMS28G; Mon, 25 Jul 2022 08:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB50415A3;
	Mon, 25 Jul 2022 08:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB50415A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 331FC1BF2F6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1325D4058F
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1325D4058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ql3MWHs50KSD for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 08:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0AFB4020B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0AFB4020B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9BB2485D30; Mon, 25 Jul 2022 08:14:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 10:27:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa917d0ca96baf4ef877a80e57d438bfbb8cdf2d
X-Git-Newrev: 257881e6e99b766f2a9466c7713e48cbcb96161c
X-Patchwork-Hint: ignore
Message-Id: <20220725081400.9BB2485D30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/patchelf: bump to version 0.13
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
Content-Type: multipart/mixed; boundary="===============4788628668486764921=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4788628668486764921==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=257881e6e99b766f2a9466c7713e48cbcb96161c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update third patch (and renumber it) and drop other ones as they are
upstream:

* 0001-Remove-apparently-incorrect-usage-of-static.patch
  a365bcb7d7025da51b33165ef7ebc7180199a05e

* 0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
  2e3fdc2030c75c19df6fc2924083cfad53856562

* 0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch
  e88d83c8b4e42a3358a90b781a5a98efa279ff15

* 0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
  c4deb5e9e1ce9c98a48e0d5bb37d87739b8cfee4

* 0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
  ad5f1f078b716802dfb8f7226cb1d5c720348a78

* 0007-fix-adjusting-startPage.patch
  1cc234fea5600190d872329aca60e2365cefc39e

* 0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
  83aa89addf8757e2d63aa73222f2fa9bc6d7321a

* 0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
  52ab908394958a2a5d0476e306e2cad4da4fdeae

* 0010-Fix-endianness-issues-for-powerpc-PIE.patch
  884eccc4f061a3dbdbe63a4c73f1cc9bbf77fa7d

Update indentation in hash file (two spaces)

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14191

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...o-make-the-rpath-relative-under-a-specif.patch} | 122 +++++++-------
 ...move-apparently-incorrect-usage-of-static.patch |  56 -------
 ...unction-for-splitting-a-colon-separated-s.patch |  63 --------
 ...eck-ELF-endianness-before-writing-new-run.patch |  40 -----
 ...ting-file-sizes-needlessly-and-allow-bina.patch | 176 ---------------------
 ...library-corruption-when-rerunning-patchel.patch |  55 -------
 .../patchelf/0007-fix-adjusting-startPage.patch    |  45 ------
 ...et-instead-of-sh_addr-when-checking-alrea.patch |  38 -----
 ...6-by-ignoring-the-first-section-header-wh.patch |  41 -----
 ...010-Fix-endianness-issues-for-powerpc-PIE.patch |  80 ----------
 package/patchelf/patchelf.hash                     |   4 +-
 package/patchelf/patchelf.mk                       |   5 +-
 12 files changed, 72 insertions(+), 653 deletions(-)

diff --git a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
similarity index 68%
rename from package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
rename to package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
index f9f2537a6c..8710bfb629 100644
--- a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
+++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
@@ -41,6 +41,8 @@ pending.
 [2] https://github.com/NixOS/patchelf/pull/118
 
 Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
+[Fabrice: update for 0.13]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/patchelf.cc | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++------
  1 file changed, 175 insertions(+), 21 deletions(-)
@@ -57,14 +59,14 @@ index 1d9a772..35b4a33 100644
 +
 +static bool relativeToFile = false;
 +
- static string fileName;
- static int pageSize = PAGESIZE;
- 
+ static std::vector<std::string> fileNames;
+ static std::string outputFileName;
+ static bool alwaysWrite = false;
 @@ -77,6 +81,49 @@ static unsigned int getPageSize(){
      return pageSize;
  }
  
-+static bool absolutePathExists(const string & path, string & canonicalPath)
++static bool absolutePathExists(const std::string & path, std::string & canonicalPath)
 +{
 +    char *cpath = realpath(path.c_str(), NULL);
 +    if (cpath) {
@@ -76,11 +78,11 @@ index 1d9a772..35b4a33 100644
 +    }
 +}
 +
-+static string makePathRelative(const string & path,
-+    const string & refPath)
++static std::string makePathRelative(const std::string & path,
++    const std::string & refPath)
 +{
-+    string relPath = "$ORIGIN";
-+    string p = path, refP = refPath;
++    std::string relPath = "$ORIGIN";
++    std::string p = path, refP = refPath;
 +    size_t pos;
 +
 +    /* Strip the common part of path and refPath */
@@ -90,7 +92,7 @@ index 1d9a772..35b4a33 100644
 +            break;
 +        if (p.substr(0, pos) != refP.substr(0, pos))
 +            break;
-+        if (pos == string::npos)
++        if (pos == std::string::npos)
 +            break;
 +        p = p.substr(pos);
 +        refP = refP.substr(pos);
@@ -98,7 +100,7 @@ index 1d9a772..35b4a33 100644
 +    /* Check if both pathes are equal */
 +    if (p != refP) {
 +        pos = 0;
-+        while (pos != string::npos) {
++        while (pos != std::string::npos) {
 +            pos =refP.find_first_of('/', pos + 1);
 +            relPath.append("/..");
 +        }
@@ -114,32 +116,33 @@ index 1d9a772..35b4a33 100644
  
      void setInterpreter(const string & newInterpreter);
  
--    typedef enum { rpPrint, rpShrink, rpSet, rpRemove } RPathOp;
-+    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpRemove} RPathOp;
+-    typedef enum { rpPrint, rpShrink, rpSet, rpAdd, rpRemove } RPathOp;
++    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpAdd, rpRemove} RPathOp;
 +
-+    bool libFoundInRPath(const string & dirName,
-+                         const vector<string> neededLibs,
-+                         vector<bool> & neededLibFound);
++    bool libFoundInRPath(const std::string & dirName,
++                         const std::vector<std::string> neededLibs,
++                         std::vector<bool> & neededLibFound);
  
--    void modifyRPath(RPathOp op, string newRPath);
-+    void modifyRPath(RPathOp op, string rootDir, string newRPath);
+-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
++    void modifyRPath(RPathOp op, std::string rootDir, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath, const std::string & fileName);
  
      void addNeeded(set<string> libs);
  
-@@ -1041,7 +1092,27 @@ static void concatToRPath(string & rpath, const string & path)
+@@ -1041,8 +1092,28 @@ static void concatToRPath(string & rpath, const string & path)
  
  
  template<ElfFileParams>
--void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
-+bool ElfFile<ElfFileParamNames>::libFoundInRPath(const string & dirName,
-+    const vector<string> neededLibs, vector<bool> & neededLibFound)
+-void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
+-    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath)
++bool ElfFile<ElfFileParamNames>::libFoundInRPath(const std::string & dirName,
++    const std::vector<std::string> neededLibs, std::vector<bool> & neededLibFound)
 +{
 +    /* For each library that we haven't found yet, see if it
 +       exists in this directory. */
 +    bool libFound = false;
 +    for (unsigned int j = 0; j < neededLibs.size(); ++j)
 +        if (!neededLibFound[j]) {
-+            string libName = dirName + "/" + neededLibs[j];
++            std::string libName = dirName + "/" + neededLibs[j];
 +            struct stat st;
 +            if (stat(libName.c_str(), &st) == 0) {
 +                neededLibFound[j] = true;
@@ -151,7 +154,8 @@ index 1d9a772..35b4a33 100644
 +
 +
 +template<ElfFileParams>
-+void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string rootDir, string newRPath)
++void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, std::string rootDir,
++    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath, const std::string & fileName)
  {
      Elf_Shdr & shdrDynamic = findSection(".dynamic");
  
@@ -167,7 +171,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpShrink && !rpath) {
          debug("no RPATH to shrink\n");
          return;
-@@ -1120,26 +1196,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+@@ -1120,31 +1196,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
                  continue;
              }
  
@@ -176,17 +180,22 @@ index 1d9a772..35b4a33 100644
 -            bool libFound = false;
 -            for (unsigned int j = 0; j < neededLibs.size(); ++j)
 -                if (!neededLibFound[j]) {
--                    string libName = dirName + "/" + neededLibs[j];
--                    struct stat st;
--                    if (stat(libName.c_str(), &st) == 0) {
--                        neededLibFound[j] = true;
--                        libFound = true;
+-                    std::string libName = dirName + "/" + neededLibs[j];
+-                    try {
+-                        Elf32_Half library_e_machine = getElfType(readFile(libName, sizeof(Elf32_Ehdr))).machine;
+-                        if (rdi(library_e_machine) == rdi(hdr->e_machine)) {
+-                            neededLibFound[j] = true;
+-                            libFound = true;
+-                        } else
+-                            debug("ignoring library '%s' because its machine type differs\n", libName.c_str());
+-                    } catch (SysError & e) {
+-                        if (e.errNo != ENOENT) throw;
 -                    }
 -                }
 -
 -            if (!libFound)
 +            if (!libFoundInRPath(dirName, neededLibs, neededLibFound))
-                 debug("removing directory `%s' from RPATH\n", dirName.c_str());
+                 debug("removing directory '%s' from RPATH\n", dirName.c_str());
              else
                  concatToRPath(newRPath, dirName);
          }
@@ -194,16 +203,16 @@ index 1d9a772..35b4a33 100644
  
 +    /* Make the the RPATH relative to the specified path */
 +    if (op == rpMakeRelative) {
-+        vector<bool> neededLibFound(neededLibs.size(), false);
-+        string fileDir = fileName.substr(0, fileName.find_last_of("/"));
++        std::vector<bool> neededLibFound(neededLibs.size(), false);
++        std::string fileDir = fileName.substr(0, fileName.find_last_of("/"));
 +
 +        newRPath = "";
 +
-+        vector<string> rpathDirs = splitColonDelimitedString(rpath);
-+        for (vector<string>::iterator it = rpathDirs.begin(); it != rpathDirs.end(); ++it) {
-+            const string & dirName = *it;
++        std::vector<std::string> rpathDirs = splitColonDelimitedString(rpath);
++        for (std::vector<std::string>::iterator it = rpathDirs.begin(); it != rpathDirs.end(); ++it) {
++            const std::string & dirName = *it;
 +
-+            string canonicalPath;
++            std::string canonicalPath;
 +
 +            /* Figure out if we should keep or discard the path. There are several
 +               cases to be handled:
@@ -221,7 +230,7 @@ index 1d9a772..35b4a33 100644
 +                    (can be anywhere: build trees, staging tree, host location,
 +                    non-existing location, etc.). Just discard such a path. */
 +            if (!dirName.compare(0, 7, "$ORIGIN")) {
-+                string path = fileDir + dirName.substr(7);
++                std::string path = fileDir + dirName.substr(7);
 +                if (!absolutePathExists(path, canonicalPath)) {
 +                    debug("removing directory '%s' from RPATH because '%s' doesn't exist\n",
 +                          dirName.c_str(), path.c_str());
@@ -233,7 +242,7 @@ index 1d9a772..35b4a33 100644
 +                    continue;
 +                }
 +            } else {
-+                string path = rootDir + dirName;
++                std::string path = rootDir + dirName;
 +                if (!absolutePathExists(path, canonicalPath)) {
 +                    debug("removing directory '%s' from RPATH because it's not in rootdir\n",
 +                          dirName.c_str());
@@ -263,40 +272,43 @@ index 1d9a772..35b4a33 100644
          if (!rpath) {
              debug("no RPATH to delete\n");
 @@ -1413,7 +1543,9 @@ static bool shrinkRPath = false;
- static bool removeRPath = false;
  static bool setRPath = false;
+ static bool addRPath = false;
  static bool printRPath = false;
 +static bool makeRPathRelative = false;
- static string newRPath;
-+static string rootDir;
- static set<string> neededLibsToRemove;
- static map<string, string> neededLibsToReplace;
- static set<string> neededLibsToAdd;
-@@ -1438,14 +1570,16 @@ static void patchElf2(ElfFile & elfFile)
+ static std::string newRPath;
++static std::string rootDir;
+ static std::set<std::string> neededLibsToRemove;
+ static std::map<std::string, std::string> neededLibsToReplace;
+ static std::set<std::string> neededLibsToAdd;
+@@ -1438,16 +1570,18 @@ static void patchElf2(ElfFile & elfFile)
          elfFile.setInterpreter(newInterpreter);
  
      if (printRPath)
--        elfFile.modifyRPath(elfFile.rpPrint, "");
-+        elfFile.modifyRPath(elfFile.rpPrint, "", "");
+-        elfFile.modifyRPath(elfFile.rpPrint, {}, "");
++        elfFile.modifyRPath(elfFile.rpPrint, "", {}, "", fileName);
  
      if (shrinkRPath)
--        elfFile.modifyRPath(elfFile.rpShrink, "");
-+        elfFile.modifyRPath(elfFile.rpShrink, "", "");
+-        elfFile.modifyRPath(elfFile.rpShrink, allowedRpathPrefixes, "");
++        elfFile.modifyRPath(elfFile.rpShrink, "", allowedRpathPrefixes, "", fileName);
      else if (removeRPath)
--        elfFile.modifyRPath(elfFile.rpRemove, "");
-+        elfFile.modifyRPath(elfFile.rpRemove, "", "");
+-        elfFile.modifyRPath(elfFile.rpRemove, {}, "");
++        elfFile.modifyRPath(elfFile.rpRemove, "", {}, "", fileName);
      else if (setRPath)
--        elfFile.modifyRPath(elfFile.rpSet, newRPath);
-+        elfFile.modifyRPath(elfFile.rpSet, "", newRPath);
+-        elfFile.modifyRPath(elfFile.rpSet, {}, newRPath);
++        elfFile.modifyRPath(elfFile.rpSet, "", {}, newRPath, fileName);
+     else if (addRPath)
+-        elfFile.modifyRPath(elfFile.rpAdd, {}, newRPath);
++        elfFile.modifyRPath(elfFile.rpAdd, "", {}, newRPath, fileName);
 +    else if (makeRPathRelative)
-+        elfFile.modifyRPath(elfFile.rpMakeRelative, rootDir, "");
++        elfFile.modifyRPath(elfFile.rpMakeRelative, rootDir, {}, "", fileName);
  
      if (printNeeded) elfFile.printNeededLibs();
  
 @@ -1508,6 +1642,9 @@ void showHelp(const string & progName)
-   [--set-rpath RPATH]\n\
    [--remove-rpath]\n\
    [--shrink-rpath]\n\
+   [--allowed-rpath-prefixes PREFIXES]\t\tWith '--shrink-rpath', reject rpath entries not starting with the allowed prefix\n\
 +  [--make-rpath-relative ROOTDIR]\n\
 +  [--no-standard-lib-dirs]\n\
 +  [--relative-to-file]\n\
diff --git a/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
deleted file mode 100644
index dc462eff43..0000000000
--- a/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2480efa8411523cf046094492192a5ee451aae5d Mon Sep 17 00:00:00 2001
-From: Eelco Dolstra <eelco.dolstra@logicblox.com>
-Date: Mon, 19 Sep 2016 17:31:37 +0200
-Subject: [PATCH] Remove apparently incorrect usage of "static"
-
-[Upstream-commit: https://github.com/NixOS/patchelf/commit/a365bcb7d7025da51b33165ef7ebc7180199a05e
-This patch also removes the DT_INIT symbols from needed_libs (DT_INIT
-points to library initialisation function, not to needed libraries...)]
-Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
----
- src/patchelf.cc | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 136098f..c870638 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -941,7 +941,6 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const string & newS
-     assert(strTabAddr == rdi(shdrDynStr.sh_addr));
- 
-     /* Walk through the dynamic section, look for the DT_SONAME entry. */
--    static vector<string> neededLibs;
-     dyn = (Elf_Dyn *) (contents + rdi(shdrDynamic.sh_offset));
-     Elf_Dyn * dynSoname = 0;
-     char * soname = 0;
-@@ -949,8 +948,7 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const string & newS
-         if (rdi(dyn->d_tag) == DT_SONAME) {
-             dynSoname = dyn;
-             soname = strTab + rdi(dyn->d_un.d_val);
--        } else if (rdi(dyn->d_tag) == DT_INIT)
--            neededLibs.push_back(string(strTab + rdi(dyn->d_un.d_val)));
-+        }
-     }
- 
-     if (op == printSoname) {
-@@ -1058,7 +1056,7 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
-        unless you use its `--enable-new-dtag' option, in which case it
-        generates a DT_RPATH and DT_RUNPATH pointing at the same
-        string. */
--    static vector<string> neededLibs;
-+    vector<string> neededLibs;
-     dyn = (Elf_Dyn *) (contents + rdi(shdrDynamic.sh_offset));
-     Elf_Dyn * dynRPath = 0, * dynRunPath = 0;
-     char * rpath = 0;
-@@ -1091,7 +1089,7 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
-     /* For each directory in the RPATH, check if it contains any
-        needed library. */
-     if (op == rpShrink) {
--        static vector<bool> neededLibFound(neededLibs.size(), false);
-+        vector<bool> neededLibFound(neededLibs.size(), false);
- 
-         newRPath = "";
- 
--- 
-1.9.1
-
diff --git a/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch b/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
deleted file mode 100644
index 330bea23bc..0000000000
--- a/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From a8452dc7e80eb17572c7458e33a4f4d609e6a3da Mon Sep 17 00:00:00 2001
-From: Tuomas Tynkkynen <tuomas@tuxera.com>
-Date: Fri, 3 Jun 2016 23:03:51 +0300
-Subject: [PATCH] Extract a function for splitting a colon-separated string
-
-We're going to need this logic in another place, so make a function of
-this.
-
-[Upstream-commit: https://github.com/NixOS/patchelf/commit/2e3fdc2030c75c19df6fc2924083cfad53856562]
-Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
----
- src/patchelf.cc | 28 +++++++++++++++++++---------
- 1 file changed, 19 insertions(+), 9 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index c870638..1d9a772 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -57,6 +57,22 @@ unsigned char * contents = 0;
- #define ElfFileParamNames Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym
- 
- 
-+static vector<string> splitColonDelimitedString(const char * s){
-+    vector<string> parts;
-+    const char * pos = s;
-+    while (*pos) {
-+        const char * end = strchr(pos, ':');
-+        if (!end) end = strchr(pos, 0);
-+
-+        parts.push_back(string(pos, end - pos));
-+        if (*end == ':') ++end;
-+        pos = end;
-+    }
-+
-+    return parts;
-+}
-+
-+
- static unsigned int getPageSize(){
-     return pageSize;
- }
-@@ -1093,15 +1109,9 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
- 
-         newRPath = "";
- 
--        char * pos = rpath;
--        while (*pos) {
--            char * end = strchr(pos, ':');
--            if (!end) end = strchr(pos, 0);
--
--            /* Get the name of the directory. */
--            string dirName(pos, end - pos);
--            if (*end == ':') ++end;
--            pos = end;
-+        vector<string> rpathDirs = splitColonDelimitedString(rpath);
-+        for (vector<string>::iterator it = rpathDirs.begin(); it != rpathDirs.end(); ++it) {
-+            const string & dirName = *it;
- 
-             /* Non-absolute entries are allowed (e.g., the special
-                "$ORIGIN" hack). */
--- 
-1.9.1
-
diff --git a/package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch b/package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch
deleted file mode 100644
index 8a89d3a631..0000000000
--- a/package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8c75599b674c73fbfe9c15afeccad54ae88243f5 Mon Sep 17 00:00:00 2001
-From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
-Date: Mon, 25 Jun 2018 13:05:07 -0500
-Subject: [PATCH] patchelf: Check ELF endianness before writing new runpath
-
-This commit modifies the way fields are written in the dynamic
-section in order to account the architecture of the target ELF
-file. Instead of copying the raw data, use the helper functions
-to convert endianness.
-
-Link to upstream PR: https://github.com/NixOS/patchelf/pull/151
-
-Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
----
- src/patchelf.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 35b4a33..a33f644 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -1315,13 +1315,13 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string rootDir, string
-     debug("new rpath is `%s'\n", newRPath.c_str());
- 
-     if (!forceRPath && dynRPath && !dynRunPath) { /* convert DT_RPATH to DT_RUNPATH */
--        dynRPath->d_tag = DT_RUNPATH;
-+        wri(dynRPath->d_tag, DT_RUNPATH);
-         dynRunPath = dynRPath;
-         dynRPath = 0;
-     }
- 
-     if (forceRPath && dynRPath && dynRunPath) { /* convert DT_RUNPATH to DT_RPATH */
--        dynRunPath->d_tag = DT_IGNORE;
-+        wri(dynRunPath->d_tag, DT_IGNORE);
-     }
- 
-     if (newRPath.size() <= rpathSize) {
--- 
-2.17.0
-
diff --git a/package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch b/package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
deleted file mode 100644
index 0d7931cd52..0000000000
--- a/package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From 79c093226e609b99fa889f6e37480b92b399610d Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 7 Mar 2017 21:08:34 +0000
-Subject: [PATCH] Avoid inflating file sizes needlessly and allow binaries to
- be stripped
-
-The current approach to changing sections in ET_DYN executables is to move
-the INTERP section to the end of the file. +This means changing PT_PHDR to
-add an extra PT_LOAD section so that the new section is mmaped into memory
-by the elf loader in the kernel. In order to extend PHDR, this means moving
-it to the end of the file.
-
-Its documented in BUGS there is a kernel 'bug' which means that if you have holes
-in memory between the base load address and the PT_LOAD segment that contains PHDR,
-it will pass an incorrect PHDR address to ld.so and fail to load the binary, segfaulting.
-
-To avoid this, the code currently inserts space into the binary to ensure that when
-loaded into memory there are no holes between the PT_LOAD sections. This inflates the
-binaries by many MBs in some cases. Whilst we could make them sparse, there is a second
-issue which is that strip can fail to process these binaries:
-
-$ strip fixincl
-Not enough room for program headers, try linking with -N
-[.note.ABI-tag]: Bad value
-
-This turns out to be due to libbfd not liking the relocated PHDR section either
-(https://github.com/NixOS/patchelf/issues/10).
-
-Instead this patch implements a different approach, leaving PHDR where it is but extending
-it in place to allow addition of a new PT_LOAD section. This overwrites sections in the
-binary but those get moved to the end of the file in the new PT_LOAD section.
-
-This is based on patches linked from the above github issue, however whilst the idea
-was good, the implementation wasn't correct and they've been rewritten here.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Fetch from: https://github.com/NixOS/patchelf/commit/c4deb5e9e1ce9c98a48e0d5bb37d87739b8cfee4
-
-Backported to v0.9
-
-Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
----
- src/patchelf.cc | 71 ++++++++++++++++++++++++++++---------------------
- 1 file changed, 40 insertions(+), 31 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 1d58061..c2147af 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -209,6 +209,8 @@ private:
-     string & replaceSection(const SectionName & sectionName,
-         unsigned int size);
- 
-+    bool haveReplacedSection(const SectionName & sectionName);
-+
-     void writeReplacedSections(Elf_Off & curOff,
-         Elf_Addr startAddr, Elf_Off startOffset);
- 
-@@ -632,6 +634,15 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
-     replacedSections.clear();
- }
- 
-+template<ElfFileParams>
-+bool ElfFile<ElfFileParamNames>::haveReplacedSection(const SectionName & sectionName)
-+{
-+    ReplacedSections::iterator i = replacedSections.find(sectionName);
-+
-+    if (i != replacedSections.end())
-+        return true;
-+    return false;
-+}
- 
- template<ElfFileParams>
- void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-@@ -648,52 +659,53 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
- 
-     debug("last page is 0x%llx\n", (unsigned long long) startPage);
- 
-+    /* Because we're adding a new section header, we're necessarily increasing
-+       the size of the program header table.  This can cause the first section
-+       to overlap the program header table in memory; we need to shift the first
-+       few segments to someplace else. */
-+    /* Some sections may already be replaced so account for that */
-+    unsigned int i = 1;
-+    Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
-+    while( shdrs[i].sh_addr <= pht_size && i < rdi(hdr->e_shnum) ) {
-+        if (not haveReplacedSection(getSectionName(shdrs[i])))
-+            replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
-+        i++;
-+    }
- 
--    /* Compute the total space needed for the replaced sections and
--       the program headers. */
--    off_t neededSpace = (phdrs.size() + 1) * sizeof(Elf_Phdr);
-+    /* Compute the total space needed for the replaced sections */
-+    off_t neededSpace = 0;
-     for (ReplacedSections::iterator i = replacedSections.begin();
-          i != replacedSections.end(); ++i)
-         neededSpace += roundUp(i->second.size(), sectionAlignment);
-     debug("needed space is %d\n", neededSpace);
- 
--
-     size_t startOffset = roundUp(fileSize, getPageSize());
- 
-     growFile(startOffset + neededSpace);
- 
--
-     /* Even though this file is of type ET_DYN, it could actually be
-        an executable.  For instance, Gold produces executables marked
--       ET_DYN.  In that case we can still hit the kernel bug that
--       necessitated rewriteSectionsExecutable().  However, such
--       executables also tend to start at virtual address 0, so
-+       ET_DYN as does LD when linking with pie. If we move PT_PHDR, it
-+       has to stay in the first PT_LOAD segment or any subsequent ones
-+       if they're continuous in memory due to linux kernel constraints
-+       (see BUGS). Since the end of the file would be after bss, we can't
-+       move PHDR there, we therefore choose to leave PT_PHDR where it is but
-+       move enough following sections such that we can add the extra PT_LOAD
-+       section to it. This PT_LOAD segment ensures the sections at the end of
-+       the file are mapped into memory for ld.so to process.
-+       We can't use the approach in rewriteSectionsExecutable()
-+       since DYN executables tend to start at virtual address 0, so
-        rewriteSectionsExecutable() won't work because it doesn't have
--       any virtual address space to grow downwards into.  As a
--       workaround, make sure that the virtual address of our new
--       PT_LOAD segment relative to the first PT_LOAD segment is equal
--       to its offset; otherwise we hit the kernel bug.  This may
--       require creating a hole in the executable.  The bigger the size
--       of the uninitialised data segment, the bigger the hole. */
-+       any virtual address space to grow downwards into. */
-     if (isExecutable) {
-         if (startOffset >= startPage) {
-             debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
--        } else {
--            size_t hole = startPage - startOffset;
--            /* Print a warning, because the hole could be very big. */
--            fprintf(stderr, "warning: working around a Linux kernel bug by creating a hole of %zu bytes in ‘%s’\n", hole, fileName.c_str());
--            assert(hole % getPageSize() == 0);
--            /* !!! We could create an actual hole in the file here,
--               but it's probably not worth the effort. */
--            growFile(fileSize + hole);
--            startOffset += hole;
-         }
-         startPage = startOffset;
-     }
- 
- 
--    /* Add a segment that maps the replaced sections and program
--       headers into memory. */
-+    /* Add a segment that maps the replaced sections into memory. */
-     phdrs.resize(rdi(hdr->e_phnum) + 1);
-     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
-     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
-@@ -706,15 +718,12 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
- 
- 
-     /* Write out the replaced sections. */
--    Elf_Off curOff = startOffset + phdrs.size() * sizeof(Elf_Phdr);
-+    Elf_Off curOff = startOffset;
-     writeReplacedSections(curOff, startPage, startOffset);
-     assert(curOff == startOffset + neededSpace);
- 
--
--    /* Move the program header to the start of the new area. */
--    wri(hdr->e_phoff, startOffset);
--
--    rewriteHeaders(startPage);
-+    /* Write out the updated program and section headers */
-+    rewriteHeaders(hdr->e_phoff);
- }
- 
- 
--- 
-2.17.1
-
diff --git a/package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch b/package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
deleted file mode 100644
index 9fb3e260c1..0000000000
--- a/package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 5df4791bf077127684faceeeea8bfab063e43774 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 3 Jun 2020 12:14:58 +0100
-Subject: [PATCH] Fix shared library corruption when rerunning patchelf
-
-When running patchelf on some existing patchelf'd binaries to change to longer
-RPATHS, ldd would report the binaries as invalid. The output of objdump -x on
-those libraryies should show the top of the .dynamic section is getting trashed,
-something like:
-
-0x600000001 0x0000000000429000
-0x335000 0x0000000000335000
-0xc740 0x000000000000c740
-0x1000 0x0000000000009098
-SONAME libglib-2.0.so.0
-
-(which should be RPATH and DT_NEEDED entries)
-
-This was tracked down to the code which injects the PT_LOAD section.
-
-The issue is that if the program headers were previously relocated to the end
-of the file which was how patchelf operated previously, the relocation code
-wouldn't work properly on a second run as it now assumes they're located after
-the elf header. This change forces them back to immediately follow the elf
-header which is where the code has made space for them.
-
-Should fix https://github.com/NixOS/patchelf/issues/170
-and https://github.com/NixOS/patchelf/issues/192
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Fetch from: https://github.com/NixOS/patchelf/commit/ad5f1f078b716802dfb8f7226cb1d5c720348a78
-
-Backported to v0.9
-
-Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
----
- src/patchelf.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index c2147af..1224a89 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -706,6 +706,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
- 
- 
-     /* Add a segment that maps the replaced sections into memory. */
-+    wri(hdr->e_phoff, sizeof(Elf_Ehdr));
-     phdrs.resize(rdi(hdr->e_phnum) + 1);
-     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
-     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
--- 
-2.17.1
-
diff --git a/package/patchelf/0007-fix-adjusting-startPage.patch b/package/patchelf/0007-fix-adjusting-startPage.patch
deleted file mode 100644
index fd044964e0..0000000000
--- a/package/patchelf/0007-fix-adjusting-startPage.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4a82c97e8a0677706d1d532812daaa73249768a8 Mon Sep 17 00:00:00 2001
-From: Ed Bartosh <ed.bartosh@linux.intel.com>
-Date: Fri, 21 Jul 2017 12:33:53 +0300
-Subject: [PATCH] fix adjusting startPage
-
-startPage is adjusted unconditionally for all executables.
-This results in incorrect addresses assigned to INTERP and LOAD
-program headers, which breaks patched executable.
-
-Adjusting startPage variable only when startOffset > startPage
-should fix this.
-
-This change is related to the issue NixOS#10
-
-Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
-Fetch from: https://github.com/NixOS/patchelf/commit/1cc234fea5600190d872329aca60e2365cefc39e
-
-Backported to v0.9
-
-Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
----
- src/patchelf.cc | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 1224a89..4676157 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -697,10 +697,8 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-        since DYN executables tend to start at virtual address 0, so
-        rewriteSectionsExecutable() won't work because it doesn't have
-        any virtual address space to grow downwards into. */
--    if (isExecutable) {
--        if (startOffset >= startPage) {
--            debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
--        }
-+    if (isExecutable && startOffset > startPage) {
-+        debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
-         startPage = startOffset;
-     }
- 
--- 
-2.17.1
-
diff --git a/package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch b/package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
deleted file mode 100644
index d423cad23a..0000000000
--- a/package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From cb8326de54ad7a56658b0dc8efb7da5e71684a7c Mon Sep 17 00:00:00 2001
-From: Pablo Galindo <pablogsal@gmail.com>
-Date: Tue, 22 Sep 2020 01:33:47 +0100
-Subject: [PATCH] Use sh_offset instead of sh_addr when checking already
- replaced libs
-
-When checking for already replaced libs, the check against the size must
-be done using the section header offset, not the section file address.
-This was not crashing in many situations because normally sh_address and
-sh_offset have the same value but these two may differ and using the
-sh_address value instead can cause library corruption in these
-situations.
-
-Fetch from: https://github.com/NixOS/patchelf/commit/83aa89addf8757e2d63aa73222f2fa9bc6d7321a
-
-Backported to v0.9
-
-Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
----
- src/patchelf.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 4676157..c025ae2 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -666,7 +666,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-     /* Some sections may already be replaced so account for that */
-     unsigned int i = 1;
-     Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
--    while( shdrs[i].sh_addr <= pht_size && i < rdi(hdr->e_shnum) ) {
-+    while( shdrs[i].sh_offset <= pht_size && i < rdi(hdr->e_shnum) ) {
-         if (not haveReplacedSection(getSectionName(shdrs[i])))
-             replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
-         i++;
--- 
-2.17.1
-
diff --git a/package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch b/package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
deleted file mode 100644
index a820f2d1d2..0000000000
--- a/package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e22ca2f593aa8fd392f1ac4f8dd104bc56d0d100 Mon Sep 17 00:00:00 2001
-From: Ezra Cooper <ezra@qumulo.com>
-Date: Thu, 21 Jun 2018 11:07:35 -0700
-Subject: [PATCH] Fix issue #66 by ignoring the first section header when
- sorting, and not overwriting NOBITS entries.
-
-Fetch from: https://github.com/NixOS/patchelf/commit/52ab908394958a2a5d0476e306e2cad4da4fdeae
-
-Backported to v0.9
-
-Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
----
- src/patchelf.cc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index c025ae2..fa2945e 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -435,7 +435,7 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
-     /* Sort the sections by offset. */
-     CompShdr comp;
-     comp.elfFile = this;
--    sort(shdrs.begin(), shdrs.end(), comp);
-+    sort(shdrs.begin() + 1, shdrs.end(), comp);
- 
-     /* Restore the sh_link mappings. */
-     for (unsigned int i = 1; i < rdi(hdr->e_shnum); ++i)
-@@ -586,7 +586,8 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
-     {
-         string sectionName = i->first;
-         Elf_Shdr & shdr = findSection(sectionName);
--        memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
-+        if (shdr.sh_type != SHT_NOBITS)
-+            memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
-     }
- 
-     for (ReplacedSections::iterator i = replacedSections.begin();
--- 
-2.17.1
-
diff --git a/package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch b/package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch
deleted file mode 100644
index 6a3500b91e..0000000000
--- a/package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From c61c2960d782c67566790b210163ff9c799f018a Mon Sep 17 00:00:00 2001
-From: Conrad Ratschan <ratschance@gmail.com>
-Date: Sat, 3 Oct 2020 20:17:24 -0500
-Subject: [PATCH] Fix endianness issues for powerpc PIE
-
-Previously when running `patchelf --set-rpath "/usr/sbin" my_bin` on a
-PIE ppc32 binary that had no RPATH a few issues were encountered.
-
-This commit fixes:
-
-1. The PT_PHDR being sorted improperly due to the type being read in
-   incorrect endianness
-
-3. The interpreter being clobbered due to the replace sections routine
-   reading sh_offset and sh_size in incorrect endianness
-
-4. The PHDR segment having an incorrect virt and phys address due to
-   reading the e_phoff in the incorrect endianness
-
-This also fixes a read of the shdr.sh_type in writeReplacedSections but
-this was not encountered during testing.
-
-Fetch from: https://github.com/NixOS/patchelf/commit/884eccc4f061a3dbdbe63a4c73f1cc9bbf77fa7d
-
-Backported to v0.9. Removed item 2 from the fix list as it is not
-applicable to v0.9.
-
-Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
----
- src/patchelf.cc | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index fa2945e..e60b17c 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -173,8 +173,8 @@ private:
-         ElfFile * elfFile;
-         bool operator ()(const Elf_Phdr & x, const Elf_Phdr & y)
-         {
--            if (x.p_type == PT_PHDR) return true;
--            if (y.p_type == PT_PHDR) return false;
-+            if (elfFile->rdi(x.p_type) == PT_PHDR) return true;
-+            if (elfFile->rdi(y.p_type) == PT_PHDR) return false;
-             return elfFile->rdi(x.p_paddr) < elfFile->rdi(y.p_paddr);
-         }
-     };
-@@ -586,7 +586,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
-     {
-         string sectionName = i->first;
-         Elf_Shdr & shdr = findSection(sectionName);
--        if (shdr.sh_type != SHT_NOBITS)
-+        if (rdi(shdr.sh_type) != SHT_NOBITS)
-             memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
-     }
- 
-@@ -667,9 +667,9 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-     /* Some sections may already be replaced so account for that */
-     unsigned int i = 1;
-     Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
--    while( shdrs[i].sh_offset <= pht_size && i < rdi(hdr->e_shnum) ) {
-+    while( rdi(shdrs[i].sh_offset) <= pht_size && i < rdi(hdr->e_shnum) ) {
-         if (not haveReplacedSection(getSectionName(shdrs[i])))
--            replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
-+            replaceSection(getSectionName(shdrs[i]), rdi(shdrs[i].sh_size));
-         i++;
-     }
- 
-@@ -723,7 +723,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-     assert(curOff == startOffset + neededSpace);
- 
-     /* Write out the updated program and section headers */
--    rewriteHeaders(hdr->e_phoff);
-+    rewriteHeaders(rdi(hdr->e_phoff));
- }
- 
- 
--- 
-2.17.1
-
diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
index 0f54560908..d4064fb9af 100644
--- a/package/patchelf/patchelf.hash
+++ b/package/patchelf/patchelf.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83	patchelf-0.9.tar.bz2
+sha256  4c7ed4bcfc1a114d6286e4a0d3c1a90db147a4c3adda1814ee0eee0f9ee917ed  patchelf-0.13.tar.bz2
 # License files, locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 52912e295b..c583b228a3 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PATCHELF_VERSION = 0.9
-PATCHELF_SITE = https://nixos.org/releases/patchelf/patchelf-$(PATCHELF_VERSION)
+PATCHELF_VERSION = 0.13
+PATCHELF_SITE = \
+	https://github.com/NixOS/patchelf/releases/download/$(PATCHELF_VERSION)
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING


--===============4788628668486764921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4788628668486764921==--

