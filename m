Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA6BC43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF973409FF;
	Mon, 13 Jun 2022 19:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVJ6p1z763z5; Mon, 13 Jun 2022 19:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AE67409C8;
	Mon, 13 Jun 2022 19:56:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7070E1BF2BF
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB91404A1
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvtMZ1JssnsP for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 19:56:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B492409EF
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 19:56:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h19so5195370wrc.12
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hgO7ZO2gcK+OKKTTX+gzZiVfrJvOYdoIYuP9+WEpI0I=;
 b=WQg+ik73GO18KtN1w0GGfpupmXgZxxD8sTnWx5xkOShUST24R6zpXl3lsawhsVVn3k
 MDUA0tjmbZ0i45rd1RS7hfcUDUxBU+V5+zxxsgBLNNd0KJfjV0PC9/5/k4J6avIfInm9
 rKLFBfmj7H5BxegMcS6lue1HLIsYNtBR7/fm37zWfrwD++uDcmgg+4qn4obfaHmu7G5j
 9ccNBwi2HHNRY1GjCBvn9ofjly6ioO6QXzPwUVgqMHFMsG5cX+/f66QL/39X4EM/nlM+
 vON6oDHumPnkIcZpD1XYXGdvl/GdSGKZ/PxjmprpN0QD+K/3xNzcWWkImZvzjTiCQtA/
 JURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hgO7ZO2gcK+OKKTTX+gzZiVfrJvOYdoIYuP9+WEpI0I=;
 b=wgAYqht+p60CIIy5F3yrNuztPdHecORpVA7jkzb4HmaGv/a4OL+fL5L/rpqlYxh8y7
 aCPY7itZ7X1x5KrOs3jSh4uv/vG+YdkaHccoveBWcIExnIAjldMe90Fvrdmein7lLVrW
 0kcR0ECmBx7CfL0sS43EkZt9jDPc1jqXBpEuuBf1kmJdwyCfDVzz7XF/H+6bB2gA8/3m
 teavWufieUGraoCJjzwjXS0PX/KCoQTNzyizq4Jzo0BrpHXMRdjF09PqMiG7LA0dqLYO
 qt8OFjtHwdKufAhxIOtC9a7IhtywI9CDUAcl/S4acEto5sJZM4P/jngSkXRs3LE0NLN4
 7V8A==
X-Gm-Message-State: AJIora/Aqx1Lfsz/CHu0k2DRUDQhhUNtGNS39oVV3IH9tRDlDw5E8bbB
 QlK4cVILkmCf21GGl195DuHDwBOEGys=
X-Google-Smtp-Source: AGRyM1td1Hoc/weqbAt7qOjpwJZRS10xc6zRQGARwMTciDz99YRmbNwa7+XqjM+P2UDEJBMchU1l3A==
X-Received: by 2002:a5d:6c62:0:b0:218:4257:9693 with SMTP id
 r2-20020a5d6c62000000b0021842579693mr1297325wrz.515.1655150173168; 
 Mon, 13 Jun 2022 12:56:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d4e8a000000b00210320d9fbfsm11159586wru.18.2022.06.13.12.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 12:56:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:53:24 +0200
Message-Id: <20220613195325.290672-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
References: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/sofia-sip: fix version
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix version to better match what is expected by NVD NIST database,
release-monitoring.org as well as upstream github
(https://github.com/freeswitch/sofia-sip/tags)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sofia-sip/sofia-sip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index c7698c9a11..c52045091e 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.6-4152840260
+SOFIA_SIP_VERSION = 1.13.6
+SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-4152840260.tar.gz
 SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
 SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
