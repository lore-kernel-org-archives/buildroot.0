Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF2AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C9466112B;
	Fri, 28 Jan 2022 17:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZ6uqdkYHOSG; Fri, 28 Jan 2022 17:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B22DB60C10;
	Fri, 28 Jan 2022 17:31:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59C471BF3B8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473FD60C10
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VgpkAkpDp0I for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DE6D60BF1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:31:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id c2so4964479wml.1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 09:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMd6EpSN90WIl3DY8Ni8atgB+8rJoqLuY2b3FBqtJWY=;
 b=j0eu2Y+Fo9Tp6CNYWxWVBeKFR2Vi5iqUiuT9DJnueL77lrDOLKNqVArAc71d8LNk0z
 kW0Srmr4owohTefRhTWoIahswDlvYFX9yoYauun2ni3oFo5+qDE1PYLTOAP4Ca00hQeg
 Tb+T/Dh39spoMYZgLvq+8PYQicMD6HWN6wUqAfjwPi0JqfM9bdX4nd33K2XByivJQ0Gr
 VwYCG/P0xLTQac06WsvJ/HKG5gS0QiI6fCFJ4rGy/B68+whAiijI0da5CZAAo+RQEG9M
 kLfKH6PtI9w5HEkWKSl1G+ZI2Xh5LkBbPtFW4/sdVNEHwpANnMer1SKYK1WXpM4eG4lf
 LaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMd6EpSN90WIl3DY8Ni8atgB+8rJoqLuY2b3FBqtJWY=;
 b=v/RHy1/DqfYE8M+5XECQGetXnDE9Du8A9OqiwvwUF/R71ILPMbPL75wSaFkqmyUueQ
 r5AX8gQ1Cqx7LuJPbH4wRWFOXCAxOxXGCivuBnpeIRPj69iFp88/8K0DylQJDh15vY6h
 0uQ+TCpod1Tmtn1xC7VZ5+9VzfvknDh3zDErX+U+QBgkjkugZMIETyI3tt4h6rNPOZB0
 LhDPsOhBdgqp36AyABt9cbzFsw9jDC1lr+ZZnkVF2/PQ5cpLDs4YIgpjb1F89ApnqOuN
 otLc+Rq4hNx/YAf1+H0hh4rQDE5Wgm5NwbMwSCawkDX2w+pcwJFnGWvS1pwpxNXH1GqK
 fMWw==
X-Gm-Message-State: AOAM5302tGyUeKsF6cRJDeQFbB6mXIJHsrMAPN6hp06JMefbb+qT+a0p
 OWoWJI5+R5bootE89R5+zXBtZ9MkLhw=
X-Google-Smtp-Source: ABdhPJz96UoTLrpMD8jt2DkwyYZuw7zRgC5BXfHKujdh9CXlik+lnKIqAra/k8hS1pv0kegEP4qveg==
X-Received: by 2002:a1c:3b8b:: with SMTP id i133mr8297717wma.132.1643391113964; 
 Fri, 28 Jan 2022 09:31:53 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 31sm6217342wrl.27.2022.01.28.09.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 09:31:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 18:30:02 +0100
Message-Id: <20220128173002.2483220-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xml-security-c: needs threads
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add threads dependency to avoid the following build failure raised since
bump to version 2.0.4 in commit
27d08083ed4db5bd055219574cc602aaf8053a49:

configure: error: unable to find pthreads, currently this is required

Fixes:
 - http://autobuild.buildroot.org/results/b6065efaa722f2da911c7cf150d446da621e8c71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xml-security-c/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 02544d5a01..c7963be69a 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 	depends on !BR2_STATIC_LIBS # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends	on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XERCES
@@ -13,6 +14,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 
 	  https://santuario.apache.org/cindex.html
 
-comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
+comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
