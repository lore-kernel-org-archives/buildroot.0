Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A305C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FE7F401AD;
	Sun, 28 Jul 2024 19:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 149AUJVD-zsn; Sun, 28 Jul 2024 19:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E67403BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1E67403BF;
	Sun, 28 Jul 2024 19:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8725D1BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74DB0402F0
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcU5ph085UpH for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:57:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C19402BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81C19402BF
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:57:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C99B82894; Sun, 28 Jul 2024 19:57:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 21:57:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c79ec67bc8763f8d630f51ffbcaf0bb6bfb71236
X-Git-Newrev: 197e67e542c909cd4d4d45ef48faf3cae7d586b0
X-Patchwork-Hint: ignore
Message-Id: <20240728195743.7C99B82894@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkiostream: add
 BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=197e67e542c909cd4d4d45ef48faf3cae7d586b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gtkiostream only supports little-endian since its addition in commit
fab48302865e5c0c98d91b696bc90e75e38189bb resulting in the following
build failure:

In file included from BitStream.C:23:
../include/BitStream.H:35:2: error: #error "iobitstream not tested on big endian systems"
   35 | #error "iobitstream not tested on big endian systems"
      |  ^~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/aec24d92cc2196596413cf509d686f1f8d1eca95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtkiostream/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
index 1d1ec27346..334b4dc331 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -1,5 +1,10 @@
+config BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
+	bool
+	default y if BR2_ENDIAN = "LITTLE"
+
 config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
+	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
@@ -14,5 +19,6 @@ config BR2_PACKAGE_GTKIOSTREAM
 	  https://github.com/flatmax/gtkiostream
 
 comment "gtkiostream needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
