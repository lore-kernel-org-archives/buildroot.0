Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF400C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 16:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55E1B404BB;
	Sun,  3 Apr 2022 16:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7t7XBiKrldf; Sun,  3 Apr 2022 16:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8710440169;
	Sun,  3 Apr 2022 16:39:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2211BF284
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 071AB82BFD
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 16:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDdqT8DZQWEb for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 16:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D85A82BE5
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 16:39:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so11015985wrc.13
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srhzdpjNU2Z91ZIzOiH2QDYnWJB9zgm+NDDCsnAX1O0=;
 b=Qd7+mrEyUk6tlh8QL7qiMHQZFKLmRZM1Oxzx48zKsKnIGR3AKJsquBwpQUkLjVEd18
 goeChaW2/bmL70UF8axLwPJjqPHJ72/oDQ8DWvmyJ18C6swX0/24wg+zEX03+6/l8svE
 5IjKToQU+m0zaFMWxqc1Fn3lW2Bi6oX/74YkJEdDEJoj59cGM8akgVwvWAEOW7E318BT
 n6vrWDFdBBA8yg86id2bmLmR7p95zl9liv6up81MYGC5da5iok2cKo66GWIB5ynzripX
 N5ZoRM7rxbTjKdUYzGFCE/e9bu+EiplDYfBQ1qMj27NTapEq+0pbQD10238NV3JZw2hb
 koTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srhzdpjNU2Z91ZIzOiH2QDYnWJB9zgm+NDDCsnAX1O0=;
 b=cq39nIi3RBxpf2d1y99EGGUtWrdhIBHa0EbsUgYvEQWjpzDds2MbWbnwpkppyA8FUo
 A23UvKnKq/GiMU3Pb7GpdVuWVX/12jlkZFR37BgfNsuPRk+bHKEIB+VM4h0k6aVJ+fa2
 QKdpXH/1zEFENqEVdmCchx90skBZHp6aD0fUo7ct03luqZEOc3TIT/ISdC85ldfYObz9
 /VA6BYwO68HPH3vfbCKb5HnKoK0dNkIX7QgrBuTYE4NQijwhltct5e4qgQeGjepJhKVQ
 eb9LkcZoO14304M6ZT2qsaFEYghlzPsci070I+PvH1vq1xQLhbBIsbk0zpM3gYR0GLC9
 aRJQ==
X-Gm-Message-State: AOAM533jeXRqCiZueM4RBMdER6RG3vUK0KKTkp9LW26QYHFGPf2BuQf3
 IH8Wo2IbxjJ3QaxyBrh5G9OznQi4Y+I=
X-Google-Smtp-Source: ABdhPJztuN54Tj3v11yyh/KE+dy3h2iN4XHyZCrlFN2fKHvA/uhz8C8/lzwDimkV/FRvDMRqsKclXQ==
X-Received: by 2002:a05:6000:11ce:b0:206:100d:ba01 with SMTP id
 i14-20020a05600011ce00b00206100dba01mr1683973wrx.558.1649003963355; 
 Sun, 03 Apr 2022 09:39:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adffe47000000b002060d09327fsm2271307wrs.16.2022.04.03.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 09:39:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 18:37:36 +0200
Message-Id: <20220403163737.223577-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libyang: drop unrecognized options
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2a3edc5e00b38f4f927894d0911990c9060e4415 forgot to drop
ENABLE_LYD_PRIV and GEN_PYTHON_BINDINGS options which are not recognized
anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyang/libyang.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 7de9531bff..832adcb627 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -15,13 +15,10 @@ LIBYANG_DEPENDENCIES = pcre2
 HOST_LIBYANG_DEPENDENCIES = host-pcre2
 
 LIBYANG_CONF_OPTS = \
-	-DENABLE_VALGRIND_TESTS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF \
-	-DENABLE_LYD_PRIV=ON
+	-DENABLE_VALGRIND_TESTS=OFF
 
 HOST_LIBYANG_CONF_OPTS = \
-	-DENABLE_VALGRIND_TESTS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF
+	-DENABLE_VALGRIND_TESTS=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
