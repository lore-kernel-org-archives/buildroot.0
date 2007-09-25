From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 25 Sep 2007 23:52:33 +0200
Subject: [Buildroot] [patch] fix copy'n paste error in toolchain/Config.in
Message-ID: <20070925215233.GL20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently i cannot apply this hunk.
Please feel free to checkin (or i will do it tomorrow):

$ cat '/tmp/buildroot_trunk/toolchain/svn-commit.tmp'
- fix copy'n paste error
--This line, and those below, will be ignored--

M    Config.in


Index: toolchain/Config.in
===================================================================
--- toolchain/Config.in	(revision 20026)
+++ toolchain/Config.in	(working copy)
@@ -19,7 +19,7 @@ endchoice
 
 config BR2_TOOLCHAIN_SOURCE
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL
+	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if BR2_TOOLCHAIN_EXTERNAL
