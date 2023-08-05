Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D41C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 16:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75EDA60E62;
	Sat,  5 Aug 2023 16:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EDA60E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywBBhviZ4Uub; Sat,  5 Aug 2023 16:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26F96079D;
	Sat,  5 Aug 2023 16:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26F96079D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 621361BF2C2
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE659415F2
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 16:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE659415F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP7bsCWsQulx for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 16:05:41 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52BFC400E2
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 16:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52BFC400E2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FCFAA4C0C84;
 Sat,  5 Aug 2023 18:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53250)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSJma-0002VH-2r;
 Sat, 05 Aug 2023 18:05:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 18:05:36 +0200
Message-Id: <20230805160536.1517856-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691251537;
 bh=QXtcjPo2z8wV4y8RrawJs0Jbb7Il0v3wA3JpM4i1PhA=;
 h=From:To:Cc:Subject:Date:From;
 b=AEyRxuGTh9dWvpicQfetkXSvS4M41gjk8ZXx95Pk6AI+14nYhQ6hUx48NznuTzLh7
 uNsA2QPBVIs5uEnFYq4VaTn/Vt1ZUcxuvdZ9eZ2VlbfV/gNJQIOYlz6x4oCXqxzvLy
 X549RQf3nVWV6BVJYsW/SoCE2xPHG9EbtZTZWVtYMl0aFAVTrdwZJJuGgMkMMbaM8U
 +BmQxiIBmeexPJkFaXtP3rh/oRLCC8vrr0Z0U1E7SjPY708sori70n/tg6fFOino8X
 clq4SLLj+vipBlgbkL+j3ipA+gsH/YQd1OkadmHdmKMm2r55hn3/RCMin+FPS2SQJo
 2w+3gg1q1+n9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=AEyRxuGT
Subject: [Buildroot] [PATCH 1/1] package/python-dominate: bump version to
 2.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/Knio/dominate/releases/tag/2.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 89293baec6..9993dbe95f 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  77bba29beaaac4dfb657092cd89db033  dominate-2.7.0.tar.gz
-sha256  520101360892ebf9d0553f67d37e359ff92403d8a1e33814030503088a05da49  dominate-2.7.0.tar.gz
+md5  df2d30e7c2e7f1e5b085a58820e4cc94  dominate-2.8.0.tar.gz
+sha256  4c90c3befaf88e612b71f4b39af7bcbef8977acfa855cec957225a8fbf504007  dominate-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 0f3687de5f..39e2edb82e 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.7.0
+PYTHON_DOMINATE_VERSION = 2.8.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/12/d7/5e5f50f5d5bdd4282d2a70b9479c1d91d6628bebd4829e455cdf7366a92e
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/13/3d/8d22916c12184f0c4930b9cdfb136a130e8d8eacf5942fc9883f2a189f6a
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
