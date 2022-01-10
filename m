Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48409C433FE
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B9A827B5;
	Mon, 10 Jan 2022 07:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5UaLBnyarkV; Mon, 10 Jan 2022 07:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2471182771;
	Mon, 10 Jan 2022 07:59:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8142E1BF20B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E7D82771
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0Cpxma0Wgw1 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:59:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 198038271A
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:59:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r9so23291900wrg.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YdSqMvxLPb2JFOBljSe8lPfK94d7MWVBFA9HWDh2Ozo=;
 b=UgjDNL67GvZVie1HZ8OjH8tot1vrE4wkIXo374IK1bxb0rCnzG9HDzmhQ6/BDi7guH
 Tkz9Q+LS3mcSMsH6TKQaqA/r1QVXo4sKZdOsy9D8DOt9ux/bm+7L4Ms3BjFqNPFUPx8t
 Jpfc9h1TLSxQ99bk5O+ZyZzuT/NGFiZ64Pos9CnLMKh7N1KEkcpqIiDqDvMtYzjehL68
 Yo/vi+bUDsStrOfUJhljtimjZFJWyB6Fsf8y4NKSx8gIULbhftv5yntePgrmHFxVkfXd
 vHYv/jYUTzrc6C2QWs3l3k34nRPc8yaQeWBgaDEbrZ60gLt1Uzi4IOGo40n+gRcKeA3p
 BLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YdSqMvxLPb2JFOBljSe8lPfK94d7MWVBFA9HWDh2Ozo=;
 b=qgstMEuULaPrfqa0Jen/S5/6wsvM757oqbOaQ6sDsCDs90LX4sLdoC07AREABbTusv
 +o3Agqs7ATfV2Rl3QXHRlpZUgdQ/NQ8O2kkaFx04C2/jwuMdecCvSrsqNKdtZWLxnCRp
 +fNn2/+kZWeZ4dY4UIw1HvF0YqL1/yc5U/2EQqPQeL4eeDVeZtceOMq7+FAbFFUpIQJr
 f0En+j8B+fnTdvadvZ7blGcdBJSiQqJtIM8ZYG1k7v3UbUHs99DfeUKVAi7UPCIFvWJL
 EnyQ77c4F54Tu+3Y5KwPO61Em6W02IhFa5UpnZ7SY7wudhrhYMZ880Yb4TC/YFgbbxRY
 p82A==
X-Gm-Message-State: AOAM532sJuUOf081Yrh2fvaYeIWwPAb6qN87ai7UbrscY6tpkTOGGv5/
 hIjfluyNW1gMDRdfDWuWxw8msn4P88I=
X-Google-Smtp-Source: ABdhPJzKkNyqEngB7GF8LYsSujqpEhB+lZXiN3agfWQ8XdO+upOuR6Ue15cxzgwOsOQYT9fpB+qMmg==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr63458237wry.406.1641801560111; 
 Sun, 09 Jan 2022 23:59:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n41sm6143856wmr.3.2022.01.09.23.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:59:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 08:58:04 +0100
Message-Id: <20220110075804.1499122-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/git: add xdg SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xdg SELinux module is needed to avoid the following build failure raised
since bump of refpolicy to version 2.20220106 in commit
f6691d122ce25fc580ca88243f79f75cc2808ca7 and
https://github.com/SELinuxProject/refpolicy/commit/64e637d895c516d7a6b6cbcd46b187136279fddd:

 policy/modules/services/git.te:121:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 115358:
 	typeattribute git_xdg_config_t xdg_config_type;
 #line 121
 checkpolicy:  error(s) encountered while parsing configuration
 Rules.monolithic:78: recipe for target 'policy.30' failed

Fixes:
 - http://autobuild.buildroot.org/results/98d5b3db313000855721c0ad994951fe8cc781c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 556921a9fc..90b1acd6a4 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,7 +10,7 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_CPE_ID_VENDOR = git-scm
-GIT_SELINUX_MODULES = apache git
+GIT_SELINUX_MODULES = apache git xdg
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
 GIT_AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
