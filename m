Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5593DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0793E40283;
	Sun,  6 Feb 2022 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yS9GZSotxApX; Sun,  6 Feb 2022 19:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFC940276;
	Sun,  6 Feb 2022 19:59:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C711BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E79F40276
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxTHJ8wJ0W3i for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1056140275
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:59:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u15so21388862wrt.3
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 11:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1eWCNQQSuAupmZW8JLXa0uewie7os/RjCf/Bzq3jJqw=;
 b=eh5ZAQcpha9dZ6Kx4cRN6AnKhU7TQKF8rHcRuZNFPm0n7FvkG/kgbA93zO9C1QIEbu
 ORHyn0coj4IRz8a4btMWGqodL3KtTNb0zf3M2CAtZxEPWt4GVsBDotkgNtf8+uPbnOts
 KT8C2xul0XXsm8T/w2IBgtlxbcSgjpwlSXZKKR2y/93xWQ6EMIseWK4ym+cmCzt+2SJ7
 iVFi2o8yAQUbntoY9cjFFLra7jiBvppsts5uJcoICHNNjSpe4+LlJaBZ6nUTaLBO8m+l
 zQLOVLYZowgWzHYHdoSGaos9DsxenzKWiVKmRBnSPOEeRa3GVaWvKE6qzBA57uzLhAf6
 Oz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1eWCNQQSuAupmZW8JLXa0uewie7os/RjCf/Bzq3jJqw=;
 b=Li3GKq9xcSlvUNiAWsBzIxwjMgVZ4xXVhYS6d7X2knilFl1z/0N0EQLGXHI1K9Gjp+
 pMAfINla2lCYtQKzpmMCTcLpdp5xV6JgevkmoJ8PLl4TUTEEoJOT8WW6lLjS//3LdScQ
 Qqr9TFvyIdpwEqOqrL89M83G1Ddk+CvdaW9nar0e2phABBIcUz8tbD4hAxeea0KuwoCb
 A68imwgYnwXzjl3+/mKjkfuvR/oqjyS7cdyD20OYUpwldTunkNiiK1ZBD1yu9dbY4fv/
 8mW7lNN1mUNCvBnqx46e6/qpNjG2dlQ4aP6aZHkHmoEn39XqDY97CWozNubO1vo2vrF2
 lsww==
X-Gm-Message-State: AOAM531snF1TADSgOpyaK+uAjmM4XMC8mqmkPpxzz9CWtg+yPJFb8uaG
 EO2LFoSXtobhkgGErzPZFouGb3ja5G4=
X-Google-Smtp-Source: ABdhPJxtzYWzz5DWAA3LRBfEX4BOy3RZa+ME2hQkZGJzwJV4eh9bgw6Fm6AjjTVH7D4qe5dCyQcXgA==
X-Received: by 2002:a5d:644c:: with SMTP id d12mr7253497wrw.631.1644177538894; 
 Sun, 06 Feb 2022 11:58:58 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id y6sm7758267wrl.46.2022.02.06.11.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 11:58:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 20:56:43 +0100
Message-Id: <20220206195643.2522277-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lua-cffi: fix spaces
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

Commit 13114d0f9352531e5d7ebed45cd3f679407c61d9 forgot to add spaces
before and after '=' and added a spurious space in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua-cffi/Config.in   | 2 +-
 package/lua-cffi/lua-cffi.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
index 64a36e1de4..f4a760ce0d 100644
--- a/package/lua-cffi/Config.in
+++ b/package/lua-cffi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUA_CFFI
 	bool "lua-cffi"
 	depends on !BR2_PACKAGE_LUAJIT
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBFFI
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index 07d84ad5fa..964f49f030 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION=0.2.1
+LUA_CFFI_VERSION = 0.2.1
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
