Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E673C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F5B740266;
	Tue, 14 Dec 2021 19:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkHN0baY-wad; Tue, 14 Dec 2021 19:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB7F408B3;
	Tue, 14 Dec 2021 19:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E41541BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD0A60C25
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=arachnodroid.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hy5xLE72M-Mz for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:06:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA84460BCB
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1639508770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sF33GnbbGyAXqbuNxSIPfQEt3+Kx9eb2H0Ntadn1j4=;
 b=KoIYF/L1JDvNjwzRqtPm6q75INjK1gsa9O+3/bJy01YlFLr5FXpmDzq3GaygUgadneKwlw
 hyRzslnx4UYKdsljdrsqJiivSdRlc9kO7DxWMueiYQDz/9/kX32dFAK+QJ6UYneM4ZiSsW
 YdOD/x+toZONeJiuALqGLdvJRhqXInQ=
Received: from [192.168.0.241] (ip4d1580a8.dynamic.kabel-deutschland.de
 [77.21.128.168])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id eca3868a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 14 Dec 2021 19:06:10 +0000 (UTC)
To: buildroot@buildroot.org
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
From: Michael Taubert <info@arachnodroid.de>
Message-ID: <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
Date: Tue, 14 Dec 2021 20:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
Content-Language: en-US
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for some
 Gallium drivers
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
Cc: bernd.kuhls@t-online.de, romain.naour@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Certain Gallium drivers need DRI3 support, otherwise opengl won't work.
On the Raspberry Pi 4, for example, glxgears will complain about

'Failed to open bo 1: permission denied'

These drivers must not be selected to disable DRI3 support. It seems to
be the same for Lima and Panfrost, please check bug 13831.

Signed-off-by: Michael Taubert <info@arachnodroid.de>
---
  package/mesa3d/mesa3d.mk | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 61b095ccca..9780d5a960 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -121,7 +121,11 @@ MESA3D_CONF_OPTS += \
         -Dgallium-extra-hud=true
  endif

-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA) \
+       $(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),)
  MESA3D_CONF_OPTS += \
         -Ddri-drivers= -Ddri3=disabled
  else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
