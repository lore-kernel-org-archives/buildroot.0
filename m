Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EC5C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6380841BC;
	Fri,  4 Mar 2022 17:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sn2mU9khI-Hx; Fri,  4 Mar 2022 17:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294C78418E;
	Fri,  4 Mar 2022 17:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D03741BF44C
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF0CC8418E
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 17:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N97kXGMP81uu for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 17:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA70A82919
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 17:39:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p9so13718701wra.12
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 09:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sqfdxDwdqoT5lJhSSkR2aV4zospvZ2lfXYf/JOB7wWY=;
 b=gCJ1uTW3LwgC9hcjh90Qb7OJljYxOrB5XM4lPQQymGC7pdP3pATAmZB8D88wOxVtEi
 +fVy0je+QzhxQDVjQ9vrlRQwwzkmYnk/uvFcjEV1aTmOHz0KVcUHL89yNq92vQZ5IqJs
 s/9I3squWp9oyOQfLoSVjMcIxHt7fvAsmzM56IP+DkrWqI1yTv4ugUz2qn55MScHckMz
 10GUumGGc6H7UmlmJBf6YlFhnUGaqXLOIUjbGygl2JDRbfrAm0DkQapjGS3gcADCaz6B
 x0YfijO2vCRqM/ZC8X/ijxxY/KvjKYKLtbMrcg8UPO7Xfg46lXcurPNbIvDQY8ei8XnU
 CLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sqfdxDwdqoT5lJhSSkR2aV4zospvZ2lfXYf/JOB7wWY=;
 b=1oLr/mCwpTi853oli7AP5evWResYso2DJV2y/PxfbE03ZlqeTCFsCcGJyKi6OFYM0b
 nEEjzanOmwiBCunsb78r79CxXXXblF2UhIGEGdcSUshUtqNDxn6g/msenWg1EU763Blx
 h6akY+f34HUJl3iTKVny5VkCN4lKc1T1O6zPGgEMINrSV4yJAOU1YxTnS6qCabLtsRXn
 HmzKZ1DjWfZ6v5vKeXmVPtxzmtR8bdNoSRe5gm8rIDIJJOf6EkznNHhy+S55SqKx5Z6L
 D+yxDB3UmfiFDvc0jsRQp9xTJWzLBSxkjRHg/RN109g72OmOmuIBfLuvPwns26rxYQvl
 aXew==
X-Gm-Message-State: AOAM5314ByJKtRpFjn7bxDFb0/Mq18F7byd8fjX5H3WJMNyFqE+2zGjq
 wmN4wI7mfK9969U16T6092kNoHuY2eI=
X-Google-Smtp-Source: ABdhPJwhOIwmYxNgZuaANiGWoVeZnyoeRNu5f31NQ1tsEErTDcBxAQlS2NONrLHrZMEM3U5ExeAf7Q==
X-Received: by 2002:a05:6000:1548:b0:1f0:48bc:25de with SMTP id
 8-20020a056000154800b001f048bc25demr7986438wry.17.1646415562822; 
 Fri, 04 Mar 2022 09:39:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b00381614e5b60sm12886064wmq.34.2022.03.04.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 09:39:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Mar 2022 18:38:51 +0100
Message-Id: <20220304173851.3566563-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: fix build without libvirtd
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without libvirtd raised since the
addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 and
https://gitlab.com/libvirt/libvirt/-/commit/89064c9e378b99fea0a334199a524f13390d5fc3:

../output-1/build/libvirt-7.10.0/meson.build:1518:2: ERROR: Problem encountered: Requested the Interface driver without netcf or udev and libvirtd support

Fixes:
 - http://autobuild.buildroot.org/results/e43101c6d7f626439ef800263b8f5dfa99ce850b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 7b0ed5e52e..1dc61a7549 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -39,7 +39,6 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_ch=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
-	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
 	-Ddriver_openvz=disabled \
 	-Ddriver_remote=enabled \
@@ -196,7 +195,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 # Network is used by daemon, only
-LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=enabled -Ddriver_network=enabled
+LIBVIRT_CONF_OPTS += \
+	-Ddriver_interface=enabled \
+	-Ddriver_libvirtd=enabled \
+	-Ddriver_network=enabled
 
 ifeq ($(BR2_PACKAGE_LIBSSH),y)
 LIBVIRT_CONF_OPTS += -Dlibssh=enabled
@@ -235,7 +237,10 @@ endif
 
 else # BR2_PACKAGE_LIBVIRT_DAEMON
 
-LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=disabled -Ddriver_network=disabled
+LIBVIRT_CONF_OPTS += \
+	-Ddriver_interface=disabled \
+	-Ddriver_libvirtd=disabled \
+	-Ddriver_network=disabled
 
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
