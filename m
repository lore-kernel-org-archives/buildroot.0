Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ACAC6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 17:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D7041BB3;
	Thu,  2 Mar 2023 17:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D7041BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRyvjf_0Uhtf; Thu,  2 Mar 2023 17:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A73841B8B;
	Thu,  2 Mar 2023 17:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A73841B8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60EA81BF387
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ABD881E7D
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABD881E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRQxO9qcCGlj for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 17:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F2E3811F9
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F2E3811F9
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 17:54:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k37so202161wms.0
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 09:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677779645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pdLlDK/S9cCxUu+xmZfGAqqFLhiLa2c4oMi0uIKgjA=;
 b=VWsmhanTS7jJWVepCPMNOfGrkH3+Lfm5lLlTflpHolcJNZz54v/DRqS1b/RG8kY0C9
 FOYvXq5iPnqvbD/wkhC7iIhPys4QHz8h1l3VJFEPH+5QEYLbXlSs3s7+5cLTN/M6iJHO
 qTstYPDuWg5SVVU5IdBoBMNoQ1VWfGAR3S8Mb3JkGLluySkI2bjB17Qe4iZnJmv9qXm9
 2WL6sroAk9GhQPKoFWs0X/+HxO1XbKF0qvP1kWzMx5PQpjrj6N5vnKhKdOFUktDk6/hB
 ALlWeHTmw8WSIMwIKqi4+Ht7/A75csAN9Y2OQImtyX5FYvTGMHuDiAl9to6XrQ0dkqMK
 fMcA==
X-Gm-Message-State: AO0yUKXjvWjglfZ3TcRLr79/3jbKDzP5I9Z7QJNovKgrwrIJgCuW85cd
 S2ZzXgKzy8QIfpOigNrcqog0st5H7QU=
X-Google-Smtp-Source: AK7set8kF8ADwEjXKhNJ/bzZuonW9zCnqGC4lArdBAJz1ciX1B9pRTvk0q/OOdMgUeFIgz02q8nGcQ==
X-Received: by 2002:a05:600c:4d20:b0:3eb:2e66:8 with SMTP id
 u32-20020a05600c4d2000b003eb2e660008mr8576115wmp.35.1677779644920; 
 Thu, 02 Mar 2023 09:54:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm162459wmp.46.2023.03.02.09.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:54:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 18:53:50 +0100
Message-Id: <20230302175350.183840-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
References: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677779645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pdLlDK/S9cCxUu+xmZfGAqqFLhiLa2c4oMi0uIKgjA=;
 b=QmuUWIvuwB/TRiSdKLuEnA1uIoTQAJmbAcpgZGIRm1TnmwnWACZtlTkub678gQRJzc
 +kIvlH5+J+1LTen9d5Vwj3Xc2Q4uDno4e/olY3Jf50q3mmE2o8YpUZOcRbs4qydRCnu4
 I5EJikW9xO6JrW2D4BsjJQKj/UtYqahuFkr+nxOiHM+Mxnow+V9WVAE/u3q3lOUgefH1
 9Nyi2HVGBvbuRGvXpYpxzUslSdj7k8JR4OPuSbGv+YO7+bDYCt4C+g/W4zFM6qAjGv3m
 sA5naxKpiu0HsiVbYuvxiDi7Gyb5pqBUiSRbyEE5vQQ2PU5HC3U6Wb/GuN8QmvePMMiS
 um+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QmuUWIvu
Subject: [Buildroot] [PATCH 4/4] package/gensio: add C++ optional dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++ is available since 2.3.0 and
https://github.com/cminyard/gensio/commit/3fda483f15a2668f9e2396517cdbf09693e6e3ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 3374313c0f..2ba1b950d7 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -13,6 +13,12 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+GENSIO_CONF_OPTS += --with-cplusplus
+else
+GENSIO_CONF_OPTS += --without-cplusplus
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 GENSIO_DEPENDENCIES += alsa-lib
 GENSIO_CONF_OPTS += --with-alsa
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
