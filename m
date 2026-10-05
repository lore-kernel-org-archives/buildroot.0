Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780A8CA5FFD
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 07:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B03D605EB;
	Mon,  5 Oct 2026 07:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIaC-YxBJz55; Mon,  5 Oct 2026 07:01:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7A68160606
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791183661;
	b=JxcgwTAIenHLPTUxbppmBxj2yGcM9YJDOJoaYg5U4+tVZGhbTVd70yAsvOUhwFWrLJDc
	 37/oJJSIvd6wXbz64dD/8ezu2ca/NLA01yVjDKI+JuxoHpp1ChoNn89gP7OuKGYiYkPez
	 t3yFA2aGL0BhlAXMwhqLsFIshTV7xbplFinDD4OLH34yqZdUFwSEF9PyeAUSFCJ0SthXw
	 sRlbO348tZSlkxc8Dw+naH83ZoKM959sFOBOlI45e0mJS+kLJtQQ9T5TGh/m98Bht4f8b
	 yNlu5h0kLlojiHXbKHXh0nhycbuWy8pcGvH+xAOta8L62x5HZ5zKul3RwSUFcwf135A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791183661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=R8eKuIw4+tDWJDrDw779CWuEnYgM1mW9L8Qq5u5MYtQ=;
	b=Q/NPT4329bzI3wNhsDYMW5iAmp+afgkTsgNY9+nGd34+2HWQ8B//+t7IAGBGAU2clz4w
	 iCSczctaHHgPUEgFzvJvsWJfKctNEQ2VwEIcRc+9l1AwR/8q7uP16kkwL5JUG7uV2SJXp
	 DqWWl1VuN9L4FY+aAk63hNZO9ZAEj2ehDZZ4CoNU+qU7hV2XEx1vwS3hi3xqCe04dRIZv
	 /2HN0HEpr++QyQQqNA0z3GsjBz/Aeq7hjDjd8GM7E21VPZSN8djyCohC1yLx1W23S3VM2
	 eMvjVGHaKU9QB7tRcAr1VH2+Ny50Kjo49nUk4AfPsd/MektbcB1gkjGKDu7PsByozUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791183661;
	bh=R8eKuIw4+tDWJDrDw779CWuEnYgM1mW9L8Qq5u5MYtQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rpsCr3vFH+Pv0KvtmQlvwU/Q8hj5X7ni6JQiz5xQvak7HqWxl5tI9wDI8sEPQucnf
	 46aq02ZbYuje62qxsEQtsHi71ixYI7kbwQ1QOG0nEySCS1CpJdLx9FPz/VNQtJFv6E
	 U2qY4wh8e8feHLJYcZ/+lAd6V10IJrGz8DpVvdnp5Hm0LyOxxwGYu98XlaO0/4KNkQ
	 LWJwOFw26rK9TGF57vmkk3AIrMqdY8ZgPBBWDmprOKY8Wvagqm8rNZzNnvPuNEekFi
	 CXP4/cVuFYcm+nzn+XbPxbY2poy0qnhqyDxhFLknwbeaUc7406m1Su3BpKn6Lowk4I
	 EQuJ5oASq/EYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A68160606;
	Mon,  5 Oct 2026 07:01:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D97E75
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FE3D400AF
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHMZJ55jnjcb for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 06:58:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D2408400AE
Authentication-Results: smtp2.osuosl.org; arc=none
 smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791183513;
 b=NrlIkMdWu6D9Nl/wnB7vS0cLaI7D7rurtrXSbfoNc0bHpWOyi4TqobS9OTaYS3NedFhd
 uybsEc4oK6Y2TlUFbC2RgGQQSYH8XXPOqPl7SBVgF/H+e4uMSMmEZoepVDXXfKMFn4j4h
 LTWtHmSWzI/PdPDNjJAfT7Clll3YjU4w4vntk9c/8OLwDD18ue91ZG99KCLL5TAHRSaAw
 sLZ6HIp/pHmGoZXCvDXkn1/qHQ9l+z4j4mM6xHrhMubGEvWLNIrOk4oh0fSoCSPV2Efr4
 S/yT0w4cZ23ReXNefillhV2CYZIXzOxJdBinDOJr56oQgXiSNZVm0mQ5YnyOw5+pwfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791183513;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=1/P31trC9Ydl7mj9OMZopQ8ILrXgnTV8AdTs3PwlHE0=;
 b=nPErU6IwI4o9zcGknLMZsoTAfQLRvEJ0/ZjPttABVSCuIkiOOl2YsXtPZve0oV9wR4Lj
 hrlbH3D7K7VV29biywr3ttiOVCRWHKgfwfvRricnsP3kwqLl04J4komRmvyAB1OMLUH2g
 FtAowjpjXXp6FjBr9fzgUyRy+duEErutAu/hCLVK2P6P9Xvywcie8fjBzA2UqztWrnU3y
 EbOrZ3UojwTdAPaUDinEeFp+zOMMmKs91IX/qTZoAebM5n8CkZ4PFq42T20oDrXUV7Lgr
 8DX8CX5jfthU2dk+DLX71HD4olDMdwFubnqfuFctuPQ9pJsJppXww1aa4yxwn+IlZvg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=U7EhtOjP; 
 arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com;
 envelope-from=paul.elder@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=U7EhtOjP
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2408400AE
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 06:58:32 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:2485:b713:3a55:e2db])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A687CE91;
 Mon,  5 Oct 2026 08:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1791183394;
 bh=z+Y31i5eo74Mv25Eeq+aMD6CkQQQGZ0F367qj9M0/DQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U7EhtOjPo3qZ7MBDV+oC4ZTz/0hm3rgO9w5neq8EG9lM95B7D4xWDsNed1N0fg/Vo
 3vJd+yyPtcx7s7pVkCnikVrhkTmZ++HucGReM92PvyruGxtAXppQkAPXNrN9V5qL7E
 9wy95eJk5M1A0V5/3IQLrGogHBTtMdCWLJRUHPck=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 thomas.petazzoni@bootlin.com
Date: Mon,  5 Oct 2026 15:58:15 +0900
Message-ID: <20261005065818.2023521-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
References: <20261005065818.2023521-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/kmsxx: Add option for pykms
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add option to kmsxx to enable building pykms.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
Changes in v2:
- split out adding kmsprint and kmstest
- remove python and pybind build dependency
- s/depends on/select/
---
 package/kmsxx/Config.in | 7 +++++++
 package/kmsxx/kmsxx.mk  | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index fa327ba18de1..8fe023c63ea4 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -16,6 +16,13 @@ config BR2_PACKAGE_KMSXX
 
 if BR2_PACKAGE_KMSXX
 
+config BR2_PACKAGE_KMSXX_PYKMS
+	bool "Enable Python bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  This option enables the pykms python bindings.
+
 config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 	bool "Install test programs"
 	help
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 5aeb48910c7e..10cae6577921 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -12,13 +12,18 @@ KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
 KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
-	-Dpykms=disabled \
 	-Domap=disabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
 endif
 
+ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
+KMSXX_CONF_OPTS += -Dpykms=enabled
+else
+KMSXX_CONF_OPTS += -Dpykms=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
