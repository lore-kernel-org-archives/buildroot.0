Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8215DC3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E89CD400DD;
	Tue,  3 Jan 2023 19:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89CD400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xki7J0sqjXrn; Tue,  3 Jan 2023 19:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 499CF40143;
	Tue,  3 Jan 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 499CF40143
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DFEA1BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC6D041753
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6D041753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFXuOWs-S3ym for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 19:37:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46CC041748
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46CC041748
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 19:37:04 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 720D013F838;
 Tue,  3 Jan 2023 20:36:59 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 20:36:45 +0100
Message-Id: <20230103193649.7488-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672774620;
 bh=f7ThxUEzEKvGOzcSZs4kcjgUxyx0BWGSXqEKRhU3oA8=;
 h=From:To:Cc:Subject:Date:From;
 b=qV7Ma8tYBa5KTZadY8zlfOE6j9/lgk47Lbh4wWAzR7EhmAzy0hGaNjkAvRDCwo+bl
 c8q4j6fcKYDnoomGzFD6EkQWRJgHIWEM3W/v0zBJvw2ZoNutWMdan1VY+rTU6cw3cE
 9HK4pFA4LO7ynH/2W0/lmMl+FIiMtrsENOFEBr08heY/TDWJOi8OUcqZZou53VrGeB
 ls129w+OLp6uHZbOfncgts3pFrl28M4eI2HYmRgFbh409aHRtjOiNF9PAwWdhy25bp
 9MjQAd1wtGRPZItzNzShOqsfNgBrmBwwIkz8rjxW0weIbEAODe/7wnbno4o81VfLxL
 y9OKYKvrtNAfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qV7Ma8tY
Subject: [Buildroot] [PATCH 1/5] package/libksba: update _SITE to https
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to https download for firewall compatibility and security.
The https URL is also the one advertised on the package download page:
https://gnupg.org/download/index.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libksba/libksba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 3a8b3fa502..727a836cf4 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -6,7 +6,7 @@
 
 LIBKSBA_VERSION = 1.6.2
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
-LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
+LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
 LIBKSBA_CPE_ID_VENDOR = libksba_project
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
