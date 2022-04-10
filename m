Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2B3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AD44405E6;
	Sun, 10 Apr 2022 17:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dK-pFXmeTOOX; Sun, 10 Apr 2022 17:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DA62405CE;
	Sun, 10 Apr 2022 17:40:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 690F61BF844
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B2084101
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Zkzz_DMfEmj for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 17:40:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A555B84100
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 17:40:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso8688481wml.5
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01kNKr0Er0uXHHiOr5w6DwReEPAnr/bt+y3UnU9h8GY=;
 b=RX3LlZGxcKbq4ZJ4+67LPHRpHA3tZBDdkBsVjMNysfhT3kFiwyXEjpArtEL0dW69B+
 CJE/y5iPHspjNoQbh5kdKQ5FsCh0jc7bepcRXcezpbkA8UlEwaiGgJwBufsszzZldPjc
 7mQblekT0pDNxO5EXqgmelryUol6gpMhjoLv8fEASsP7xFR69XZD5tsxMN4pANkfT8rV
 IUrAScULgMgmjosXRHzyVcWjhaf+p4kgC41kr1/UdwosI4lhgJQESJOR5x3hVlKVOGW1
 xyf6Hw9nO4FLKbQUJY0PBig07is5etGfpHCYj87jHEXaK24/mNl4O8szQtZeuAL7Xv4c
 HdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01kNKr0Er0uXHHiOr5w6DwReEPAnr/bt+y3UnU9h8GY=;
 b=wlu4vmg3w6BoPSRkrUSdzOKYQ6WpmDTL+C2+Hhu+5MNCLVdIlqJHq2Da11TJt1xQwD
 0I+w9tjRbBxY5Pcj8effYe8Qvu+EGq+ofY52XpReGQdxKA+V9UQ/00t9B0Sskh1EQiPW
 6/xUCIeqH/v3grZkZobeMBgXug/RrLuAEiXbM6amkV5z9C4apmv+amdN6lTXdu3iy2SK
 ezQV1gx9GuxNE1N8//qMHZ5R5m1Ecp8TJ3N4XHPu0pxqIoV1Aq+yNSq1HyUqbAUwpn+W
 mXhUxN79bq0b4BgSf8Op+0HpnRJuL+K6ov6BvnEW6gSQKNuFXYTi9r9+aju2iV4PU/2p
 7GfQ==
X-Gm-Message-State: AOAM530IJN/fQn8V5Y7M+gqz9G1zEGADjNmwilvpiirCoBcV/vLQ23vf
 KhRfXbN9MmhP1TLbDPmrPR2oPG0mj38=
X-Google-Smtp-Source: ABdhPJxYFyNPrFoQ3SK2BKlifO/jKgFDrpHjZD2LSbi5ijntxUoFYwYYUGs29pYZXYnvtyTHsSrWuQ==
X-Received: by 2002:a05:600c:4e87:b0:38e:ada5:5c6f with SMTP id
 f7-20020a05600c4e8700b0038eada55c6fmr8014299wmq.21.1649612452543; 
 Sun, 10 Apr 2022 10:40:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b0038c6c37efc3sm15274253wmq.12.2022.04.10.10.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 10:40:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 19:39:03 +0200
Message-Id: <20220410173903.624901-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4732
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

Fix CVE-2022-1154: Use after free in utf_ptr2char in GitHub repository
vim/vim prior to 8.2.4646.

Fix CVE-2022-1160: heap buffer overflow in get_one_sourceline in GitHub
repository vim/vim prior to 8.2.4647.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index d2c91dcfa5..d55b1ea355 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  acca7330e41d01b53d4455ff98fafbf13282ba6461cd92eb1188836f6b03ec0f  vim-8.2.4632.tar.gz
+sha256  ccd57b074326b2faa15591eba3c86dcc07e53781079c44a0354436b8c4fe9b70  vim-8.2.4732.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 71aa735eff..4eb659fd6e 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4632
+VIM_VERSION = 8.2.4732
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
