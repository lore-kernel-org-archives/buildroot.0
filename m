Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B35CF9C55
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 16:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F0042CE4;
	Fri, 20 Sep 2024 16:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uulZZVNXF4-7; Fri, 20 Sep 2024 16:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B53B42D00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B53B42D00;
	Fri, 20 Sep 2024 16:00:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17E8B1BF38E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 16:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 144BB6F6A4
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 16:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id As6MTpl4XmUs for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 16:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19F036F634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F036F634
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19F036F634
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 16:00:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DCA460009;
 Fri, 20 Sep 2024 16:00:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1srg3C-00H65r-2O;
 Fri, 20 Sep 2024 18:00:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 17:59:53 +0200
Message-Id: <20240920155955.4074868-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240920155955.4074868-1-peter@korsgaard.com>
References: <20240920155955.4074868-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 5/6] utils/scanpypi: fix typos
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 5a58550145..ad7f8befa2 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -292,7 +292,7 @@ class BuildrootPackage():
 
     def extract_package(self, tmp_path):
         """
-        Extract the package contents into a directrory
+        Extract the package contents into a directory
 
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
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
