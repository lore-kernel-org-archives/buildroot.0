Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378BEC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 19:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C0460F9C;
	Tue,  2 Jan 2024 19:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84C0460F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CnCSGC3yVhu; Tue,  2 Jan 2024 19:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA9160BFD;
	Tue,  2 Jan 2024 19:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA9160BFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94C141BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 19:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6281140204
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 19:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6281140204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONQSQrfMkjB4 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 19:42:02 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B8F540150
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 19:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B8F540150
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so5188612f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 11:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704224519; x=1704829319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8/Zci0Jc6Rg+1TNpevGNWgGDmcEFMvhF3J1VewvkeB8=;
 b=fr9sA4MQxSYc8dWJn0dK5/oVeHv3VBZI9zgqAHrFGf8SzN7Q64UL4t5OPOWlNK3h5A
 qFctcfotylxo4HuSJjIApkFvidbmCvGvSqtp54L4x839rcryiW8bbBo+92d/G2M6N6wH
 kmcrUS8uhYR2/C2Us1AfnyC+PolAab1s0DxQJ2hGFn1qMsbtjFnvnWtCCEf46vZItZ/F
 veAxbZ0pJAYZsvlY3mec21jRFJmDfIOrp2dd8CG5P8nFoayS1sSkSUGf5K3tXUAuf1c6
 HZyVOr7sJLSW2g24W8VuC5PMDyHnY5QMBG+ifOQokaL1VSfTVen6/HeycJICdSgjdFRt
 gyTQ==
X-Gm-Message-State: AOJu0YwPUhCbY7G5MkUePWwuwRgFUPSwLxcRdVv8C1UmS6izHQ8UAb5D
 sAkiRLG4bpPxDYk/FfgxPsz3hm5Muto=
X-Google-Smtp-Source: AGHT+IELoyC8M3vcRcw2n99ZkjbfgN6y2pl+TDlgKT4vJXXL7vsOkP+jmcvNBYIyfYQS5OoSgaUvgQ==
X-Received: by 2002:a05:600c:1f0e:b0:40d:87c0:92dd with SMTP id
 bd14-20020a05600c1f0e00b0040d87c092ddmr1787273wmb.150.1704224519102; 
 Tue, 02 Jan 2024 11:41:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a16-20020a056000101000b003366a9cb0d1sm29092741wrx.92.2024.01.02.11.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 11:41:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 20:41:55 +0100
Message-ID: <20240102194155.1345165-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704224519; x=1704829319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8/Zci0Jc6Rg+1TNpevGNWgGDmcEFMvhF3J1VewvkeB8=;
 b=Q53SfR7oGfLpGEwMqVlZfwsk64T49r2fF9CteGlHZTmifhFIyrZWQIExFNwZGUn/qV
 h03q5JKVKPQyEH3Z70pxb0dhfBGwRhutN3RXpo/nsc6197GL9hAY/x117NW1liPULAaI
 i4Ns7DLysaIdlJGT19oo60f1OvA7OyRsihpGixx7kp7FvfMdKeb+Wa1nbgQaHskgH/4B
 e0ThTMnf6wc5uTOScUPKDACeVRlB0nCu1KMel9mLgI9+zYbbv5nAajCRvALOjS9bu6QC
 D7iE2TW1s9Elvqg9Zezo/xfF9N7l1rAT9S4DgTpfrDRjWhCjlEn6WARsdfLdPXY/lnQ+
 qHEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q53SfR7o
Subject: [Buildroot] [PATCH 1/1] Revert "package/docker: enable selinux
 module"
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

This reverts commit 245b13a0778ec6ad061555b0b994e7649ef01006 as docker
selinux module is for docker-engine, not for "a system tray dock for X"

Moreover, it raises the following build failure:

Compiling targeted policy.33
env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/lib:/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/lib" /home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
policy.conf:1912:ERROR 'attribute container_engine_domain is not declared' at token ';' on line 1912:
type dockerd_t, container_engine_domain;
type dockerd_exec_t;

Fixes:
 - http://autobuild.buildroot.org/results/87d78b6f15875f0fa3e6fc85e352db14ab0383bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker/docker.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 39f7ee4580..4a8c6fcd8d 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -7,7 +7,7 @@
 DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
-DOCKER_SELINUX_MODULES = docker
+
 DOCKER_LICENSE = GPL-2.0+
 # The 'or later' is specified at the end of the README, so include that one too.
 DOCKER_LICENSE_FILES = COPYING README
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
