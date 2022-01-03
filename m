Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBF1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F08FA403E9;
	Mon,  3 Jan 2022 21:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNVkTZV3xTk3; Mon,  3 Jan 2022 21:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0660140123;
	Mon,  3 Jan 2022 21:01:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BEE21BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C15F40892
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35cG3Ko3PpyX for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 21:00:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81548401BE
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 21:00:54 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso15133286wml.0
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 13:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jAsGyyPMqYtS3rhIKi5XKkRtudox6X07/7nVGtKksA=;
 b=jRFn7618zA5sYAZ2H5+i+qAe0npjta4VDozY+uCNBgANF5Tk0SciQuC9aJJUxyNI1I
 72M/H7hsZTY+STLFGNVMrFoImEcJjIZXCXZVqjCsvVY6bOft2SeMBtNDV3C7D3EjLfjB
 GTMCtXiVcBFa9n49ZEpiqmaRBhPr/EEpm6R+Run6YCaissKrFmdLMX/R9aSCYpxhitmd
 d2DSEhVi7B7+Lz7Xkz+NN+uSv8ePS/HU8rCjqll+c4gFCvCRXofQzpPE/RYcvWiHj2ty
 ur+MedOJT42aBDrHY+7lNvhBRXGyvJYAVay6fxVO7rzJmHme+xVSZacQBxrT/W7n7MJs
 9JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jAsGyyPMqYtS3rhIKi5XKkRtudox6X07/7nVGtKksA=;
 b=zLmGDcqKQI/vGuEDTZLuQ4xUfYuqABkGhQVNSPo/AwhlPWW82YX7ssr0UVHy3Snb0n
 s/tf58qER6SwKiHL2c3FshB+jiPBgfEcgXyDoljs6HeyHcu/m7Th2r4jsxl7a/ZQCwkQ
 fRf4FvEnl11QUvBWKqsNAcFdTkIqxYShEVMNoNB5S0jiVqWyJ2/q7/Q0vpatBK7VarTT
 5T9GD2jNl2i9xPb5WVrPCGbErTcT6LBAfucLavcIEesSnfHwhbgXpvyP+bmXEynuDzsi
 swxESxCVYYWbId4lfgg+vjxJzE6tOWM792fDrk38ir75eo7o77QDST+lQS0CFbT4UBlg
 HA3A==
X-Gm-Message-State: AOAM5327X7fp5GEXupDtnAuD0u2eDaJSnuxv2k9kfNwgIyQKLLu9/nsd
 rhi7Jq/k7X7SO/QLdBkTlMnaxSrFknU=
X-Google-Smtp-Source: ABdhPJyaddqvkudHLY1L+SFoh/SQJd7ltVX3PAdUSn/KfIUYWxF/8KFkmUr9zlwX+htIKrwD0NY1jg==
X-Received: by 2002:a1c:5445:: with SMTP id p5mr39337772wmi.137.1641243652833; 
 Mon, 03 Jan 2022 13:00:52 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id a204sm38219140wmd.39.2022.01.03.13.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 13:00:52 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 22:00:47 +0100
Message-Id: <20220103210048.7879-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103210048.7879-1-romain.naour@gmail.com>
References: <20220103210048.7879-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/qemu: Disable new configure options
 added by Qemu 2.6.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable new configure options added by this release to avoid
adding new dependencies or features.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qemu/qemu.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 43450a6649..e69e813059 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -187,16 +187,20 @@ define QEMU_CONFIGURE_CMDS
 			--audio-drv-list= \
 			--meson=$(HOST_DIR)/bin/meson \
 			--ninja=$(HOST_DIR)/bin/ninja \
+			--disable-alsa \
 			--disable-bpf \
 			--disable-brlapi \
 			--disable-bsd-user \
 			--disable-cap-ng \
 			--disable-capstone \
 			--disable-containers \
+			--disable-coreaudio \
 			--disable-curl \
 			--disable-curses \
 			--disable-docs \
+			--disable-dsound \
 			--disable-hvf \
+			--disable-jack \
 			--disable-libiscsi \
 			--disable-libxml2 \
 			--disable-linux-aio \
@@ -204,9 +208,13 @@ define QEMU_CONFIGURE_CMDS
 			--disable-malloc-trim \
 			--disable-membarrier \
 			--disable-mpath \
+			--disable-netmap \
 			--disable-opengl \
+			--disable-oss \
+			--disable-pa \
 			--disable-rbd \
 			--disable-sanitizers \
+			--disable-selinux \
 			--disable-sparse \
 			--disable-strip \
 			--disable-vde \
@@ -355,14 +363,24 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--extra-ldflags="$(HOST_LDFLAGS)" \
 		--meson=$(HOST_DIR)/bin/meson \
 		--ninja=$(HOST_DIR)/bin/ninja \
+		--disable-alsa \
 		--disable-bpf \
 		--disable-bzip2 \
 		--disable-containers \
+		--disable-coreaudio \
 		--disable-curl \
 		--disable-docs \
+		--disable-dsound \
+		--disable-jack \
 		--disable-libssh \
+		--disable-linux-aio \
 		--disable-linux-io-uring \
+		--disable-netmap \
+		--disable-oss \
+		--disable-pa \
 		--disable-sdl \
+		--disable-selinux \
+		--disable-vde \
 		--disable-vhost-user-blk-server \
 		--disable-virtiofsd \
 		--disable-vnc-jpeg \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
