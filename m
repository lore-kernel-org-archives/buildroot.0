Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E440ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 10:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2257C8318C;
	Mon, 29 Aug 2022 10:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2257C8318C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwOAUbi_MO3y; Mon, 29 Aug 2022 10:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4ED83104;
	Mon, 29 Aug 2022 10:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4ED83104
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFCF1BF3DF
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 10:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 240504167E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 10:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240504167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kjbs-VTuQogP for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 10:31:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FBC4169E
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1FBC4169E
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 10:31:18 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 11:30:49 +0100
Message-Id: <20220829103049.17780-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1661769065; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=Fi2UDEASwMlVHQ8+rukqI9aL39QLzltifybgcHjMWi0=;
 b=K8LaLqyebXtqOjjFva1hV9ujzk4K5nvxOFKpkXHmTjDTcIRk1eWkzRpPFJ7UF8z/zfXJV1
 ABhGmHMVSsXXDNfzXXqp09qUVjV89p+YLF2eHt+j2AnRII0hdXTEneXpk/cjzBDEWoQotW
 6TJyVcTwIn3fV+xtyiYz2iNsXl5INow=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=K8LaLqye
Subject: [Buildroot] [PATCH 1/1] package/libiio: bump to version v0.24
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The changelog is available here:
https://github.com/analogdevicesinc/libiio/releases/tag/v0.24

Remove the 0001 patch as it is included in the v0.24 version.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 ...rs-setters-cannot-be-marked-readonly.patch | 32 -------------------
 package/libiio/libiio.hash                    |  2 +-
 package/libiio/libiio.mk                      |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch

diff --git a/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
deleted file mode 100644
index a665d48363..0000000000
--- a/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 85bf9cd32138539252ed01c355cf766612cf47c9 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Thu, 2 Sep 2021 11:04:21 +0100
-Subject: [PATCH] C#: public fields with getters/setters cannot be marked
- readonly
-
-MSVC would fail with the following error:
-error CS0106: The modifier 'readonly' is not valid for this item
-
-Reported-by: Raluca Chis <raluca.chis@analog.com>
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
-
-[Retrieved from:
-https://github.com/analogdevicesinc/libiio/commit/85bf9cd32138539252ed01c355cf766612cf47c9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- bindings/csharp/Device.cs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bindings/csharp/Device.cs b/bindings/csharp/Device.cs
-index 96214243f..6c8c8f4f3 100644
---- a/bindings/csharp/Device.cs
-+++ b/bindings/csharp/Device.cs
-@@ -208,7 +208,7 @@ public override void write(string str)
-         public readonly string name;
- 
-         /// <summary>The label of this device.</summary>
--        public readonly string label { get; private set; }
-+        public string label { get; private set; }
- 
-         /// <summary>A <c>list</c> of all the attributes that this device has.</summary>
-         public readonly List<Attr> attrs;
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index c523b5d685..f497756eac 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df1577740ea93dca732e7d7c04786600cb083117901dee793f3d38980754af00  libiio-0.23.tar.gz
+sha256  a2b5d848531ea64fd9f95327dfd5a588bd227d9577281ec375e822702c6a52d5  libiio-0.24.tar.gz
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index cfae34b2b7..9e2cf454b5 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.23
+LIBIIO_VERSION = 0.24
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
