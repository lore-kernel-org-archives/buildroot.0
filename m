Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1960C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 23:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 661D58200C;
	Sun, 10 Dec 2023 23:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 661D58200C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWEoQTUq6Djs; Sun, 10 Dec 2023 23:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6C3081FC7;
	Sun, 10 Dec 2023 23:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6C3081FC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D88401BF5A2
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 23:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE5D361028
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 23:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5D361028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNcvwVC2v9Hz for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 23:53:15 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85CFD6101D
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 23:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CFD6101D
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 82C62240AC7;
 Mon, 11 Dec 2023 00:53:13 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 6812E8015B;
 Mon, 11 Dec 2023 00:53:13 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 203D5240A63;
 Mon, 11 Dec 2023 00:53:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 00:53:11 +0100
Message-ID: <12337986.O9o76ZdvQC@kilian-aisec>
In-Reply-To: <87fs09oemm.fsf@48ers.dk>
References: <87y1e7sq4u.fsf@48ers.dk> <87fs09oemm.fsf@48ers.dk>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3342
X-purgate-ID: 154282::1702252393-04FEA338-C85915EE/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1702252393;
 bh=N+1tjgcnWRnb2tI+B6bTu3nuMtp/7MySKhGAppM39cE=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=2FSgSQ3L4wnA88FmykUNEB3lDXsELw9ucEmvISrlJVRTVGgTTZG+xk7RuebWvfcmq
 2C6VNb/aJMOPxyaBnXXHJDF/0XUDYOFBpjCU3NgwlHuB+kp5pBqAwuq1qyKKj1tUgC
 2Jhg6Zx7+VyUxDM8u8OmTtQpF4OnckG7Gj/Pf3vWymO4lVRRCsRu07SokcLJxRu56f
 cV/fyHrqAObcYeha+VwgeZMMViLjl0m8fpJCgBPHb81UE2JIkgBDzUXfIV8JBimlC5
 dGUM2I7Vvw+2fl5j7d9I8vtfLqGZ5W1BqKmLiqr+mTbEByM2/K5FnfOQ6MFqLubh/T
 eumDAlePaGbzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=2FSgSQ3L
Subject: Re: [Buildroot] Talos security vulnerabilities TALOS-2023-1844 /
 TALOS-2023-1845
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter, all,

as far as I see it, most package within buildroot have hash files. So, would it 
make sense, that we use the new feature and actually add hash files, if a board 
uses a custom versions of the kernel, uboot, etc.? If so, it would not be very 
convenient to add all the hash files manually. I started writing a script, 
which goes through all defconfigs an tries to identify, whether the defconfig 
uses a custom kernel, uboot, or ATF. If so, and if there exists a 
BR2_GLOBAL_PATCH_DIR in the defconfig, the script runs your "add-custom-hashes" 
script, which then adds the hash files. My script is far from perfect. But I 
wanted to ask for an opinion, before I continue putting more effort into it. 
Running the script for all defconfigs would take quite some time and probably 
use a huge amount of disk space. See a patch containing the script below. (I 
don't advocate for really adding the script to buildroot, the patch is just a 
way to share the script.)

------

From af10775dbee7d8e785cb71e4492a89f1412fe997 Mon Sep 17 00:00:00 2001
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Mon, 11 Dec 2023 00:34:53 +0100
Subject: [PATCH 1/1] Add script w. generates custom version hash files

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 utils/generate-custom-version-hash-files.sh | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100755 utils/generate-custom-version-hash-files.sh

diff --git a/utils/generate-custom-version-hash-files.sh b/utils/generate-
custom-version-hash-files.sh
new file mode 100755
index 0000000000..c5f10db616
--- /dev/null
+++ b/utils/generate-custom-version-hash-files.sh
@@ -0,0 +1,58 @@
+#!/bin/bash
+
+# This script checks all defconfigs for custom kernel, u-boot and ATF and 
tries
+# to add a hash file into the BR2_GLOBAL_PATCH_DIR, if it is set.
+
+configs_dir=./configs
+
+if [ -z ${1+x} ]
+then
+    defconfig_start="!"
+else
+    defconfig_start=$1
+fi
+
+cd ..
+
+for defconfig_path in "$configs_dir"/*
+do
+    if [[ "$defconfig_path" != *_defconfig ]]
+    then
+        continue
+    fi
+
+    defconfig_filename="$(basename -- $defconfig_path)"
+    defconfig_name=${defconfig_filename%_*}
+
+    if [ $defconfig_filename \< $defconfig_start ]
+    then
+        continue
+    fi
+
+    if ! grep -Eq "^BR2_LINUX_KERNEL_CUSTOM_VERSION=y*$|
^BR2_LINUX_KERNEL_CUSTOM_TARBALL=y*$|^BR2_TARGET_UBOOT_CUSTOM_VERSION=y*$|
^BR2_TARGET_UBOOT_CUSTOM_TARBALL=y*$|
^BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y*$|
^BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y" \
+        $defconfig_path
+    then
+        echo $defconfig_name > last_defconfig
+        continue
+    fi
+
+    if ! grep -Eq "^BR2_GLOBAL_PATCH_DIR" $defconfig_path
+    then
+        echo $defconfig_name >> unhandled_defconfigs
+        echo $defconfig_name > last_defconfig
+        continue
+    fi
+
+    if ! grep -Exq "^BR2_DOWNLOAD_FORCE_CHECK_HASHES=y" $defconfig_path
+    then
+        echo "BR2_DOWNLOAD_FORCE_CHECK_HASHES=y" >> $defconfig_path
+    fi
+
+    make clean
+    make $defconfig_filename
+    ./utils/add-custom-hashes
+
+    echo $defconfig_name >> handled_defconfigs
+    echo $defconfig_name > last_defconfig
+
+done
-- 
2.25.1






_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
