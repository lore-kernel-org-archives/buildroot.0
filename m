Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F07C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD1660EC9;
	Mon, 24 Jun 2024 20:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3u0NYJu5Aaws; Mon, 24 Jun 2024 20:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3D06102D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D3D06102D;
	Mon, 24 Jun 2024 20:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27AC21BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A7D408E3
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDv0qG9m75RU for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE0B408E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE0B408E7
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7712C82B64; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:43:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc3f703913fb726a782079f7570b573272492dbf
X-Git-Newrev: 2d23a97a791e874bee86bc5dbcf9949aa467fc3c
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.7712C82B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/patchelf: update the patch to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d23a97a791e874bee86bc5dbcf9949aa467fc3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...to-make-the-rpath-relative-under-a-specif.patch | 48 +++++++++++-----------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
index 8710bfb629..c29fac7d9f 100644
--- a/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
+++ b/package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch
@@ -1,4 +1,4 @@
-From 618220bfb55c875d6a4d197cb24fe632ac93ec85 Mon Sep 17 00:00:00 2001
+From 6e8915572db65cf63b7a82f9b24af6f9cad92ba7 Mon Sep 17 00:00:00 2001
 From: Wolfgang Grandegger <wg@grandegger.com>
 Date: Mon, 20 Feb 2017 16:29:24 +0100
 Subject: [PATCH] Add option to make the rpath relative under a specified root
@@ -43,15 +43,17 @@ pending.
 Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
 [Fabrice: update for 0.13]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- src/patchelf.cc | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 175 insertions(+), 21 deletions(-)
+ src/patchelf.cc | 199 +++++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 171 insertions(+), 28 deletions(-)
 
 diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 1d9a772..35b4a33 100644
+index fd1e7b7b61c3..f3b7ba8867bf 100644
 --- a/src/patchelf.cc
 +++ b/src/patchelf.cc
-@@ -46,6 +46,10 @@ static bool debugMode = false;
+@@ -45,6 +45,10 @@ static bool debugMode = false;
  
  static bool forceRPath = false;
  
@@ -62,8 +64,8 @@ index 1d9a772..35b4a33 100644
  static std::vector<std::string> fileNames;
  static std::string outputFileName;
  static bool alwaysWrite = false;
-@@ -77,6 +81,49 @@ static unsigned int getPageSize(){
-     return pageSize;
+@@ -81,6 +85,49 @@ static bool hasAllowedPrefix(const std::string & s, const std::vector<std::strin
+     return std::any_of(allowedPrefixes.begin(), allowedPrefixes.end(), [&](const std::string & i) { return !s.compare(0, i.size(), i); });
  }
  
 +static bool absolutePathExists(const std::string & path, std::string & canonicalPath)
@@ -112,23 +114,23 @@ index 1d9a772..35b4a33 100644
  
  template<ElfFileParams>
  class ElfFile
-@@ -183,9 +230,13 @@ public:
+@@ -197,9 +244,13 @@ public:
  
-     void setInterpreter(const string & newInterpreter);
+     void setInterpreter(const std::string & newInterpreter);
  
 -    typedef enum { rpPrint, rpShrink, rpSet, rpAdd, rpRemove } RPathOp;
 +    typedef enum { rpPrint, rpShrink, rpMakeRelative, rpSet, rpAdd, rpRemove} RPathOp;
-+
+ 
+-    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
 +    bool libFoundInRPath(const std::string & dirName,
 +                         const std::vector<std::string> neededLibs,
 +                         std::vector<bool> & neededLibFound);
- 
--    void modifyRPath(RPathOp op, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath);
++
 +    void modifyRPath(RPathOp op, std::string rootDir, const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath, const std::string & fileName);
  
-     void addNeeded(set<string> libs);
+     void addNeeded(const std::set<std::string> & libs);
  
-@@ -1041,8 +1092,28 @@ static void concatToRPath(string & rpath, const string & path)
+@@ -1267,8 +1318,28 @@ static void concatToRPath(std::string & rpath, const std::string & path)
  
  
  template<ElfFileParams>
@@ -157,9 +159,9 @@ index 1d9a772..35b4a33 100644
 +void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, std::string rootDir,
 +    const std::vector<std::string> & allowedRpathPrefixes, std::string newRPath, const std::string & fileName)
  {
-     Elf_Shdr & shdrDynamic = findSection(".dynamic");
+     auto shdrDynamic = findSection(".dynamic");
  
-@@ -1096,6 +1167,11 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+@@ -1314,6 +1385,11 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
          return;
      }
  
@@ -171,7 +173,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpShrink && !rpath) {
          debug("no RPATH to shrink\n");
          return;
-@@ -1120,31 +1196,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
+@@ -1343,31 +1419,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op,
                  continue;
              }
  
@@ -271,7 +273,7 @@ index 1d9a772..35b4a33 100644
      if (op == rpRemove) {
          if (!rpath) {
              debug("no RPATH to delete\n");
-@@ -1413,7 +1543,9 @@ static bool shrinkRPath = false;
+@@ -1736,7 +1861,9 @@ static bool removeRPath = false;
  static bool setRPath = false;
  static bool addRPath = false;
  static bool printRPath = false;
@@ -281,7 +283,7 @@ index 1d9a772..35b4a33 100644
  static std::set<std::string> neededLibsToRemove;
  static std::map<std::string, std::string> neededLibsToReplace;
  static std::set<std::string> neededLibsToAdd;
-@@ -1438,16 +1570,18 @@ static void patchElf2(ElfFile & elfFile)
+@@ -1760,16 +1887,18 @@ static void patchElf2(ElfFile && elfFile, const FileContents & fileContents, con
          elfFile.setInterpreter(newInterpreter);
  
      if (printRPath)
@@ -305,7 +307,7 @@ index 1d9a772..35b4a33 100644
  
      if (printNeeded) elfFile.printNeededLibs();
  
-@@ -1508,6 +1642,9 @@ void showHelp(const string & progName)
+@@ -1821,6 +1950,9 @@ void showHelp(const std::string & progName)
    [--remove-rpath]\n\
    [--shrink-rpath]\n\
    [--allowed-rpath-prefixes PREFIXES]\t\tWith '--shrink-rpath', reject rpath entries not starting with the allowed prefix\n\
@@ -315,8 +317,8 @@ index 1d9a772..35b4a33 100644
    [--print-rpath]\n\
    [--force-rpath]\n\
    [--add-needed LIBRARY]\n\
-@@ -1564,6 +1701,17 @@ int main(int argc, char * * argv)
-             setRPath = true;
+@@ -1889,6 +2021,17 @@ int mainWrapped(int argc, char * * argv)
+             addRPath = true;
              newRPath = argv[i];
          }
 +        else if (arg == "--make-rpath-relative") {
@@ -334,5 +336,5 @@ index 1d9a772..35b4a33 100644
              printRPath = true;
          }
 -- 
-1.9.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
