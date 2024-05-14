Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB06CC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 10:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC31410D1;
	Tue, 14 May 2024 10:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-aHyzxbzC8w; Tue, 14 May 2024 10:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECE3F415A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE3F415A5;
	Tue, 14 May 2024 10:13:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC8A1BF277
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 10:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D01860B1E
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSUEtxU3w6PY for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 10:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=marleen.vos@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8630460AE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8630460AE9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8630460AE9
 for <buildroot@buildroot.org>; Tue, 14 May 2024 10:13:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3504ad82a64so366174f8f.3
 for <buildroot@buildroot.org>; Tue, 14 May 2024 03:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715681588; x=1716286388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3j6LtfFznGPtwxBbnE387Mf7RDaWSB5sbbuV4ux3wkY=;
 b=q7mKLypgTuafewV18VvkpGfMqhtBrhkWH8spOyy1qjNcaEFUpTGcAEOBmjt3LvQofV
 8JJVfw9AlDPhMk7oYnI0NPfqSHCc39qtNS8RBJfvH+JxFa+UE7f5xzt1pA+4pCUJcgKZ
 fPCmti642zQR9ieRh4+e/fiQteocN3Py/uuENqPVkwmzv0amWvXTOkeR6QXbop2QvZZn
 hFc17sYt3d03KngBsKbA6bx5yGX2XbqaQM0tUgMrxG5eN2EyFpVlDGbwvwhGeG0Scrxe
 tJEmDfCoQTR7ACdzjKC9RDpoZz/x8G1PrubvBB6aK+eATddQ92Ad7zKNrcrl9fxOI0zv
 Tnng==
X-Gm-Message-State: AOJu0YyGwnuhJbhpCTqC9JM45KgI8WLwmUxseZeQE8ODWJG0dsdkCP/Z
 852FZhyCm+qRsMiZyY1iW8pHvVFL+747qhBs0i9tawqjEm02qtKWgerS9HCxy4pB5t0c68HnWG2
 P
X-Google-Smtp-Source: AGHT+IF2SJHQx3p+r8GR0KvXTCHS1yPNuieHG1pQibuTsYUBaX4KU2DwHTLJ0RL10FAv7mnYMrWzPA==
X-Received: by 2002:a05:6000:1110:b0:34d:742e:3dbf with SMTP id
 ffacd0b85a97d-3504a110945mr8634170f8f.0.1715681588548; 
 Tue, 14 May 2024 03:13:08 -0700 (PDT)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baad037sm13200862f8f.71.2024.05.14.03.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 03:13:08 -0700 (PDT)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 12:12:44 +0200
Message-Id: <20240514101244.1067520-1-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1715681588; x=1716286388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3j6LtfFznGPtwxBbnE387Mf7RDaWSB5sbbuV4ux3wkY=;
 b=a2djpoU7aqd3NtUz83fe74jl837tyABBjN91wVVI/ErJstZnSRdli52KtHl18FCQxp
 /TbEMu3egLGbJGVWhA1lWhCmLrqHkeKWWDWB1e9JmJ1ZDPsWSXZKNtEQ7IXPRU6ZpIYy
 8iJ9fpoWF6fdowsSr17ngtoetGRxEXnmh8NcZ0bxIv3d2SX/uBVYUT+5lFhmHGg5ogtI
 omwl1fzNGEz3j9XGV8WTk+RgDe7A6PBqF+dhpypdUArPsHHBRaz7UiQ8AEqhGHuZntBd
 XuOTDHOonKr3ugjHgGD4942wUaiDuz6VX6XVG1CkXr/hy9F8wZilg3b6RTrr8kGkQciZ
 wepw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=a2djpoU7
Subject: [Buildroot] [PATCH 1/1] configs/avenger96_defconfig: fix CI build
 error due to a missing package for uboot
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

This refers to https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124907
The build error referenced in that link is:

error: command 'swig' failed: No such file or directory
make[4]: *** [scripts/dtc/pylibfdt/Makefile:33: rebuild] Error 1
make[3]: *** [scripts/Makefile.build:397: scripts/dtc/pylibfdt] Error 2
make[2]: *** [Makefile:2014: scripts_dtc] Error 2
make[1]: *** [package/pkg-generic.mk:283: /builds/buildroot.org/buildroot/output/build/uboot-2024.01/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is added to the avenger96_defconfig in order to resolve the issue

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 configs/avenger96_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index f73b654dc8..64cfb3c2b0 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp15xx-dhcor-avenger96"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
