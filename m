Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD87EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 18:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 891C86147C;
	Thu, 15 Jun 2023 18:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891C86147C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OpPrHjKi7d4; Thu, 15 Jun 2023 18:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC7B461470;
	Thu, 15 Jun 2023 18:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC7B461470
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66C751BF293
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 18:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FD2A81F03
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 18:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD2A81F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKaCjeBCFmTf for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 18:08:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6A681EEA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B6A681EEA
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 18:08:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcb3.dip0.t-ipconnect.de [84.161.188.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17D0AA4C05AA;
 Thu, 15 Jun 2023 20:08:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54756)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1q9rOD-0003Mt-2e;
 Thu, 15 Jun 2023 20:08:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 20:07:57 +0200
Message-Id: <20230615180757.626625-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1686852490;
 bh=qq9QDljX7r95mQNMtFkDwoqI4PxvcdbaFYA9pXK1x+M=;
 h=From:To:Cc:Subject:Date:From;
 b=DkZS6fHTzxADDL7pgMP9+mHJqpPVOS7zzVL3yQDzGUsEcVMVFVH07qG6RqWKIbBhM
 CwxZEZDf8L7G1eDLuns8NaAOvasr6cMprM0Vnkm5JGMFcF+LunGjWfJzVPlH+3sxSM
 w63QQN+szXwlNq6PcPoqz4mSw8aiAHRdVC6SnNr5zmAgxGo20dDp9ZjRNz3hGRGrrP
 +j40ZIRg4Hmqo8YwpOsBvLEz4qRHeInqEMSMTa2MjVnaAM2ATyFwcXszFwvcYcjJio
 0GlU/ki7rhvtfJvE20O+2L6UK1QnGCAkIZNL8wAAqmSJT0Oe5QydQPluuUMuEFSFTx
 SEphjRzIDwDmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=DkZS6fHT
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xlib_libX11: security bump
 version to 1.8.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes CVE-2023-3138:
https://lists.x.org/archives/xorg-announce/2023-June/003406.html

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003407.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: squashed with bump to 1.8.5

 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index ed68164d5f..f443d947a4 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003318.html
-sha256  c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518  libX11-1.8.4.tar.xz
-sha512  3150a47498b0cb012482ee02efeaae16d9e736288f2b3f917be912e1613d56ad6b4ab180de8820305deb2b95dfd993633f43a65344d75979d6b86bdf110cb63e  libX11-1.8.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-June/003407.html
+sha256  59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9  libX11-1.8.6.tar.xz
+sha512  b94a578003078a42cea43d80fae2c54a3aaa30f706088bb3546331e9abfc180131cafb37887117abcc5b6116992e299974981eef96ecfcf883cc8a1aba4d1ade  libX11-1.8.6.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index add16f49db..75199f1a3d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.4
+XLIB_LIBX11_VERSION = 1.8.6
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
