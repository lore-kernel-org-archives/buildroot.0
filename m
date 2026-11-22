Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED74606A31D
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OtATvR0i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmxyjQH8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4836360635;
	Sun, 22 Nov 2026 20:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x73XfEG_3CdP; Sun, 22 Nov 2026 20:22:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60EEC6061B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795378925;
	b=puHrpNI5W+Hr9VqAGGvWOO3rJYG+IcPa+jsOLm2CoZ2PdDqPB4jqyLZ4+39Sg0MiJInc
	 g14afZ7oOa007xMwdy0MMvDnN2CaotXnGRxDMrmhd04TL5qH8fcwmIEWA7yfZc0aezRVZ
	 Hwi+72koc9xovKiEOHrm4YoF+Hi6jEmsYm5Wp538LUQhZhtD/ZnunIK7KYV7b9VtIYZO3
	 p71p1NYxWZturs+NgFFuodb5z+MDZzfxbf1RGSV01AF76H5z/1OOQYtoAPgSh6s7aSLHu
	 40UV/faM8MSHvrXlwDy2h/UsgkvU9f9U2ThH3+doriIDJYhdPlRolJTBxW/7mwVz20Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795378925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2diNYUj2z1/rlmuYGg5DytgOWjR7g7D55Yc3SiIojs4=;
	b=e2brSTpq2cwVphNVGe8FQ57s5Z+JrdPncZEhnsTm0xcrK51M29GaJcmkpOFPuzI+fKA4
	 8ibSV/bA0grY5LUaGZMiuJGC+YUmCM+zlaIS2fOVmHQUfkbflmLNfhUkxkwj2k0Vxp4h9
	 yjBODONTIdTd3RjP3Zh3y83EKLLWaqWxVSXsk5JtvTa/ZSLvz6WqTAKDUtmKuVCqFnSy9
	 cW7fN3DY4Ys6EtVMwdWXNeD80Wy6qHUk7WCJeVFbGzL3TS6Ph/8hljJg/wJi1OB067MTC
	 hRDa+hOp1mPs0moBnwMDyYU9bOOy2WIfZYn6UCcJxT8JaXW4RhDSmK3Bn1rUM+1MB0w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795378925;
	bh=2diNYUj2z1/rlmuYGg5DytgOWjR7g7D55Yc3SiIojs4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OtATvR0iuDChsEpo1JYzX7QQe6Z5jRAKfgVZoUL85wFHjmuqpZ01dtRr/Tbqh08ZL
	 2Dhsm5ClWcvODO9AtWBDMqvdr74M43G5pFP2EBLP89kIht4UC7/ySm826H5tOCSWCA
	 UIKkABkzbW/AA3Oqu0aKxozbHAK9UYlGo28jt1PAxIGMtXYJx+zMAaGVSLHiNoqEaq
	 g9w3qrWijsap/vplF6MESeoCsfkjEnFidP2GCaZuAH6lXm5VtFc7WamJ85gTRJinxP
	 ESVq+VTNaGdMauxm/DowjVSphCVLlJdEyQd6GrEy7HPaomrA5psoxfYaYc89pDfl8w
	 X6S95uuxLBkAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60EEC6061B;
	Sun, 22 Nov 2026 20:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F304E310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E00384060E
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CMqN1-wZAOm for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 20:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE2F84060F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=WmxyjQH8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE2F84060F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 20:22:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so19298495e9.2
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795378919; x=1795983719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h/KF4m0n5mp/nHCgKucgTUunig6pt/b0DEyWy8i56R8=;
 b=WmxyjQH8Qh7pc3QRqF+K75Rz9uZqnYabngrK/JMB1LJMqgOxsdIltY5rj14Tkw/QCr
 g5x990RzbE7iR0mMGe25uXHgw1EaPCobB/YrYrhVsrziXND33CgbQm0+YpebhIOoXG18
 SI9ZNXJZS2Uo1t4PO6CLritMcW1ddp9K9/mrYnEfJjxc3pmyLdToFgU7+WHhcWoXmmwI
 fxVgo6GCgnxDzjWU8ozzQdZ2NH7RjuppfoPBXq7tKrvRD0nMqtCGwqu3Q2H7uaDymK/E
 OCRfgrFFaMPkcAPiJ+ksjuGn3CZdLFNPN902SxJiHkoXVSK9z5AN+P00+SFWfz9TFiDG
 EgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795378919; x=1795983719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h/KF4m0n5mp/nHCgKucgTUunig6pt/b0DEyWy8i56R8=;
 b=OJkd9yEOFoplCZtCU8lh/jsElpWm69wXkpu8iHoAIJMLwQD/Z0fFPE7+2YIbJMHiJv
 VXcQ7yNOp7ID34ItK21tcWUwzjJkjrNYudAqwB+rDni3SeknXLxXQABe0nn5l4KxAWF5
 WcBVRjSP6UrkWi03MmRsnPHjYGmNGm8v/axyVYnmO4sthlck8bC6AG2TB2Esc4uQLiKX
 m6WTGJgSyAb+DwHwX1TIDzAUG8kM3BdoIOMZdA1o/ocf0ygeerxH5eSi1YstQtpHMdtp
 8nbKJK12hxfBMFaclbBVJpTI2heCIvbr07iWXDAyij5gEIlqsWyv+D7CF9ZCpMo69chE
 2Ruw==
