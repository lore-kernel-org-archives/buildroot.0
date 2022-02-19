Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E687C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 14:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE210401DF;
	Sat, 19 Feb 2022 14:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7x7rRX_LdLn2; Sat, 19 Feb 2022 14:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E255040128;
	Sat, 19 Feb 2022 14:19:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8A91BF86C
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 14:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5764B40128
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 14:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFXskom0Mb7e for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 14:19:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FF8E400E0
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 14:19:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso8354490wmj.2
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rbs9niYAJu55wheKErlMwX7He396LrrXVWuyORxfGvE=;
 b=c6MkxJuxq0kOOlTmpjMT0JB2FjCiRV2UNQ46Y++TVq6GJarFpfMaaH09C1/Rmo7zXg
 YZKXzGpCc11WEkJe7UQfwAT8tD+KND7f3KyUAPMJFi2gYzhQDZs/GsjDFjt7lDdBkaY5
 XiNF00SSAmUjrkRfyrzBchd5OF/bvNp1q7Y7U9nyn1e65tGD/wf5nhW9oJvvKvImVZLP
 fbkb2HOjUQ6SgFr++/tp7AWPKPXuGgO+1onl6DdcTET0LeTeLP34ho8EP1LslcYB/UFI
 3JH2n5JrL1UkA7CPdJdn4xGolsuKpOgUh0hnhARJrXBvqTetGlO1WpG9XLXRJV/r4emg
 AKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rbs9niYAJu55wheKErlMwX7He396LrrXVWuyORxfGvE=;
 b=KalG/nRUverT7538kqw2jC4EJn9fSHePa5EssFla+flMmO0K4QWT/2piUNkI/IdmWq
 v2YqjXLFRq6cNieynQJv5Emzsym3f+iHqgMu+CAmWtWx5uONNo0pilK6dAEQTxuFANYp
 9wlJDOeySIjTkDAV43MUOiaCiuevSwO1F1oNLBViAA/0VPxzqC3G+nxKzajWivX62yH8
 eoAMCixDicqxwGzcDX6v3L4oQKa7AWSkxsBwaYIIqmUh5ZRqb47TYst36VP4Zjvt7sJp
 1yZ54OnghPZ5muhwfYDO/qSRVFVTPzpjavXZaHNCfaYj1FHvrbs2VCBHIbVU/zlbNcJ8
 h6nA==
X-Gm-Message-State: AOAM531/ZsmH7tsD+da/8ckQGIQtVKnMrn+iThvLI+TRWuDwSeMYbWAW
 znFzrS1We/hblcawOzGC8pprn1MsxTU=
X-Google-Smtp-Source: ABdhPJwmzPeRB0rCZ7NJCjCu+ass1bBEVSb4bJ5/uXYxVzIMnPms44U9jPzL8lWgRMMDeABte6vwIw==
X-Received: by 2002:a1c:e915:0:b0:37b:d847:e127 with SMTP id
 q21-20020a1ce915000000b0037bd847e127mr11233341wmc.180.1645280378305; 
 Sat, 19 Feb 2022 06:19:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm2840554wmq.40.2022.02.19.06.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 06:19:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 15:19:22 +0100
Message-Id: <20220219141922.3753289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apparmor: drop APPARMOR_FIXUP_APXS
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop APPARMOR_FIXUP_APXS which was added by commit
3c836e54203b16015c9c52cbe007adc92d293a0d but is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apparmor/apparmor.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 6f0e59224d..43bfa05308 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -54,16 +54,6 @@ ifeq ($(BR2_PACKAGE_APACHE),y)
 APPARMOR_DEPENDENCIES += apache
 APPARMOR_TOOLS += changehat/mod_apparmor
 APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
-
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define APPARMOR_FIXUP_APXS
-	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
-		$(STAGING_DIR)/usr/bin/apxs \
-		$(STAGING_DIR)/usr/build/config_vars.mk \
-		$(STAGING_DIR)/usr/build-1/libtool
-endef
-APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
-endif
 endif
 
 define APPARMOR_BUILD_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
