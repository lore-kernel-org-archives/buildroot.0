Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB10C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 10:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A171860B08;
	Wed, 29 Dec 2021 10:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Wne-_ajNBkj; Wed, 29 Dec 2021 10:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 163C660AFB;
	Wed, 29 Dec 2021 10:21:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72FB71BF324
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6173D60ABE
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1DjqXYh3FgL for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 10:21:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D47360A9B
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 10:21:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso11481462wmf.3
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8kf/Ed7wB7dYTyJcEEUOXzgAkOJf8kIMOtM3oP5l9JA=;
 b=lvXwl8LxOph1Y8dGiv956cocAAaq3ze0XmFwjt4K/MEep62yTMp9wF+QYtBYtkrRf6
 rE8PycpUhLo4uLsBdI0p1WiQba7UAqOs5mzo77EHF3NUtf24zrzFo1gV4dQAS7C0JNQF
 B1qtlN91Kbxut8Ka1Hb6GmbKGhMdft9Sf/Yc673Epk0iBy8mqaqh4zD+J3Tjh14tligp
 /NgT2yqueiUkwSpM5UQ8YkPGVl4W2GZmPWITQcueO4o6+KoCs9G571pQhIhywSVw1/T5
 cLFqUztaa1nCIdINXkOo50KBTOwr7q0lPTLc3ydAXQKIKxAaMj3CYKGtIw0cOvrM1JxL
 viqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8kf/Ed7wB7dYTyJcEEUOXzgAkOJf8kIMOtM3oP5l9JA=;
 b=1LslvoMDsgIUX+8dCNgwxDFXb07FCG9FFYiAPG1TTpdd9U9VMJNKASqTtP/2ABhj3R
 pJPEI6zNeortVHJ/1er2ZyR54V8PGm/ibCr72S9nBMyo8A+uLGV1p7MzbR39hmMvD+QQ
 6lmFRyuOuM8ln0z+FHiecU5Td4ymp2+LSGFIk6BJs9+Hcme0Q7s/D6SYbpXJ6HF/3+Md
 2Hij0Ymhu/zRcDG3nFY0RsZfq0n2rUTKbL+WDqSMZaeewTaV0ejv7yZe+Ig2dWr+og+Y
 uBHjl6Hq2P93AUNhVAtIfhyAX75ACvHX0JtIWdzfFhnkG/usGsAgxln6BvQcH5JARKQT
 CDqQ==
X-Gm-Message-State: AOAM533CeWJwMx6FM2DCFVNVJXiuDyE4JDrBfzWbk0mhYWhNJIYvkGTF
 J+iJyBOAVLxZ+VKHKgmdCb1k5QOFY34=
X-Google-Smtp-Source: ABdhPJxxnByxaIoB5nOUZMCqWCqTZJJ4fCGgLv3IwTre16jtB/uaPdiyeVablgxGQ/JxvyFVpp53jQ==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr21440032wml.0.1640773284841; 
 Wed, 29 Dec 2021 02:21:24 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o11sm23251187wmq.15.2021.12.29.02.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 02:21:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 11:19:50 +0100
Message-Id: <20211229101950.534749-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.3930
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

Fix CVE-2021-4136: vim is vulnerable to Heap-based Buffer Overflow

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 9fb162d798..6fa5d1bef0 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  acddd083c44a3a62194b73bb2fd1327af2adf256b5978c64f97d2656dda24d07  vim-8.2.3775.tar.gz
+sha256  39579f7d50a6e8d7c13105a288fd85f4cdfad7f11df49706bd8f16ab37fe43b8  vim-8.2.3930.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index e0079d3468..6643ef0841 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3775
+VIM_VERSION = 8.2.3930
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