X-Gm-Message-State: APuU4Z8hvVuIUJ/tNw0beRAT63ovaTIlnWefjnthRXH6CBtajfXs9Utf
 PkDxQE9S0E737O3MCuUS5b7E5qihdQXNSr2rtr+TQ0t6m35K96Y3+FE9c7YjXogM
X-Gm-Gg: AZFdTZfj/oonnic6VKaY8f8xQWGn7ZSYT05hkDtu6p8yEwTZU14Y/5tXNSuZ5cqmThb
 Fx5NMofDPamghN8X81GwdZjVbH2skH79FsfBWeAKBfvdkN7YnUDl2+UhKtMI980qR5YMxJ+QZX+
 kN5ArytOZAAIDNa4oqa4fdhN2kZ0fzK+all0whle0Ii2leUBkHdl4Egmj0U+hjMw8+M1tcmEwN4
 Uk7c5ikkji83sf8sKJM8bur2gwWjC+UN29KUf9ZVMdH4EpqLRvOLv5slu39O/jLSqMv1U9PK/uX
 PIhtmPQsHJfUQM2vuKDWSL/7DLpEOI/xA205RJIpamrOYAIUzDuil2JnpdtKafITNm2xsv8Bdi6
 rTWG+jsPOrQxX1cglem5m0uF8Vw2d8R9LqFNaZ7RA4cgp4ejN/OT4di6T/InGY1Xeu/jvjnYGo9
 9TChw/dHNsU/enkpqZVyEReVHJnsyK6A9FVIcQ8HJxngoWUz6Hmfc9UBzKWb3geAr9DaN8Rw+0J
 0m3lVC0fn8EQBNRYHwWHQbzrsoL2WU86kXqF8AaTCLOa5wn2t1n3T+MUURvyLwbQG0TnsC92znr
 4AfbZ/hc7xn5/ivL/aj6JadfWlI7XtDj58K2jT2OR3KtlTjLjMU=
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id
 5b1f17b1804b1-4bb8881409bmr219611415e9.19.1795378919328; 
 Sun, 22 Nov 2026 12:21:59 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm319409495e9.8.2026.11.22.12.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 12:21:58 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 21:21:52 +0100
Message-ID: <20261122202154.3606582-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
References: <20261122202154.3606582-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/qt6/qt6declarative: add an option
 for the qml tool
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qt6declarative always builds the qml tool, which runs QML files from
the command line, and installs it as /usr/bin/qml. Most images run
their own Qt application and don't need it.

Add the BR2_PACKAGE_QT6DECLARATIVE_QML_TOOL option. When it is disabled,
the default, remove the tool from the target. This changes the current
behaviour: enable the option to keep /usr/bin/qml.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/qt6/qt6declarative/Config.in         | 6 ++++++
 package/qt6/qt6declarative/qt6declarative.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
index e24133c3e5..48b5a5cee2 100644
--- a/package/qt6/qt6declarative/Config.in
+++ b/package/qt6/qt6declarative/Config.in
@@ -14,6 +14,12 @@ config BR2_PACKAGE_QT6DECLARATIVE
 
 if BR2_PACKAGE_QT6DECLARATIVE
 
+config BR2_PACKAGE_QT6DECLARATIVE_QML_TOOL
+	bool "qml tool"
+	help
+	  Install the qml tool, which runs QML files from the command
+	  line.
+
 config BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	bool "quick module"
 	# Enable host test module to ensure that qmltestrunner is built
diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index 02a17a580a..574477c94e 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -59,5 +59,13 @@ endif
 
 endif
 
+# The qml tool is always built: remove it when not wanted
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QML_TOOL),)
+define QT6DECLARATIVE_REMOVE_QML_TOOL
+	rm -f $(TARGET_DIR)/usr/bin/qml
+endef
+QT6DECLARATIVE_POST_INSTALL_TARGET_HOOKS += QT6DECLARATIVE_REMOVE_QML_TOOL
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
