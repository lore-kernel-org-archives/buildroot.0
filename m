Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEFFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 18:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1304189D;
	Wed,  6 Apr 2022 18:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qY1VK4t54xDu; Wed,  6 Apr 2022 18:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD4A4186C;
	Wed,  6 Apr 2022 18:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEE61BF27E
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 18:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 966C74186C
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnwnYvZZLtS5 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 18:57:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D70241869
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 18:57:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r13so4580064wrr.9
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 11:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOlzibkeUa+9RmiQLK9XG5BUuzBtG5HOZoN38+dFd34=;
 b=J0LpOFfcJkVP4lk4zX5pZC1A9y4T9aUAyePHLEB2vKYgYZNUhJhXChQTt5IqHYj1+v
 ntSXmj9HliTfa8Y49HbbTdBcXNuE0D2HDWdrBCltiBax0THlyti0UY0atU6HUgfqetGl
 IO6pZZKEjHZViAVHxdsVZmcQ+1nm6v/DLg/VLKibJOBnRSX8Fn75Win2V4NS4qX5bSoU
 EOWJ/O2zO2/bY1Tj29SyHzDtG8QCXvDsO/eHZMSlGF2F3dY0dM2ERfCP7tet6FIVdm9g
 rlWbzpyPdWMNPOOzpzAvgh02UAF0NZlgWxzeDQVJjDwiUIAZkRRU2+m68BTz4XDwpLCH
 /+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOlzibkeUa+9RmiQLK9XG5BUuzBtG5HOZoN38+dFd34=;
 b=MRe6qryPNvjTW5ty0R7BGAT0ygSZ2mUrxGeCZu5FNsalBd2RzYXZK7A+MlnriHN2nD
 9YXxjNiSHHdCpEIteGWH3s96t2SwUAhB71H8ByIPVfvQOMIvYw21ADJIgso/KecWsQ/B
 Fo+a66aIGRSOgol8YZ3eBJkNHj0We0wURudlD4OK9w2jxJ9CCHj00iKlFhLfRQM2o0b2
 3WCeekrGeZxVMEdqnaV4l29huBy1/ncFRzp7kLXpEJmvfE91uF0aEnUGQnVk1hevRL7v
 c+xBj3e451G/e4hSYbIl6Dk4bLafOZleoxje4ta4Uu7j+/ZJyQjXbzLK6D9OFK5moomR
 IoTg==
X-Gm-Message-State: AOAM532Ib5Dkmz2rZy+xftkLuyfycxaJ2kn9L5nGLHbq9dZCTXMg3p8y
 6lr8J25V9zUGhU25GfzcJ1fbfHyCQiA=
X-Google-Smtp-Source: ABdhPJzr5Vxtm8/of4VzgPUiQK1nFlcdKcxWkchvcJuxRFc+5OAiL/ZmxxcW4GCT3Jo78qmTS8mUkQ==
X-Received: by 2002:a5d:434f:0:b0:205:f514:8955 with SMTP id
 u15-20020a5d434f000000b00205f5148955mr8076735wrr.73.1649271463329; 
 Wed, 06 Apr 2022 11:57:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d6484000000b002057ad822d4sm15853920wri.48.2022.04.06.11.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:57:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 20:55:52 +0200
Message-Id: <20220406185552.4011357-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/woff2: use github helper
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/woff2/woff2.hash | 2 +-
 package/woff2/woff2.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/woff2/woff2.hash b/package/woff2/woff2.hash
index 469071e3c2..0812dabcf1 100644
--- a/package/woff2/woff2.hash
+++ b/package/woff2/woff2.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d  v1.0.2.tar.gz
+sha512  c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d  woff2-1.0.2.tar.gz
 
 # Hash for license files:
 sha512  8ee924da3fb5d16135adcf6a8fbe9e2e8f3d2d80468617e72ca4fa059a60f8455c9a5f68a8dc381b1297c8bf39c887a912d0f69246d2604ada74d3da9e8e490b  LICENSE
diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
index b2ff33fe98..937e8cf736 100644
--- a/package/woff2/woff2.mk
+++ b/package/woff2/woff2.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 WOFF2_VERSION = 1.0.2
-WOFF2_SOURCE = v$(WOFF2_VERSION).tar.gz
-WOFF2_SITE = https://github.com/google/woff2/archive
+WOFF2_SITE = $(call github,google,woff2,v$(WOFF2_VERSION))
 WOFF2_LICENSE = MIT
 WOFF2_LICENSE_FILES = LICENSE
 WOFF2_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
