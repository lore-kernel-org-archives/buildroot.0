Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F540CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D264B610AA;
	Fri, 12 Jun 2026 11:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV57FSOz0ljd; Fri, 12 Jun 2026 11:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB74361082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263391;
	bh=AJLpEXccc/kl5SRXkDRHF6bIc2kj50Md8sjXNJdlWCc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GA+gIlzoD+Ts0N45LBYKA/f8tkf17rFmOQEmgI4Gse5182JaFh2qO/GH7GS/6U+IV
	 W2BgZeSHHqPwfRVwKmL+3FUy8feVyqGI5aPTtjBVCJr2baurN6RHQhAufzMOdGZ7k9
	 UrI4d1YByTl8HmFudISBz3eQHFtOTDqTxKeBivkYImkc0yJUwPezEXIYwHUNPhiWOR
	 46KnQ5U9y9UJck9dwY6LEgZ5j5tIGFO4yGHn87uEKkA95HfgNfBe6uk2ZIPy5z7nNw
	 OmC7sRod6YrWmum0XajR3Hvv3cF7Uo7BplvVoWQxwdVxOpQpwDFiYi71Zmh/LGHAIC
	 WF3YhBq2Paj8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB74361082;
	Fri, 12 Jun 2026 11:23:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 428FAF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34A9240655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtuOiaj2t8n2 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7599A40148
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7599A40148
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 425D087B3D; Fri, 12 Jun 2026 11:22:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:56:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4d96bd1533d9321a8d61d68230f7c0c1bb9a930c
X-Git-Newrev: 6f9ab7ffaa98314efbbc7779398b7c86bdf3dbcd
X-Patchwork-Hint: ignore
Message-Id: <20260612112220.425D087B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/at91sam9x5ek*:
 remove at91bootstrap3 license
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4037656711197035717=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4037656711197035717==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f9ab7ffaa98314efbbc7779398b7c86bdf3dbcd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When using a specific git repo and version for at91bootstrap3,
BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES defaults to "LICENSES/MIT.txt".
However the git version we use (namely v3.10.3) does not provide this
file. Actually, it does not provide a license file at all. This causes
‘make legal-info’ to fail with:

    >>> at91bootstrap3 v3.10.3 Collecting legal info
    sha256sum: /builds/buildroot.org/buildroot/output/build/at91bootstrap3-v3.10.3/LICENSES/MIT.txt: No such file or directory
    ERROR: while checking hashes from boot/at91bootstrap3/at91bootstrap3.hash
    ERROR: LICENSES/MIT.txt has wrong sha256 hash:
    ERROR: expected: 5a3809b1c2ba13b7242572322951311c584419f1f8516f665d6c06f0668d78de
    ERROR: got     :
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [boot/at91bootstrap3/at91bootstrap3.mk:112: at91bootstrap3-legal-info] Error 1

Let's be explicit that there is no license file to check.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913821 (at91sam9x5ek_mmc_dev_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913820 (at91sam9x5ek_mmc_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913819 (at91sam9x5ek_dev_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913818 (at91sam9x5ek_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1339bba787deecda28461bff591e029a38d14b53)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 configs/at91sam9x5ek_defconfig         | 1 +
 configs/at91sam9x5ek_dev_defconfig     | 1 +
 configs/at91sam9x5ek_mmc_defconfig     | 1 +
 configs/at91sam9x5ek_mmc_dev_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 775fcceae3..246d34edef 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -16,6 +16,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 0f29216736..36441f38e7 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -67,6 +67,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index a6fd7e05fc..4c2a6255bc 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 344c6c2eae..908907acda 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -69,6 +69,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y

--===============4037656711197035717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4037656711197035717==--
