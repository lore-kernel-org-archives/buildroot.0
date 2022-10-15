Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C326C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 10:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E150F4052D;
	Sat, 15 Oct 2022 10:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E150F4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dA406H0PYiYy; Sat, 15 Oct 2022 10:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D7AA40241;
	Sat, 15 Oct 2022 10:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7AA40241
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1B81BF292
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 196DC817A9
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 196DC817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAaTNadtlU9C for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 10:54:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2314381756
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2314381756
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 10:54:11 +0000 (UTC)
X-QQ-mid: bizesmtp63t1665831185tzm7bqvb
Received: from pc.. ( [202.188.176.82]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 15 Oct 2022 18:53:04 +0800 (CST)
X-QQ-SSF: 01000000002000206000B00A0000000
X-QQ-FEAT: YzZUXEAk3VPiOAbXo3YbFp+NbB4Yjgglg/IlbUJwK6in5KuBhueCLIv7tbsG7
 t2QNDOYTs7ELHLfFudEevGwrg9Z52+o1GWneHtU5hy2lFBymleYtkkuE3O8GVySiaMWorEC
 jAuqVGW1lk7ljoNbqqtjEjE3BTi4Q9qq/f70KluUVyahH1poQXn6YfdEci5e8pHw25k6ohl
 Xgod1SlxN/WnHz4sUz8riDQbGtxh5Rt2AffdGF4sH6a/OiSDeOsYn1267KgqS/qaa4VM5wp
 bkvf5dhti0+pERcjMKCSpGelOGhcQh5pQGFi4pDab4F9hX2v0hQA8HS1oX9U+Srd88twBPW
 DbqNnMKChxZIvRaeUPKSKthAiZ6OUKaBz8WPSCzCRsCPjSIh+VnjXPZHuPE8Ify4CCt6mz8
X-QQ-GoodBg: 0
From: Tan En De <ende.tan@linux.starfivetech.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:47:57 +0800
Message-Id: <20221015084757.277050-4-ende.tan@linux.starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
References: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr4
Subject: [Buildroot] [3/3] package/libkcapi: support enabling lib-asym and
 lib-kpp
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
Cc: Tan En De <ende.tan@linux.starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Kconfig options to allow enabling asymmetric cipher support
(--enable-lib-asym) and key protocol primitives support
(--enable-lib-kpp) in library.

Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
---
 package/libkcapi/Config.in   |  6 ++++++
 package/libkcapi/libkcapi.mk | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 176767e338..97eda31a4e 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -31,4 +31,10 @@ config BR2_PACKAGE_LIBKCAPI_TEST
 config BR2_PACKAGE_LIBKCAPI_DGSTAPP
 	bool "build dgst application"
 
+config BR2_PACKAGE_LIBKCAPI_ASYM
+	bool "enable asymmetric ciphers library functions (kernel patching required)"
+
+config BR2_PACKAGE_LIBKCAPI_KPP
+	bool "enable KPP library functions (kernel patching required)"
+
 endif
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 214999ddd2..c3b655bb35 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -53,4 +53,16 @@ else
 LIBKCAPI_CONF_OPTS += --disable-kcapi-dgstapp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKCAPI_ASYM),y)
+LIBKCAPI_CONF_OPTS += --enable-lib-asym
+else
+LIBKCAPI_CONF_OPTS += --disable-lib-asym
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKCAPI_KPP),y)
+LIBKCAPI_CONF_OPTS += --enable-lib-kpp
+else
+LIBKCAPI_CONF_OPTS += --disable-lib-kpp
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
