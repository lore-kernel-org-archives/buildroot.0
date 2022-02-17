Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34084C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 09:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA9766F6A1;
	Thu, 17 Feb 2022 09:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TB581eb6qmNS; Thu, 17 Feb 2022 09:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2150E6F697;
	Thu, 17 Feb 2022 09:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBD0D1BF57B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 09:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA33B6F688
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 09:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QN8uVTNTc378 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 09:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5E8061B7C
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:40:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e3so7992476wra.0
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZgzFK8igblZo/LYtP0WAaOTB+rba3WkB3f1TNbJcbYM=;
 b=NfNX+lRW0sXjEwjdfk0a6TVOYepY4fibt0FE+z1qGHTD8RaAOGsnRzZkH2bTi8ZGwu
 1GZ3QBFd0vXiSToUX7B7Cw0fDRD1WrW6L2g/pjzaIstmkzGpWavYTBYrLXwyqlV7DrLT
 gBjlY4Xt+IjPA50gA/TT8CisuFh48FT/3fZURB66hrSHdjn55Z0wJg3tET6EB8S74DKc
 he2TN9QtZ58Q7L9KcWqVQkO06OakFSennYTdPU/Ar9I0apvVPCkl6bHa4h6NH67Jh6w7
 6JKfiEPLHbPn9H3R6gZ+iFiMedWuUmile2mO6hTtaDfOGNldwaOlIdBDgVWwzf0wjvjP
 Wy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZgzFK8igblZo/LYtP0WAaOTB+rba3WkB3f1TNbJcbYM=;
 b=A6jolMS5xPXBsYQHheJSnCUazmz2sKeQHF0YpgkR96w3tUiAPiQdYDb6hjfLxTn4/X
 W9dU3l3XEAa3jcOc2VokBeD5fqUoIc4WKWH6WjvfQHu5HNv83axzRhTzzl2aiALUIriO
 v3S0axA+V7AqO6VLhZPpY7l2A9qqEQb6N1M9c5HRoeZarxrvuJW/GRHjIduwTAAuVCu5
 xQa8nH1w1t890VFhGmqzBSMm6prIWn4LICFb10IJgsj7SG8hCw2/vayn2EEMscaTJ7Ju
 P32Q99D4w6deVwVRi2mtK8SAtgiHUFfbCnOGmGXRJhUbEjgcHuACPASOGPMxu40ZLfSV
 kTlw==
X-Gm-Message-State: AOAM532eW2EI/NGr6l8r+nInocL5m+TNmPaoV3W9rxexYvw4kt44MdQg
 utf1u+CrQPjm+vaJu5k5uB2WrMFh1ss=
X-Google-Smtp-Source: ABdhPJyQnIFskOD7CPcbN++hiS3zZJaEBp9MghQwjrG33eOi93D+goR2ltkwnKQsyC/WybS4EIJL+Q==
X-Received: by 2002:adf:fd03:0:b0:1e4:a106:8fae with SMTP id
 e3-20020adffd03000000b001e4a1068faemr1565805wrr.336.1645090840580; 
 Thu, 17 Feb 2022 01:40:40 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f18sm874853wmg.21.2022.02.17.01.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 01:40:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 10:40:48 +0100
Message-Id: <20220217094048.2756293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luasyslog: bump to version 2.2.1
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

This bump contains a single commit which fixes the following build
failure with Lua 5.4 raised since commit
4f9a5659023c66fc166de28fd39a6c97a9490667:

In file included from lsyslog.c:11:
compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
  402 | #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
      |    ^~~~~

Also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/df2aabcf2ae07cad66b869ec4ac76702d2c32dc5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luasyslog/luasyslog.hash | 4 ++--
 package/luasyslog/luasyslog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasyslog/luasyslog.hash b/package/luasyslog/luasyslog.hash
index bcb6a7e025..1e2a5ddec5 100644
--- a/package/luasyslog/luasyslog.hash
+++ b/package/luasyslog/luasyslog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7f7dad64117407f2484ff5b53e90804f923a99fcbde5872e54f6aba53f482da0  luasyslog-2.2.0.tar.gz
-sha256 833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
+sha256  b1b19ca142130f93c3f8f2e85303ff50cc6f4ed4aa52b8569176ae56e3dc3f43  luasyslog-2.2.1.tar.gz
+sha256  833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
index 049e068a13..972d4c5a7d 100644
--- a/package/luasyslog/luasyslog.mk
+++ b/package/luasyslog/luasyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASYSLOG_VERSION = 2.2.0
+LUASYSLOG_VERSION = 2.2.1
 LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
 LUASYSLOG_DEPENDENCIES = host-luarocks luainterpreter
 LUASYSLOG_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
