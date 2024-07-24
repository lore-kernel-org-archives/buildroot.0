Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D996BC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 09:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6241260891;
	Wed, 24 Jul 2024 09:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFseCELagNq8; Wed, 24 Jul 2024 09:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9AD608A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9AD608A7;
	Wed, 24 Jul 2024 09:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A91BD1BF377
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A405A608A7
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 09:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqXaHEcIxqy7 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 09:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.152;
 helo=mout-p-102.mailbox.org; envelope-from=ruepp.simon@mailbox.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CEC560891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CEC560891
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CEC560891
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 09:05:11 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4WTSb123Q5z9sjT;
 Wed, 24 Jul 2024 10:57:49 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 10:54:44 +0200
Message-Id: <20240724085442.134872-1-ruepp.simon@mailbox.org>
In-Reply-To: <20240723103238.704924-1-ruepp.simon@mailbox.org>
References: <20240723103238.704924-1-ruepp.simon@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 4b9f94580d22a5dde37
X-MBO-RS-META: p6tp3emfcqdbpajnnsi3bdz5mtfq4rmd
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1721811469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNOs7SwCOjnJFu4tFAxAU6ROJFx6AWq55jcrtGnuCCM=;
 b=nXLaIXSNIk9IUJVUM1oBGFX2gkHZ3w0KpZWQhM0shL8hp0q5xNCXkkmIx+DhL1UTE8rvIk
 2Ws2HYVJZFgcuyE2gjZu/kI8qVIrQeRo8q/ndoi32JypSD668axyg0Sc+JhexzTytVMMIA
 97Oa7LSbBshIU7irJJ4vGvFVaGKv5NTX1xe1JSiKETVmzyEfPxjh91xcPnhaDgsNSkf2hf
 LbNX4P02Gq+rS0DFYZ6fHPSFTNTIRv4ShRyGu/5KJp+5k54l+Y4zzRyetxt/uXIxzNceIp
 jvrKEpoztCgNEg0rLaGFfFJNhSbyd+N7dY4gC4E5/mwSL6RLquql3zGg7DzzLw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1721811467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNOs7SwCOjnJFu4tFAxAU6ROJFx6AWq55jcrtGnuCCM=;
 b=QmvcRtKKwVVw+dikc0iySn29S4MEj5fe+R77PVhLHoCnHomqk3gZQWjwONvSpgIj1EhX5j
 ncRrsRkQSMlw7jHb29+fZQOv8bAdwwOkJpOPVHMUOX2+mSUAR560h/dDzOKQMYaA+0dJkO
 jSY77rcU4i0ug+xRhxqbFjUZmebOBe8RaiEi0VcVtkJZOxqPt/5d0AqnaJ7jXouIfe0gRQ
 GFgXblrPzK+yNJ/r0YJf7fklR4hswerObCWHnwHsKlGk2znTpb+DDxwQx+mMaxJceAv9SZ
 eN80grEQBu9oQsRIEirM+mWv1HMWkhlBlMR13jXfk8OM32BOLJdaJo56g1RtFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=mailbox.org
 header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812
 header.b=nXLaIXSN; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=QmvcRtKK
Subject: [Buildroot] [PATCH v2] package/qt5/qt53d: fix compilation error
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
From: Simon Ruepp via buildroot <buildroot@buildroot.org>
Reply-To: Simon Ruepp <ruepp.simon@mailbox.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Simon Ruepp <ruepp.simon@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compiling the qt53d package currently fails since the required
source files of the assimp library are missing. Because of this,
QT53D_EXTRA_DOWNLOADS along with a post extract hook is used
to separately download and extract the missing files.

Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>
---
Changes v1 -> v2:
  - Use QT53D_EXTRA_DOWNLOADS and a post extract hook 
    instead of adding a new package to fix the problem
    (suggested by Thomas)

 package/qt5/qt53d/qt53d.hash |  1 +
 package/qt5/qt53d/qt53d.mk   | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 65e6e8e380..49d6048eb0 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  31b3e52fb0b28f1e99dd25342a0204d239f7f42bcb25fb56393956904ef412ea  qt3d-9bf4d03e2515f7c454647d54542330b6e90f8191.tar.bz2
+sha256  00ec879857f511bed0c8b04ea4e7882a282051ec299245af487183c790e65539  qtquick3d-assimp-8f0c6b04b2257a520aaab38421b2e090204b69df.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8d9babd704..61e90b9360 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -11,6 +11,16 @@ QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
 
+QT53D_ASSIMP_VERSION = 8f0c6b04b2257a520aaab38421b2e090204b69df
+QT53D_ASSIMP_SOURCE = qtquick3d-assimp-$(QT53D_ASSIMP_VERSION).tar.bz2
+QT53D_EXTRA_DOWNLOADS = $(QT5_SITE)/qtquick3d-assimp/-/archive/$(QT53D_ASSIMP_VERSION)/$(QT53D_ASSIMP_SOURCE)
+
+define QT53D_ASSIMP_EXTRACT
+	$(call suitable-extractor,$(QT53D_ASSIMP_SOURCE)) $(QT53D_DL_DIR)/$(QT53D_ASSIMP_SOURCE) | \
+	$(TAR) --strip-components=1 -C $(@D)/src/3rdparty/assimp/src $(TAR_OPTIONS) -
+endef
+QT53D_POST_EXTRACT_HOOKS += QT53D_ASSIMP_EXTRACT
+
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
 endif
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
