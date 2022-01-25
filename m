Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53796C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 22:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CD382A2E;
	Tue, 25 Jan 2022 22:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HljFtzqrngY4; Tue, 25 Jan 2022 22:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94C682A17;
	Tue, 25 Jan 2022 22:15:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D21991BF2C6
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 22:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFA044032A
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 22:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRKOyl4Z9Z-n for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 22:15:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F249E401C8
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643148934;
 bh=ZTlcSuKIKgp0Q5fHe2SrYxWjBH8hZGtxRhBOLoJqgQE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=RTlxcXpYqkwkueiqDknV8T76w04PTERCbf0TT7dMdx2c7i0Jqcry7BNRB8u9rFWvY
 T2EDcf6U2KR6nqTFclal2x3DXvIRfDbL+vNGTI2Rsx1ZF8bih1vOT3qSBUdmcbKgCr
 3Af6sdpTo+lRrcg/BAhWog40Nwr6QFLEQxmQjuJY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M6llE-1nBv4a0k1e-008IRy; Tue, 25 Jan 2022 23:15:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 23:15:33 +0100
Message-Id: <20220125221533.17535-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:R+zO/UXUZiBav5c0ab7U6PcYvopo5ZNeaFycMWhDPmKESajIUnJ
 vuf+Ar8GcV0KlJy6hB6UM11QGSPWRJN8cWFr8WyR2QT6dnK6rFNMwG6ocgLFnvJVMpUeZbZ
 BuTVWUcl3WzFVwuGdDmxoVNwsm4//snYBwOcwD4eRnOtfMHquM87K40N7tZ2eOxH8QOUYfH
 6TVR75SfCDOuzrmsMpu1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ulHYgoE9u8A=:SkP4WAiJTUFP9AlHyr0Mxe
 963WmRAELjyhOApFYbCJWw/G+EYNwRw2YOiuYUh75/b4dugrqGc6EBv/20HdmgZhLLfXmfVEP
 r8dUR8FdShv+EbpY0bV04kZcuCmUXJpL12BSyiR/BYOTvYZ9kpO8g/pQaK2nEgR4VFMBF/ZJj
 R+TQ7Bog/kRUj+UUX99J1tAW3WnO0oFw0xYSoNbCqI90mneYz+3hxlQ67zCMv40liok0Eml4x
 fq7q9+/hCkY/gpQnXrqw783h6SCTRg93X2515bWvCHigFV8v5TcL/z1l3/glZSElwPaug3uCT
 rLfESfdc0tfbms4ClrcgHEYWSZXVxCtHBNwGKIrNcy/ElGf/biCvhAn7LPKS7PfgcPqwu7WND
 Js32TI1vqG6K5wd4z6FD276ywPtviYKQkyLvjQzgynglxWbyNk6jIcRFI6KA+a+HMW8IvqLNB
 EzY6sxIWDDlETuXliwDaAU/wt2R2rC8USy3JkrI6XeX/bhuPYHIoYLQbHdH9MtydPp/GTzfyM
 xs1mp7keDT+PXvUnyFAbP/XfUE5wI27BMhj+DTKrnJkZ364pjEoA67K+pmmyjvgLuku0j/gq3
 bt1Dsr11dnDfzfkxoZPZOxdjMU3PNhBXq+9+QiwEDqL6Wn0Y1+eIy3UEKxg4uxb+WStJdTP0s
 rwrNRyX92aonGTuKh82YVlM+dqKqO3i6gFLn2j5m1TR7iRiH9k42GXRyWpGLCoLLCtzS4L461
 U0OsGj9/e+Sm7F8GNvEVFrlfMQD16g/rWf81bDliIF/cCtHThdJqMGrEiJHY6m7WPqQ7JUiFP
 9yx0wqfc45zRajQaSykhqWSh7kpibZq4IIWFSHnhYrzTJNL5Ng381I38ai2UKYHBuBR1dg86G
 l4b2KLonDk3nDu4ZtC1pnNLujhKKoboDn24P+RSq89LrlXF1J+mXAUsW50c19r8ujJdGrAUaU
 lrrOw23IKOneTuvf8t8QRTGjrldcC9DwBNUEWB97PHc5oyM3Zhn2ZZE4hLxQ/T+xBAhh5kCpQ
 z6jDEIiUM7Gy8xNu4NmVfGWWPBV69j00n6+G80q0rsGr2oidxrMxWODU8H+1n7BqxGOzRymhY
 NHNgJ5Fe6bAOPE=
Subject: [Buildroot] [PATCH v2] package/util-linux: bump version to 2.37.3
 (fixes CVE-2021-3996, CVE-2021-3995)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add 'touch' workaround for missing disk-utils/raw.8 file ([1], [2]) in
  util-linux-2.37.4 release download package

For details see [1].

[1] https://www.spinics.net/lists/util-linux-ng/msg17037.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v1 -> v2:
  - add workaround for missing disk-utils/raw.8 file
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index eafbe9254a..9c10a42dca 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
-sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
+sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cf0fee409b..baf9ed3406 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.37
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -267,6 +267,13 @@ else
 UTIL_LINUX_CONF_OPTS += --without-libmagic
 endif
 
+# workaround missing disk-utils/raw.8 file in util-linux-2.37.4
+# release download package
+define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
+	touch $(@D)/disk-utils/raw.8
+endef
+UTIL_LINUX_PRE_BUILD_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
