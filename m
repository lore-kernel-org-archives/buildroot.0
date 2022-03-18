Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24202C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47A98486D;
	Fri, 18 Mar 2022 22:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_5rTf1zMLJx; Fri, 18 Mar 2022 22:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A4F8431C;
	Fri, 18 Mar 2022 22:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DACA21BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3A3C40297
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htVzjNiQqdo1 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF4C440275
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1F3FF83944; Fri, 18 Mar 2022 22:31:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:39:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 752f478affb5eba6364f44abccdb77ad60e5f000
X-Git-Newrev: c5d441b7f2ee822112bd73643370b902ee22f9de
X-Patchwork-Hint: ignore
Message-Id: <20220318223159.1F3FF83944@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: bump to version 3.16.0
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
Content-Type: multipart/mixed; boundary="===============7969343681960310138=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7969343681960310138==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c5d441b7f2ee822112bd73643370b902ee22f9de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE OS package version to OP-TEE release 3.16.0 and set
BR2_TARGET_OPTEE_OS_LATEST to select
BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY since
python-cryptography is now needed to build optee-os.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/optee-os/Config.in     | 6 ++++--
 boot/optee-os/optee-os.hash | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index b998228121..18e1efee55 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,9 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.15.0"
+	bool "3.16.0"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +52,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.15.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.16.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 3c32e25b36..d3a2637a4e 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.15.0/optee-os-3.15.0.tar.gz
-sha256 e5bb3d9eedaf7785af091602addac5b52118f4cdc108af9cd6f6c96b21503ab8  optee-os-3.15.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.16.0/optee-os-3.16.0.tar.gz
+sha256  ebc8e18ad2039ee97c34f74a7546de9119e26f04c368b6c7fd0c55f93d33d2d6  optee-os-3.16.0.tar.gz
 # Locally computed
-sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
+sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE

--===============7969343681960310138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7969343681960310138==--
