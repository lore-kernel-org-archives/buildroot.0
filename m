Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A901C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ABB24169B;
	Mon,  6 Jun 2022 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-yclRNdW2JR; Mon,  6 Jun 2022 21:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42EA5416B5;
	Mon,  6 Jun 2022 21:34:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E719A1BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE2EC416AB
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEcAsL3enZuo for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE2384169B
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:34:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso2681204wms.2
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICnfMmj/v1Hv9z8vi6qSDBZ1kQwXMnFmlHUNlRn10Kw=;
 b=Ozc7r+TEVvxvsaNHMIWhj2hW0s5za9Yp7qmPJPrX0UfJ2ZOFcEx95TiLWTRe/LWKZi
 xS/MKjXY1nH//4El2BQi7Vo8s+DUsdHofNTi3DG/ewRxk0uEN3EB4gEs2w9xCPzM1+0i
 jUrLqG03LOh1YpUJuzlqmH5r9+HkOzuONZv9Fl8JvkuoVBPUU4LTYLEzUAc87WdJWWRM
 l6k94d9jaBwz95BwEmOF0fWfOLLSY9HnNKpw0AVcysig3yU7IY5b8E3V6ZaCsHCP3pwr
 LnR8xS1VdOe/ANioO+hxCk14QEJ+eq+W1Q0vIYOT1Sq/k7QCc8MGC8va2HrTY4G8s1f6
 smVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICnfMmj/v1Hv9z8vi6qSDBZ1kQwXMnFmlHUNlRn10Kw=;
 b=tfGnwJKhe3kiBUozt3LxdYUz0tlJ1LDK5In+pVwQ2muytEuLpRQIDyTMguH1OO76gK
 GwarIgB8LP4KFEa2o54xj/cpicEWqdaS4UxomI/10t4HhbWoPvQyXe1GELw5n79EdlNY
 U8P0sYbzIESvnRuJBz6khswSIEPY1h0JX+pgsWPivoK60WrXQe1cZn9gltgG0PH3VwH5
 N+P0PzVOSvBC6AjNwJJcpv17XDwgcTGKmDYMtscqCnrhD/LOf7HaZJp6bjtWgJQwyevU
 hKZzzPO9Eh/x7u+6rtvmcR4xOIxnWRh0d6lDTuBlCx+8w3PzKVAbn2FIT6Gcn1fB24jD
 7LXw==
X-Gm-Message-State: AOAM533kFDDgnwy2JlVs3KFVWoEPSzTPaAtP98GHeTugfHxvWFvahibh
 2YCsYdXMuACkzXW3vULG0RP3kE5A2LA=
X-Google-Smtp-Source: ABdhPJxx/33NVx5s8uNxmrdrZ8H/8Hr8PpPI1tUSNi+f8qmyfsaxSRbiJip5HKPlq1pVriaxbuGqEQ==
X-Received: by 2002:a05:600c:10cb:b0:39c:4e74:2b41 with SMTP id
 l11-20020a05600c10cb00b0039c4e742b41mr8568605wmd.130.1654551241760; 
 Mon, 06 Jun 2022 14:34:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j3-20020adfea43000000b0020d02262664sm15985393wrn.25.2022.06.06.14.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:34:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:31:30 +0200
Message-Id: <20220606213130.15559-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/json-c: bump to version 0.16
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

Set DISABLE_EXTRA_LIBS=ON to avoid adding an optional dependency on
libbsd (added by
https://github.com/json-c/json-c/commit/0f61f6921b2e4395d1e354ad356137e44d6a7e11
https://github.com/json-c/json-c/commit/041cef434afe0d0c6da8b6ac1d1fa26087246dda)

https://github.com/json-c/json-c/blob/json-c-0.16-20220414/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index a20d370eb0..44d068a8b4 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6  json-c-0.15.tar.gz
+sha256  8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b  json-c-0.16.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 3639bad25a..9af7f9a83e 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.15
+JSON_C_VERSION = 0.16
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 JSON_C_CPE_ID_VENDOR = json-c_project
+JSON_C_CONF_OPTS = -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
