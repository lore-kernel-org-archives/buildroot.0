Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39B9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 09:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209F761216;
	Mon, 18 Apr 2022 09:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJDAPsSnYURk; Mon, 18 Apr 2022 09:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3717160F33;
	Mon, 18 Apr 2022 09:21:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABB1C1BF391
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 09:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89514416D7
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 09:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVnBIynPpw6z for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 09:21:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F35E415B7
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 09:21:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u3so17933367wrg.3
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yiIB5ofXLTSsDvmnktZzDp/NGjJGnvDr6tEZUK104aM=;
 b=MzLdXskbbQLQZHQ1i1bMQSon43K1MfsQXHJohwcRGxtqJa99G+FUiJSfIqyBHmz+LZ
 eIhQwNTfZs3nu9PgDgAzV26MUhVt0gsOU5wOYUf7azK1ga85+idKYUd85+U3BnNk1CKw
 GFeQVl5+mIN7JmgVApoykytQb1fzxR/EMFkB3Fw1AcSqksZ+U1Zh3XMHDQcjbF0Q2xaA
 WG8CGdWCGw6s49Zi6x1kisWUByRmoLY799cv2vzMBmmgGbZ90ym5HHZykWcfmCHJzatj
 3wEjiYKcR5ZimfUL9Lp81ZghZb2yRRbIEIkXH/otCYHKvG0lYF6Y680T7jyi/MRRlFSC
 gajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yiIB5ofXLTSsDvmnktZzDp/NGjJGnvDr6tEZUK104aM=;
 b=pINFkTWYn5X1iGQBM/LnsgrNQ3hDvSYYSubpksWJnfE9ysEXnFRiAIalvnRHCPOHuw
 0IaIUXNt93c4MVEb4X7gISVUdTdtC/+j1eyGEpPIDtfntRE3gcJMciguc90q/WZQmjsr
 fiPp/u+hVt02x2nABOsVvS9g1bxy4m2I6+GTfLFBejs7zrKZLmOVOeb8Wkh3x3+47v+t
 7gAJT2DoC6j5rDEwwzdcj72MSE9/XXeiWiNPfsIJ9mx3GL3uuNsc0WYOMKWf3u9EV1QU
 8zZHjrExyxPCC4332N0ovtiyMH3a9jW7ovA/ozsBP2DNBrnuuwyoXPgakuB5Xpz74YRu
 lTbg==
X-Gm-Message-State: AOAM531gtjrarf/VxHGOtqirj35ZVxOnIRJdZKdXlHGBvNaZ9r3e91lW
 T6JlOoMVKlj4fc69fNjdia0KWMY366A=
X-Google-Smtp-Source: ABdhPJx5f8WYpTuieRf4Z9RzxaHFORDqf5AFffxZyarts3Qt0sMR0vuVP0yjPPs6xQbLJUqhvlq13g==
X-Received: by 2002:a5d:6788:0:b0:207:ad57:cc71 with SMTP id
 v8-20020a5d6788000000b00207ad57cc71mr7506174wru.180.1650273698110; 
 Mon, 18 Apr 2022 02:21:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b00207a6f32833sm11469922wrx.117.2022.04.18.02.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 02:21:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 11:19:09 +0200
Message-Id: <20220418091909.7449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/botan: fix mips64 build
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

Disable cc-tests to avoid the following build failure on mips64:

  ERROR: Configured target is mips64 but compiler probe indicates mips32

Fixes:
 - http://autobuild.buildroot.org/results/c44f44f36686268479563afd879db588e15ede7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index f9ebcf8d0a..6095844b14 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -15,6 +15,7 @@ BOTAN_INSTALL_STAGING = YES
 
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
+	--disable-cc-tests \
 	--os=linux \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
