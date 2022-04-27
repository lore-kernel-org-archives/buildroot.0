Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92973C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D7441956;
	Wed, 27 Apr 2022 19:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEogtr40ef-o; Wed, 27 Apr 2022 19:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7FF41929;
	Wed, 27 Apr 2022 19:44:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B394D1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0AA409EF
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9h0ANv9oy3FH for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B1CE409FC
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 848F084606; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:27:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91eba12881074e5ac51cf7219cab0da5a3fd3f20
X-Git-Newrev: ba146579d94e40bb15108b1c1589a776609b0785
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.848F084606@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: bump to version 3.17.0
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
Content-Type: multipart/mixed; boundary="===============8288396659555057281=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8288396659555057281==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba146579d94e40bb15108b1c1589a776609b0785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE OS package version to OP-TEE release 3.17.0.

Cc: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 30b6f62434..fb8a189a75 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.16.0"
+	bool "3.17.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -52,7 +52,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.16.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.17.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index d3a2637a4e..5c1047bac3 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.16.0/optee-os-3.16.0.tar.gz
-sha256  ebc8e18ad2039ee97c34f74a7546de9119e26f04c368b6c7fd0c55f93d33d2d6  optee-os-3.16.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.17.0/optee-os-3.16.0.tar.gz
+sha256  5d5a3bda83abddfeb5ee765a15525f23adf2709ba2475a05e0c5f25790c1883f  optee-os-3.17.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE

--===============8288396659555057281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8288396659555057281==--
