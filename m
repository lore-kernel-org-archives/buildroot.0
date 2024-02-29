Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB35C54798
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 21:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FA4782B1A;
	Thu, 29 Feb 2024 21:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grVp-9mW9dBJ; Thu, 29 Feb 2024 21:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E5982B2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E5982B2F;
	Thu, 29 Feb 2024 21:57:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E29C21BF20F
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFEEA82B2F
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEkuoQTmIKnP for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 21:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D7ED82AF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D7ED82AF8
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 21:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 058DA87DCD; Thu, 29 Feb 2024 21:57:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 22:57:10 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ff6150db0a3c7aa342c9a308942745632657798a
X-Git-Newrev: 771af4d22973e4dc6d33c6ee75718ab10e94f0d5
X-Patchwork-Hint: ignore
Message-Id: <20240229215745.058DA87DCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/netatalk:
 security bump to version 3.1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=771af4d22973e4dc6d33c6ee75718ab10e94f0d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2022-22995: The combination of primitives offered by SMB and AFP
in their default configuration allows the arbitrary writing of files. By
exploiting these combination of primitives, an attacker can execute
arbitrary code.

https://netatalk.io/CVE-2022-22995
https://netatalk.io/3.1/ReleaseNotes3.1.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1e472e0872a71395cf8a3541b5883081e929bc11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.hash | 8 ++++----
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index a35e6bc36c..9ab5d604a8 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.17/
-md5  a6429a28948f85b69c9012fb437dd9c2  netatalk-3.1.17.tar.xz
-sha1  bc6578d9fa874b3816fd4ddd60a30a8f3aadc71d  netatalk-3.1.17.tar.xz
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.18/
+md5  b1caff4e1da534d8ca57d688c7fa3ce1  netatalk-3.1.18.tar.xz
+sha1  cbd92c95d04cfd4a9f49977970501a623310c2d9  netatalk-3.1.18.tar.xz
 # Locally computed
-sha256  8c208e2c94bf3047db33cdbc3ce4325d2b80db61d6cc527f18f9dbd8e95b5cff  netatalk-3.1.17.tar.xz
+sha256  3941effcc2c4e0dceecabc763fbb8478a2f2fbe0af4a6314983cfea452df8d47  netatalk-3.1.18.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 40e64dabeb..53cd53876a 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.17
+NETATALK_VERSION = 3.1.18
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
 NETATALK_CONFIG_SCRIPTS = netatalk-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
