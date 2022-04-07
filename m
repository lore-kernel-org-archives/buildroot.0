Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0F3C4332F
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06A78419E;
	Thu,  7 Apr 2022 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRA7w_zsSRyB; Thu,  7 Apr 2022 21:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C139C8419C;
	Thu,  7 Apr 2022 21:22:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE5AF1BF3B8
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC6F46127C
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wV29dj74Y7Ly for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 21:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C80CE61212
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 21:22:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k23so9786167wrd.8
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 14:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u0ZgVeTACs/tAFCilOxP4o9sx0MzbEBkwbUVvKGPBVo=;
 b=HrhEqfF67xZ5+W8hOHHtTx7eiqZFpRM7mm+8o2vl0E8if4Hap9TQS5l2gdZzsLutAe
 iXxkqfjpZksX+SpUau1qlgF0wSmmfQcdGo5A4T4nB3kuStcDo150doqtqKAFZXhuJ3hV
 r5sGGpxRUV936ctsK3L7WZt07TNqcbp0KQgML1jbWnE/7/H0uY6TcFsPWErW/McX7j+s
 sgK9iO4N35pwHCXBIDMb/XFklic+a27+an4IjcAATXRVXUizDcHEhkKfRRbMhjnoVWy9
 hy1sZl+k99CRQMen+WSi/iG3pYOHpdyYgfDueYhJrEz5Pssy6SmOlzhTWPZty3l/dcI/
 5TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u0ZgVeTACs/tAFCilOxP4o9sx0MzbEBkwbUVvKGPBVo=;
 b=CylMwIqzcNnu/BvW/oup1sTmDjfMKmzXpqzn7NicjwOV6ZIe55rkN4AeFjp5DfZkSG
 cZuGOAZ9jrVS1giO1G7qMWrzSNlaV+fV6ru4OuVINe4uBQAc3xEfg0TXG+zgzKHazwe9
 ZIGNRP0aNVt3ETet/k/qEn7/K4UJL93n/DrsKDzVCDfg3LTJBTOe5hFPYmBR+CQlN7bS
 81Q/VzIhLU+K8cTU/R3jjR7ctcM4iR6NrD33akwhLLUfGqt9paYYmzqLuMCi5EaLjlR8
 mA8Cizwb+Ll2H6qHUA6VXiaqIxi6BX3OHAFdZ+xd3QokJjRfi50v/9iFJrvfc4y/NOt+
 WKHg==
X-Gm-Message-State: AOAM533KLWZtkizwQl41gRV/x7lJKBs1rne2NPLfDTZauNf8i8PscbDV
 SdGyoVsGNdcIjPhNOU9IrtQgqViexOk=
X-Google-Smtp-Source: ABdhPJzDth0Pt55cBMeXoe8pEJ6ceLCF/9I0LBP7V7oPb4N4OPBI6wB9QAD6tqUfW8AGTKPbuoER9Q==
X-Received: by 2002:a05:6000:10c7:b0:206:135e:c84e with SMTP id
 b7-20020a05600010c700b00206135ec84emr11884979wrx.12.1649366530806; 
 Thu, 07 Apr 2022 14:22:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b0038caf684679sm10988323wmq.0.2022.04.07.14.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 14:22:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 23:20:19 +0200
Message-Id: <20220407212019.1540473-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netdata: bump to version 1.33.1
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball (and so drop autoreconf)
- Disable ebpf, enabled by default since its addition in version 1.25.0:
  https://github.com/netdata/netdata/commit/c857c880f31a89b7857bf01f1f48227c41bf8a93
- disable ml, enabled by default since its addition in version 1.32.1:
  https://github.com/netdata/netdata/commit/9ed4cea59042aa5e5053c4b4b3529e9d70ab83f9
- lz4 is an optional dependency (enabled by default) since version
  1.33.0 and
  https://github.com/netdata/netdata/commit/b003e5fd40c3b42dfacc87db5a7730b76eff0e92
- This bump will fix a build failure with libressl thanks to
  https://github.com/netdata/netdata/commit/6b091fafd9c3b0197325b3ef751dbdb317048e2b
- Update indentation in hash file (two spaces)

https://github.com/netdata/netdata/blob/v1.33.1/CHANGELOG.md

Fixes:
 - http://autobuild.buildroot.org/results/897d6f1425a645667b884739b2ee6f588fd06972

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netdata/netdata.hash |  6 ++++--
 package/netdata/netdata.mk   | 17 +++++++++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/netdata/netdata.hash b/package/netdata/netdata.hash
index 8d5ce51fca..bc33a8b8a1 100644
--- a/package/netdata/netdata.hash
+++ b/package/netdata/netdata.hash
@@ -1,3 +1,5 @@
+# From https://github.com/netdata/netdata/releases/download/v1.33.1/sha256sums.txt
+sha256  20ba8695d87187787b27128ac3aab9b09aa29ca6b508c48542e0f7d50ec9322b  netdata-v1.33.1.tar.gz
+
 # Locally calculated
-sha256 60cdde3f1f8bd9035fef6a566053c0a7195d1714b5da6814473263e85382b4a8  netdata-1.21.1.tar.gz
-sha256 0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
+sha256  0e5fd9d833efe9b79f784d1903281554af82d1b4261af67d35455728e5572aa6  LICENSE
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 6def59764a..da6f8eb18b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-NETDATA_VERSION = 1.21.1
-NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
+NETDATA_VERSION = 1.33.1
+NETDATA_SOURCE = netdata-v$(NETDATA_VERSION).tar.gz
+NETDATA_SITE = \
+	https://github.com/netdata/netdata/releases/download/v$(NETDATA_VERSION)
 NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
 NETDATA_CPE_ID_VENDOR = netdata
-# netdata's source code is released without a generated configure script
-NETDATA_AUTORECONF = YES
 NETDATA_CONF_OPTS = \
 	--disable-dbengine \
+	--disable-ebpf \
+	--disable-ml \
 	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
@@ -43,6 +45,13 @@ else
 NETDATA_CONF_OPTS += --without-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+NETDATA_CONF_OPTS += --enable-compression
+NETDATA_DEPENDENCIES += lz4
+else
+NETDATA_CONF_OPTS += --disable-compression
+endif
+
 ifeq ($(BR2_PACKAGE_NFACCT),y)
 NETDATA_CONF_OPTS += --enable-plugin-nfacct
 NETDATA_DEPENDENCIES += nfacct
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
