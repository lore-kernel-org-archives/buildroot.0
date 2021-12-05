Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8AAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D502A81B60;
	Sun,  5 Dec 2021 00:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIJ85cJMg_NG; Sun,  5 Dec 2021 00:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B7B282468;
	Sun,  5 Dec 2021 00:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB391BF963
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E91AB605C1
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUTtF92dIK_z for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 391E6605C4
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:21 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id r2so6584336ilb.10
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7N7nzm3bugEaHJOTEIiNsKA6Ht4ufEaqjhMxFkuTmU=;
 b=IcWe1YcYHhzkERNWOz3je6doTYY9CUEFHu19k7KvjX4/iCd/BTbT1yFgTE6GoYJDiP
 zh8xLIM5pcMRRajTPLsUTuT4s2OEHeVO6PulGUXATE33/5an6DQzLWf2gUXazVsD+mfY
 xjMJKovqk8tIE1EVcoYWdA/24WkFaTjkDfiHRRQ1hJSUYBBugmewkwJmFbheyhu6qmN/
 6Z9zwX5beOyscMKJ/rfhMADJOr8Vv7Aarvwh/K/Xw7HffpGaH0G/d3ccC3CRkXwcj0en
 eklHoBfDPDqk0lEHfaFx/sw+EZdH39730Y2vME80f+3Q+mVl5giMXhSeAPKWMCz3Btyd
 XwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7N7nzm3bugEaHJOTEIiNsKA6Ht4ufEaqjhMxFkuTmU=;
 b=eJroKtklFOhb/h5oKsQJ7XOIwkZ4mgCt7im1m7oCkMjYaJglAcg6pEzIB1H4CsQvB3
 E1pS9082yHiI7Pnfdv4b9ZRAS19H+U9TTOvzKuQ+RXFV0Ndz6nPsR2DiXkDL6qpqugL4
 fpzRSVK0xjC/ISicwZASH7/VaGe2zLh9Gm4aUSKdhN7cJHYfbkxYCk1vUpDxEVby3QBQ
 UKxY0fpXMVNE2neGam2aVhakb7guYClTZ0JYOIpoTVliY1MfUImn5E8FzCqMnSKJTOhp
 VRrifuowxUTrtIr6b831ATefPt+DUgagKc5e4LAiMgHBLMz3uY+0VK0h0Fdb8GKqEAgR
 /5UA==
X-Gm-Message-State: AOAM533qd2XKLhk56WBR27Ihy7k5xt4aUE/uC+lYQbemD7yNA/L1jo5L
 /x3v5UrYrXUlRmJSi8A278NUtCfh3V0=
X-Google-Smtp-Source: ABdhPJxkPKyWA1FyOUofuHrMIQuA/YMKhLdFKs+FJBq7tGClUOdt0i7EYJkxAgl/HUT77ICsWGVCpw==
X-Received: by 2002:a05:6e02:1806:: with SMTP id
 a6mr24938474ilv.238.1638665660274; 
 Sat, 04 Dec 2021 16:54:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:09 -0700
Message-Id: <20211205005412.2888068-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205005412.2888068-1-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/7] package/network-manager: add optional
 libpsl support
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c07be6d19d..25dcb563c1 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -63,6 +63,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-concheck
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+NETWORK_MANAGER_DEPENDENCIES += libpsl
+NETWORK_MANAGER_CONF_OPTS += --with-libpsl=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --with-libpsl=no
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
