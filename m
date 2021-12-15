Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC4EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 22:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0615783131;
	Wed, 15 Dec 2021 22:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_ZQdyQPKugx; Wed, 15 Dec 2021 22:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 167CB830C5;
	Wed, 15 Dec 2021 22:10:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654DE1BF44A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50148415F7
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 772tdOSBMLBm for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 22:10:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2A18415EB
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 22:10:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t18so40574009wrg.11
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 14:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wh5eUooUkrGvcmgj1NQ7ZMqT7QuFZMth1Sh/811ql3U=;
 b=OwnpXHdDtTfhIHNVaMREm6MaD/RRbddw9dft/EU09J7nIsfUsujjsysMB3uKiGx7du
 wfSVW94rM1aL9cExC/QIi/pt44ifDOqKcuLr7z7Rf7yJdYv8I40h4X7cJnZWPlfEg7pc
 xbXOj/+hfmMBqqjNPyw3NEJVt7U+603MRL8G6KbOcDU3q9sWSKSh+i7hzBQ3FvOQGNL3
 4v0La8BHirwDk+ROU5nRy60qZmzfeYTMlCHP9Ak4hJR+EPxHD9hwAEZYw3MDtGM9wXIz
 K2pZXCVS2iPXX6BACjjHPVUp8hMYthhQrLGDjhf93rYJB0vaqNzeMOHzNn9qCSUAwJX6
 zR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wh5eUooUkrGvcmgj1NQ7ZMqT7QuFZMth1Sh/811ql3U=;
 b=1HQOacdFncy8I3sFxBSpFXT7EE2MxNBoMPAp3+WaD8fKXj7b/VkdD5PdbtaoMiP/sB
 Da52S4HDUmLyC2np8AINHjj66KoyIGT6w8GnNoCU413LJxuE7e5sL5meprUkPlgmmk1R
 a2kweAvwes2HnrD2rQpUKfE7uTEcsD1xvKhKttxm+tctY066I2OfiNY8wAC6BfPyyk9v
 9RskEYeO7HH9ufmj1k0pb/L+PySNRjolOSpCh1bU3sWQtxH3stCBdQ7sYuhqN0RpzvQz
 Zzr9qlOgIvooop2Yl/1jGhKXvzRBbJPRtSfjKbjBF2ndhReb5ATkknDzZvoogcrqJLRK
 SGvw==
X-Gm-Message-State: AOAM531MVXmU0IcK97NDSWbMQQEnjbq2Evv1EX7g6NL0jyTxwE/ui9jJ
 zLCDw0kAk/MMQzC9xd4v+edek2+969a5Dw==
X-Google-Smtp-Source: ABdhPJwn3zjS0beCl1bfyDMV1a+KXY2T803cyp2pi09AAt0RssdZNHrvvdmjs4vQMamHqR9XpHPdGg==
X-Received: by 2002:a05:6000:1625:: with SMTP id
 v5mr6398540wrb.196.1639606234765; 
 Wed, 15 Dec 2021 14:10:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z11sm3081401wmf.9.2021.12.15.14.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:10:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 23:10:13 +0100
Message-Id: <20211215221013.3985092-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: fix build without
 lib{udev, usb}
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.9.5 in
commit c7233ec2c32c9fbef2738f8de7d59da85cd44b99 and
https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'

Fixes:
 - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ric.c-fix-build-without-lib-udev-usb.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch

diff --git a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
new file mode 100644
index 0000000000..7e93bf5fce
--- /dev/null
+++ b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
@@ -0,0 +1,35 @@
+From 2153e165c48e541bb5a8b23f81e87db87a9394fd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 14 Dec 2021 08:20:59 +0100
+Subject: [PATCH] src/hotplug_generic.c: fix build without lib{udev,usb}
+
+Fix the following build failure without lib{udev,usb} raised since
+version 1.9.5 and
+https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
+pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/LudovicRousseau/PCSC/commit/2153e165c48e541bb5a8b23f81e87db87a9394fd]
+---
+ src/hotplug_generic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hotplug_generic.c b/src/hotplug_generic.c
+index a0f34646..e4f19935 100644
+--- a/src/hotplug_generic.c
++++ b/src/hotplug_generic.c
+@@ -48,7 +48,7 @@ THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #define FALSE 0
+ #endif
+ 
+-#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(__linux__) && !defined(HAVE_LIBUDEV)
++#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(HAVE_LIBUDEV)
+ 
+ LONG HPSearchHotPluggables(void)
+ {
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
