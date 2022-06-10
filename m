Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8CBC43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 21:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 605958148D;
	Fri, 10 Jun 2022 21:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7JtnpOHJ5UV; Fri, 10 Jun 2022 21:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98888443C;
	Fri, 10 Jun 2022 21:08:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86A5E1BF3E0
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7566D411DF
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crXIK9ZEczRD for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 21:08:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A4CB40D33
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 21:08:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u8so68774wrm.13
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCn1HGe1nUfpJzNoHyIdxBABAk4OeFjZbjkzBfcaRkQ=;
 b=X7UNfejbzaRftTFhoH+hKjW+n/8pdEqnLV05iTb1ndo9Snj/n9+NHK48CqP7UWlQH7
 +XCG68k1VJYyInVjE3C71NuLWteu52rHmlZ5LM3Vb1pTgYpDexdMt+Ea8CK4XgNBlV+c
 JcVtP2c+0xOnneun6Cx6/6VuEtMitC8InHBMuS6qRBajYDCW1QZatWIUpU+j9JRa2eW7
 Vo3zAatrktanTzsb2MuzXnGNG5RMU2kNFK/D8gruUJiuVbkiMnRkAuvya/8sF/OhNGix
 PivtoCmoGyh8zSk6hdbbWMLTwEnXAl30Yp+hnqae93Ez0k8RE4QUis35Wjj49dlKzcat
 PB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCn1HGe1nUfpJzNoHyIdxBABAk4OeFjZbjkzBfcaRkQ=;
 b=Ox61mYwXtkJRW1eu0D7FQyLw2XvpigWy4ubJ6L7nSE3MGKr4q9m5fOs7ebxjiYNJF/
 cl/Hat+/kD7ucLVvziS+exTXI/RIy2z2t6dBhGFHOAVWSVUn+skOK/KsTuoxeoz+Bek/
 bY2ihsjdWgwBCXbwPNRai7amE5j6MaMPeDKmC/m6wE8KePuUeQKciMTQTAYi1NocxREk
 EFJyaUff8G4tBm2zk9SkRyOaLHM+SURnlFk8QjN3WKMrpoVMtAkeZ0fO/vHr9Yz4xOSj
 kan6RWwhCJA5MyQsESECUa+8Vv6ojmWF3zJSsgwCCc6dpOMB51Bj/bVSzkwx1sEP8795
 44GQ==
X-Gm-Message-State: AOAM532hGSBJ/2uQgO1JBqaSXYDucgdIUntyi+LOXFLsdIM3W5kD/LNO
 z+3veknDesL6PwEmEWi/T1mFXdVHDdQ=
X-Google-Smtp-Source: ABdhPJyEqTp0KeT+C3r7lMHNllrCog165T76cPVIFlcqh72Ufd7W2USMfX2WTqQYX2thRRm1tY/rtA==
X-Received: by 2002:a05:6000:1d86:b0:218:3cfc:4ca2 with SMTP id
 bk6-20020a0560001d8600b002183cfc4ca2mr30727165wrb.133.1654895301080; 
 Fri, 10 Jun 2022 14:08:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003942a244f47sm4379449wmq.32.2022.06.10.14.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 14:08:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 23:05:40 +0200
Message-Id: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/dmalloc: fix strndup detection
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

Fix strndup detection as already done for strdup in commit
f9287b263f0808c2f0632aa1560d88e39fbf970b to avoid the following build
failure raised since bump to version 5.6.5 in commit
736932c71552adc4dfa95c5236d1064860900e8a:

In file included from /nvmedata/autobuild/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:630:0,
                 from append.c:34:
dmalloc.h:396:7: error: expected identifier or '(' before '__extension__'
 char *strndup(const char *string, const DMALLOC_SIZE max_len);
       ^

Fixes:
 - http://autobuild.buildroot.org/results/2164dac43e2607a3570e8f98957a70f579d06cd3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmalloc/dmalloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 93dc45c15d..81ac467277 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -49,6 +49,7 @@ DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
 define DMALLOC_POST_PATCH
 	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
 	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
+	$(SED) 's/ac_cv_strndup_macro=no$$/ac_cv_strndup_macro=yes/' $(@D)/configure
 	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
 	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
 	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
