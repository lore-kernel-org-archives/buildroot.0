Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4989FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCD861073
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DCD861073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A0B608C7;
	Mon, 25 Oct 2021 22:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAMAlEc4uxTi; Mon, 25 Oct 2021 22:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA766608C6;
	Mon, 25 Oct 2021 22:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A39B71BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 930E24040F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ep_QyC2qYHp3 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:44:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A83C403FB
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=4Np96CT+jtBRPouWLtL3DgDJ9VOeFHeXF9eBp8gMsaw=; 
 b=Du/HkfegO9bppDH3oEyWwt03k3JSy0OBGRiC36ryj6ZjkOeWLdAvxwiGAqdml5Ok7xVPe/7QP8SXYp+rJNOk0W7+xcWuyDOuCCh4Y8F4IGi2XaoPjXx8suInJ5vIgKNgDajCRUxPV+OqnVoMiUfnjMWT7AtuY70hZGFF0T3UvIPuq6O57+kInGwapx0Hv9lGZ1YsMlBpYZD2HSamqWOHft2mEkMmwKvDRdF9YGwue9TsThY4i2rCyZoMB76cLi3HzczsU0MdehhEPh/pa1xpH9ZyI/2XmEnBwkZ9IUi71vp+YjqUhlASNvh8h32sqLJqwB+E5KwRT5iSceDtM1dtZg==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mf8hX-00030o-G6; Tue, 26 Oct 2021 00:44:19 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id accb1a03;
 Mon, 25 Oct 2021 22:44:03 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 01:44:00 +0300
Message-Id: <20211025224403.979315-2-aperez@igalia.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224403.979315-1-aperez@igalia.com>
References: <20211025224403.979315-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/libwpe: bump to version 1.12.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:

  https://wpewebkit.org/release/libwpe-1.12.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 200b6c2798..2ebe4f19bd 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.10.1.tar.xz.sums
-md5  f60fc13b519a66d262afb76c77441870  libwpe-1.10.1.tar.xz
-sha1  1a8085b9a172d37e952c07bbb09b1654d4161ab2  libwpe-1.10.1.tar.xz
-sha256  a327b3ffcf2356dbe8148c1db4bbdc5359d7e7163d177f67551a8393b144adf0  libwpe-1.10.1.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.12.0.tar.xz.sums
+md5  5a3f11789535d826370ba465ea141393  libwpe-1.12.0.tar.xz
+sha1  91aa47a593a5db511d667b3bdbaa76dee4301311  libwpe-1.12.0.tar.xz
+sha256  e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c  libwpe-1.12.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 6396fe696d..fe3c4b16d7 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.10.1
+LIBWPE_VERSION = 1.12.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
