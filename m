Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD15FC47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56899418EF;
	Tue,  9 Jan 2024 07:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56899418EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_T-exMbZACc; Tue,  9 Jan 2024 07:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D0A417FB;
	Tue,  9 Jan 2024 07:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D0A417FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA7711BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C372060C0A
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C372060C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVtlF1BwlcsZ for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:28:38 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0270D60BF2
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0270D60BF2
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3607bb6596aso11087175ab.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704785316; x=1705390116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HLUKYVpB1CdjUSDp1804pREoIXQly+Fv4LTOL5AKmoU=;
 b=AhjSZTlKjTCv5zJc1T+GcHk+bkaX/mjhZrf02fn+x6ndhFiKI+YNdLhyeF6E95fZgZ
 5+6a/3BzniUATL6eF6Ql/TIT1Tmy8HQ9hHyyL6xGI4eP9bjPYZyDaWcMQHbx66zBshgm
 peGxHDRo3f95EhlFJ/yi6vT1ByM/QBJhR+V/9OJ9MT+Y+WNXc8RKaMjRHXwj8CFk4CTs
 7Bx4E3gn+OxS/CRAkb69IZDy50XtqchJodhEzZvZs5qqDCwF7ez8XqNdmXYgFELCBFlv
 QLSRskDCXUy75SesR/75YRUFXtX5ZSKhjoniiKGVSfAg5mSLgSbH90W/jz2uMj7O+bmj
 GUEg==
X-Gm-Message-State: AOJu0Yyr4NCpqJNO3yT6EMFYr4Y8Sixh3ZxHVIRu6P15iGRFCgVZCj8w
 P4FHvzF2nDaQ9QAyrZFKZOu7aE56WO9VsA==
X-Google-Smtp-Source: AGHT+IGGGWCM7On+/2WGNfVo0Q+6Z0A3Mq+xx7hiIX4f7gDoF3+UMCclHJxFPcKTYSLZuScPP9x+6w==
X-Received: by 2002:a05:6e02:1bc9:b0:360:7acd:5dca with SMTP id
 x9-20020a056e021bc900b003607acd5dcamr5186211ilv.43.1704785316645; 
 Mon, 08 Jan 2024 23:28:36 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 t12-20020a92c90c000000b003607ff64574sm442937ilp.64.2024.01.08.23.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:28:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:28:34 -0700
Message-Id: <20240109072834.4036277-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704785316; x=1705390116; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HLUKYVpB1CdjUSDp1804pREoIXQly+Fv4LTOL5AKmoU=;
 b=beFBPetGR7bnlK0mjOfd9KU8Ew/JEWY5tozKVJ/tESHScj1qxoAY0J8ABxkG6iyc1M
 vGeeIxMyAI1d62wTkhBMV1HNUuPiHBer8XGY2uXLXPiC0oLBACvpZpGIVm64E+alb4Ef
 nzjT0tM3fAxCNq3sFwl2b8CeRGzKeLHRAmo2EQkX6kWHxwompfiP+duC8kg8zLIgaBl3
 06S7ovfyKKIZC44dQM9hj0CswdpRtV1haaTElgda6SONCGrsngPm5KbNM3DgEA/ZLzBZ
 iK5rK+kcFAbVWMsJddVkuAVM3C1knSjtazulZf5AZcgcDp25q3dHxpRfAWdjKGMkYrM7
 SKwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=beFBPetG
Subject: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version 3.1.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 497b5d2b57..2d54d27837 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  383673fc6378428d0db5861a416cad0d  falcon-3.1.1.tar.gz
-sha256  5dd393dbf01cbaf99493893de4832121bd495dc49a46c571915b79c59aad7ef4  falcon-3.1.1.tar.gz
+md5  22a5c32f3d9dd96d498febe8e16ddffe  falcon-3.1.3.tar.gz
+sha256  23335dbccd44f29e85ec55f2f35d5a0bc12bd7a509f641ab81f5c64b65626263  falcon-3.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index b5ebc399dc..6c96bf16eb 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.1.1
+PYTHON_FALCON_VERSION = 3.1.3
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/29/bc/c11c9a14bb5b4d18a024ee51da15b793d1c869d151bb4101e324e0d055a8
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/3b/30/a7bc770025b6a7a36d0508e3d735dca239df7c27b862856e54d661f24632
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
