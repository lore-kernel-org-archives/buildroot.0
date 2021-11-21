Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB36BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C05F403C7;
	Sun, 21 Nov 2021 13:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odQ5XYL663DD; Sun, 21 Nov 2021 13:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C82644040A;
	Sun, 21 Nov 2021 13:51:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3451BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 097ED606C0
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BukFeF8aLwj for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:50:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B913C60775
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:50:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n12so67722288lfe.1
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7TPWhDB2AW3y4rtqRx7mxX2QDe5CptEUlJJ+dUyMHPY=;
 b=ADbg8SShGbQ4tmeUqAUKOi8XTcdOi8WD5UREhMye5jHdOuVHh/F+YsPE87RL9BZpKz
 vw8RoHLnCLu6wveW2E5MNYRIrt3LjrtFHB3HRoXZr4sm0MgddEQQVxHeYp6Z9OqmG53z
 EkzGdd44Wt1AotePBDaddFpp8uvB9lBrftSReYieixZi4tiJnAixXkV+cRD0zm3qMKQe
 pLlPs76bXp6S1h+x8C5jYqUGIHM0hAS85cAcbf9nc/yUXCbH1KipfoxF1gkVzBvTigR9
 4AkJi3EgToleRYDWxyhRAsCmgLzlZ1dNmr8i6Op2m0Ac0XaVzlF72g7uQXgXAIDXciCz
 4aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7TPWhDB2AW3y4rtqRx7mxX2QDe5CptEUlJJ+dUyMHPY=;
 b=IBqTQmJ7+fBOy4dBuTms5mTOVr2f8fNVrKamaw4OWaqr83jDeWbXkC/Pqfa3LCn2FQ
 Uscw4ZCN1whmUx7X79xeE05HWUz6Zvgr+u+x34UlaTZyIaMMN7bhQn9XuM1nfGk413wS
 xLjRM5leuSyNlcSDbLI5UtUVg6lSdgttTFMdARaGhC5E1W+IP8BiLx3sdPDmN94fuKov
 yfo2QwuIfC0fT4tega3MpEuMR5sSXExP4f+50SXe2x9gAt/Uet6KE5DROnd6lhLKR1VY
 DWKJ0Jf3qSczmV3G0nOJ2fzn+5AMBgkV36VJstezt9/JHFFphJbiRNTYYjSnI03ECHDy
 Oz8Q==
X-Gm-Message-State: AOAM531Bhh0rYs5s59DaAfuxMJfmJGddLwMuk9QV5XsCcDL4LTpZJ1LY
 09bKBXTvZZUNehFSjVIWRxUwBnp44do=
X-Google-Smtp-Source: ABdhPJy7ALI4f4qh7812eLf+779yaokFmKqWZAmCGOtmf8SgOMzGMEVAdTaSpuZtciVs1rxXUieH3w==
X-Received: by 2002:a05:6512:3f8b:: with SMTP id
 x11mr48890543lfa.536.1637502650364; 
 Sun, 21 Nov 2021 05:50:50 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id e19sm560683ljn.82.2021.11.21.05.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 05:50:50 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:50:44 +0100
Message-Id: <20211121135044.3314429-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smcroute: fix copy-paste error in
 .mk file from mrouted
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 81f540088a..081ab6b16e 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -32,7 +32,7 @@ SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
 
 # We will asume that CONFIG_NET and CONFIG_INET are already
 # set in the kernel configuration provided by the user.
-define MROUTED_LINUX_CONFIG_FIXUPS
+define SMCROUTE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTICAST)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MROUTE)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
