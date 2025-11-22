Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F396FCFD313
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 22:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F47482C04;
	Sat, 22 Nov 2025 22:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3kGvnfExRSg; Sat, 22 Nov 2025 22:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06AA982BE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06AA982BE5;
	Sat, 22 Nov 2025 22:24:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF48834E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D11F36084C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zG3Hd_Z4xZ_9 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 22:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F1AC6083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1AC6083D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F1AC6083D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:24:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5FEA3A4C75ED;
 Sat, 22 Nov 2025 23:23:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51218)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMw0t-0000000041D-3Xjp;
 Sat, 22 Nov 2025 22:23:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Nov 2025 23:23:26 +0100
Message-ID: <20251122222327.1913289-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251122222327.1913289-1-bernd@kuhls.net>
References: <20251122222327.1913289-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763850208;
 bh=JT/0butEWIfxBpSM37Mr6My8Vi13GwXnr5ruCCfHEEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sUdnbq9NY9Yj28njkFPE+4KfznaihomQM6G+zF7k67Z+XnO1EcwZ5xsDViYefaxeR
 CPLEP435zYZQjfT8sR0I4N6fFsE+jawLf34ewahREuQoZ6c7gCEm++bjsAWLhDLRpG
 hptPGyCmfSqj7zx3BhKGPG8Mip59XcI/9AiFH0qJ9pctdxKvF2aALvwGXQefx3mFAl
 Q7/ps5xWocthMLQPau9xtfkY3hx1dGHLDS7qYSFvXXjxLhY0PxKvvqxDT4s3G+eBpq
 SmS5S0eIzmRlWK372rpQGuF43hfBsZ8Hj4QBrgQ/0+z984CKX0BTYfEIbmR7IaKQJ8
 O6zoH2o9Ke7RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=sUdnbq9N
Subject: [Buildroot] [PATCH 2/3] package/libupnpp: bump version to 1.0.3
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

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
0.26.4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Patch not sent for -next because upmpdcli is the only package depending
on libupnpp and upmpdcli is bumped in this series to fix a gcc-15 runtime
error.

 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 5bc282f270..79b4770ed2 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.21.0.tar.gz.sha256
-sha256  e43dbe5020ed25152aaec71b325dd80498e72038da5aeb50ed7dd51e213cd903  libupnpp-0.21.0.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-1.0.3.tar.gz.sha256
+sha256  d3b201619a84837279dc46eeb7ccaaa7960d4372db11b43cf2b143b5d9bd322e  libupnpp-1.0.3.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index fc76a43a11..a1be3e9738 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.21.0
-LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBUPNPP_VERSION = 1.0.3
+LIBUPNPP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = host-pkgconf expat libcurl libnpupnp
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
