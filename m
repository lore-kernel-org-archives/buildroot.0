Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A544C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5427A42EAB;
	Fri, 28 Feb 2025 16:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfZSi-ztwTuK; Fri, 28 Feb 2025 16:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25DE84F78B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25DE84F78B;
	Fri, 28 Feb 2025 16:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D7B01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8680A423D8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u964L-m5mv3S for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C1241A35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C1241A35
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CADD685E77; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 21:57:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 49a7cf412133daf3d477a000f4449e984da40e21
X-Git-Newrev: 24615d1502e2293da0bcbc34ad6042ef35e665d1
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.CADD685E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/arm-trusted-firmware:
 bump to v2.12
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8898949628576508451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8898949628576508451==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=24615d1502e2293da0bcbc34ad6042ef35e665d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see [1].

Update trusted-firmware-a version to v2.12 and add a hash file
accordingly.

Compared to v2.11, the license has changed with the additional mention
of files from the pydevicetree project under Apache 2.0 license.
As we only document the main license of TF-A, BSD-3-Clause, this change
has no impact for us.

[1] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/tags/v2.12/docs/change-log.md

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
[Julien:
  - add link to change log
  - remove v2.11 hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/arm-trusted-firmware/Config.in                       | 4 ++--
 boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash | 3 ---
 boot/arm-trusted-firmware/v2.12/arm-trusted-firmware.hash | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 4a5c7dc89c..c8deede9cd 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -14,7 +14,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v2.11"
+	bool "v2.12"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	bool "latest lts-v2.10.x"
@@ -52,7 +52,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v2.11"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.12"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "lts-v2.10.5"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION
 	default "lts-v2.8.20"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
diff --git a/boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash
deleted file mode 100644
index 984978dc11..0000000000
--- a/boot/arm-trusted-firmware/v2.11/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
-sha256  03d5088ff4fbfe989f3c807117356191c263cf27d62ee6916bde8532611728ed  docs/license.rst
diff --git a/boot/arm-trusted-firmware/v2.12/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/v2.12/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..55ea515481
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.12/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst

--===============8898949628576508451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8898949628576508451==--
