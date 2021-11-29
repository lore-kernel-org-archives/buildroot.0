Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC926C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6982A60BB2;
	Mon, 29 Nov 2021 22:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNZ5EO_kGBGl; Mon, 29 Nov 2021 22:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8251560A4E;
	Mon, 29 Nov 2021 22:30:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82B0D1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CDC440188
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dfKpXlXGYV9 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:30:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE93540185
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:30:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so13439452wmb.0
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lS13bAtWbjZSX0ooIbPDkPDETSq5IR+BNpuCPYUNc58=;
 b=qC0WxGWrHNFDqUvK95CNR+SkydYthR0isJVgfFQ7U7In44qluBQ5+TyikssKeYYpXB
 myu4SJ5yRCib32QhpT9bxnA9dR07sI7QW4RExImkxZkfSQKRVNZdYQTTyfiZQOSzZdkD
 yc3A/qVUU0+GyO9zLug/oA6BjdUrYtrBgEzq1Nwa7DgABMTEfO3dr5Y4l0wcy0cGYq+e
 G73IdLcoiSmoDprY0/zkvonckN2z8k21hezlNUzfStuZ7ydhm0o8qDfW0o9Uu1YAnN+m
 DLhdevFYZZp0qSAcg2leChpXzbRm5VEdZh0CUOJXHvwhfe5/hz6T0blSFyFPmC6NRrdM
 gsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lS13bAtWbjZSX0ooIbPDkPDETSq5IR+BNpuCPYUNc58=;
 b=kp+2+S/HRHyJwVHYQMdiYSjia4om8/haqSeLfrWvPPtOZGJmPXAV6opE91/5dnBKVg
 fzD4om8Hc5jkm0eWy+4XioBo+RutSCsHMGL7xzTRRCPHun6ga42ZfGSEZpTEGRpM9IVs
 yiHD94c0BKx9CpAr25FmgAB+bgnsK2j5DE8VgufrXW0TQ9ggF+P3Prl57jWF/+25u+dF
 HcfhagdnprdSKmoUSYqaQnBiyyOhTkFFEaCk6gvaAx0FNdY8Z6409hKxDEo9YoBGBKoL
 OfBX9pQVGOH7Hbg34z9rMn9iKDWuSNRLf4uR50PtgfcafwlW5Lw3Gx01ndxKwEfWR936
 uFwg==
X-Gm-Message-State: AOAM530UOksYkvW6QINKzs4doX8yy6WE7PPvYcD+qwi3K91cckX7m335
 /AVQE/FXD3FuPRScAJqIEVo3+kPmluk=
X-Google-Smtp-Source: ABdhPJwP5ZbabU07YbQMDHvbcLgpvjnhhuXPQjHTZqQ0x8Bf2AhMMGX/w1HNUZBFbB0kpCxxHDn3vg==
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr821887wmq.164.1638225043818; 
 Mon, 29 Nov 2021 14:30:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id d8sm14863221wrm.76.2021.11.29.14.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:30:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:28:08 +0100
Message-Id: <20211129222808.2185990-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oracle-mysql: drop spurious space
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 8a6bdc0097..f1f16abbb4 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -61,7 +61,7 @@ define HOST_ORACLE_MYSQL_BUILD_CMDS
 endef
 
 define HOST_ORACLE_MYSQL_INSTALL_CMDS
-	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/bin/
+	$(INSTALL) -m 0755 $(@D)/sql/gen_lex_hash $(HOST_DIR)/bin/
 endef
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
