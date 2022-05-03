Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC50AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 01:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DAE560FC6;
	Tue,  3 May 2022 01:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpYXBzw49lQw; Tue,  3 May 2022 01:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F0860FC9;
	Tue,  3 May 2022 01:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A8EF1BF297
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 01:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58BA7415C5
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 01:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZ9QDftlI8-9 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 01:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BD094154F
 for <buildroot@buildroot.org>; Tue,  3 May 2022 01:50:43 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id r27so12830145iot.1
 for <buildroot@buildroot.org>; Mon, 02 May 2022 18:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qun7STNXO5kXs8jwWLHZ1bJXg3o4f4ZSq29hKmZq9Oo=;
 b=Mw9+k5luBVcRfOaaEc/kr5M9Ni4540FHCmJzfbEQltw3/f6z+7XXgIvKZ8xiYb9DOC
 4E92T4K4kC+8ufWGoGtArYAdDvdh2G/GWr6Tedo6QaURUk7lfDA4km4DeOdGyhLt7+IQ
 uPsYJbMS9t6Zu6GwTeyv0GwGcR9MzqNKY0i3tzQFeDp7dEWJPxX7NfSTY2NtlLfbQCUD
 Ne3MJcVRnxXTI7xfXklIxEssrffouMQ/wYCq+UXuDXjar6V57/0xYdBxz2KdIdWkhSFj
 lcjioL3Qq5AR4a+dQpNtzJ0d2+AvML3OAWBug87EKdvxoeHBOucK3wdkDEd2TAG1w7kc
 QBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qun7STNXO5kXs8jwWLHZ1bJXg3o4f4ZSq29hKmZq9Oo=;
 b=cVT+XwIkVUIINtoV1wbVOm7IonCr+FFooj08BhxOrDNEh91vIhryFBHWPORl8YSO3/
 HYn5ijZ9Mjmm02vPGSPJY7eVBc8DYhMUFPUaWlP0RXVUIMG3e8UIaaF1p4EpURb/vEsN
 eykyWvxirWrDLkUMqz62kbxg3Qez638VP2KuZexj1vOL4Uh5iCER/70ygOfs/uHit58/
 oHblZpsiN5IU317HoEL3hALNyzi0Sa37fnWC91mz87LCo11GdGPor9YoOMhw6M2y1xlW
 KJwl088V7rWL+Jcpm3OFd8uqIvi0KihiISXWUJgefqq3QtC0WliPvEFW2naPz3NUoiru
 Eg7g==
X-Gm-Message-State: AOAM532lXHlyu2C3kHyTeSXKCih6IkmFB5DANJBjV4Sc379giQFK+bea
 UPX8rZOZ/WA5J/bMVqFewbWSLC+oPTY=
X-Google-Smtp-Source: ABdhPJxKGk+bDvomcxiAn0NVdmaakk8rY8HAK8ikPHTWQfkO+AwuMkgnBYcgti0aaMwsRKMGjfgUPw==
X-Received: by 2002:a05:6638:19c4:b0:32b:6436:f1c9 with SMTP id
 bi4-20020a05663819c400b0032b6436f1c9mr3417626jab.303.1651542642160; 
 Mon, 02 May 2022 18:50:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 u127-20020a022385000000b0032b3a7817c0sm3524670jau.132.2022.05.02.18.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 18:50:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 19:50:39 -0600
Message-Id: <20220503015039.3354269-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: only fixup host uboot
 tools source when empty
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the kconfig values being replaced are not empty we should not
try to fix them.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 70af84f002..cdd781c6c2 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -298,7 +298,9 @@ def fixup_config(sysinfo, configfile):
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
 
-    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines:
+    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
+       'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
+       'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n' in configlines:
         bootenv = os.path.join(args.outputdir, "boot_env.txt")
         with open(bootenv, "w+") as bootenvf:
             bootenvf.write("prop=value")
@@ -307,7 +309,8 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n')
         configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x1000"\n')
 
-    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines:
+    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines and \
+       'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n' in configlines:
         bootscr = os.path.join(args.outputdir, "boot_script.txt")
         with open(bootscr, "w+") as bootscrf:
             bootscrf.write("prop=value")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
