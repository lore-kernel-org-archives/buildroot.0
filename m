Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83599C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F0C843B4;
	Sat, 17 Sep 2022 14:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F0C843B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3j7MnBQO833t; Sat, 17 Sep 2022 14:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0D384399;
	Sat, 17 Sep 2022 14:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0D384399
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01ED01BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF502843B2
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF502843B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjOCu5uvsqvK for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:30:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D8C84399
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D8C84399
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E4514843AA; Sat, 17 Sep 2022 14:30:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:29:15 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6d335e61986839c27c12d34f3d748149b1432df1
X-Git-Newrev: d5ac94f8b37a0d11f7fc751902789316e0186d66
X-Patchwork-Hint: ignore
Message-Id: <20220917143031.E4514843AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libinput: remove
 python tools scripts
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5ac94f8b37a0d11f7fc751902789316e0186d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Some libinput tools are actually python scripts and requires at least
tree python modules: libevdev, pyudev and pyyaml:

libinput]$ file *
libinput-analyze:                   ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-analyze-per-slot-delta:    Python script, UTF-8 Unicode text executable
libinput-analyze-recording:         Python script, UTF-8 Unicode text executable
libinput-analyze-touch-down-state:  Python script, UTF-8 Unicode text executable
libinput-debug-events:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-debug-tablet:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-list-devices:              ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-measure:                   ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-measure-fuzz:              Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-pressure: Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-size:     Python script, UTF-8 Unicode text executable
libinput-measure-touchpad-tap:      Python script, UTF-8 Unicode text executable
libinput-measure-touch-size:        Python script, UTF-8 Unicode text executable
libinput-quirks:                    ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-record:                    ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-uClibc.so.0, stripped
libinput-replay:                    Python script, UTF-8 Unicode text executable

Since for now we do not have a python-libevdev package, this commit
unconditionally removes Python scripts.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bf85b8e267b5fbbf817408d93435504ab458c01e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a66b0afde5..1529411355 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -30,4 +30,21 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
+	libinput-analyze-recording \
+	libinput-analyze-touch-down-state \
+	libinput-measure-fuzz \
+	libinput-measure-touchpad-pressure \
+	libinput-measure-touchpad-size \
+	libinput-measure-touchpad-tap \
+	libinput-measure-touch-size \
+	libinput-replay
+
+define LIBINPUT_REMOVE_UNNEEDED_FILES
+	$(foreach f,$(LIBINPUT_PYTHON_TOOLS), \
+		rm -f $(TARGET_DIR)/usr/libexec/libinput/$(f)
+	)
+endef
+LIBINPUT_POST_INSTALL_TARGET_HOOKS += LIBINPUT_REMOVE_UNNEEDED_FILES
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
