Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BCCF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73764405A9;
	Sat, 12 Oct 2024 14:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x13GJ6h6NymS; Sat, 12 Oct 2024 14:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D646E40600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D646E40600;
	Sat, 12 Oct 2024 14:03:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26CC01BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 096D560612
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmHIOaN0VZRF for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 290A660614
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 290A660614
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D13F085C90; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:56:55 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 99686acdd3c296619b8766432fbcaf4926f162a3
X-Git-Newrev: e67617437009574971980b1e6da10664a9729044
X-Patchwork-Hint: ignore
Message-Id: <20241012140333.D13F085C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/scanpypi: fix typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=e67617437009574971980b1e6da10664a9729044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: s/contents/content/]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa79ae24a8c3422cfe293ab1b3e315fad049bd6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 5a58550145..8765a98323 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -292,7 +292,7 @@ class BuildrootPackage():
 
     def extract_package(self, tmp_path):
         """
-        Extract the package contents into a directrory
+        Extract the package content into a directory
 
         Keyword arguments:
         tmp_path -- directory where you want the package to be extracted
@@ -440,7 +440,7 @@ class BuildrootPackage():
 
     def __create_mk_download_info(self):
         """
-        Create the lines refering to the download information of the
+        Create the lines referring to the download information of the
         <package_name>.mk file
         """
         lines = []
@@ -471,7 +471,7 @@ class BuildrootPackage():
 
     def __create_mk_setup(self):
         """
-        Create the line refering to the setup method of the package of the
+        Create the line referring to the setup method of the package of the
         <package_name>.mk file
 
         There are two things you can use to make an installer
@@ -556,7 +556,7 @@ class BuildrootPackage():
 
     def __create_mk_license(self):
         """
-        Create the lines referring to the package's license informations of the
+        Create the lines referring to the package's license information of the
         <package_name>.mk file
 
         The license's files are found by searching the package (case insensitive)
@@ -755,7 +755,7 @@ def main():
                 continue
             if package.metadata_name.lower() == 'setuptools':
                 # setuptools imports itself, that does not work very well
-                # with the monkey path at the begining
+                # with the monkey path at the beginning
                 print('Error: setuptools cannot be built using scanPyPI')
                 continue
 
@@ -827,7 +827,7 @@ def main():
             print("NOTE: Remember to also make an update to the DEVELOPERS file")
             print("      and include an entry for the pkg in packages/Config.in")
             print()
-            # printing an empty line for visual confort
+            # printing an empty line for visual comfort
     finally:
         shutil.rmtree(tmp_path)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
