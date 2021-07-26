Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C74C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:47:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F49060240
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F49060240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D5B040449;
	Mon, 26 Jul 2021 21:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d52x1nzgdG2X; Mon, 26 Jul 2021 21:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6FD14045B;
	Mon, 26 Jul 2021 21:47:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C88B61BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A0A607C6
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78llx2RY_XLi for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F3E607BE
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 974948902A; Mon, 26 Jul 2021 21:12:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:45:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 732c993c9031d95ddb16637d48782ff3c80074c3
X-Git-Newrev: f7f7bf54617b7276928c7192f9d2268acbad8fac
X-Patchwork-Hint: ignore
Message-Id: <20210726211238.974948902A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: use lapack instead
 of clapack
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f7f7bf54617b7276928c7192f9d2268acbad8fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The clapack package is deprecated and will be removed. Use lapack
instead.

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Damien DUVAL <damien.duval@smile.fr>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/python-numpy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 8260de7e5d..72c6e0c981 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -17,8 +17,8 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 
-ifeq ($(BR2_PACKAGE_CLAPACK),y)
-PYTHON_NUMPY_DEPENDENCIES += clapack
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+PYTHON_NUMPY_DEPENDENCIES += lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
