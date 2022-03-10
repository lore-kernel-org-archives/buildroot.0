Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7783C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 10:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83AF4418E1;
	Thu, 10 Mar 2022 10:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kxy1fe8lkhKH; Thu, 10 Mar 2022 10:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E6C418AE;
	Thu, 10 Mar 2022 10:05:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA361C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 10:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BDD8611D7
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 10:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvDSxjUGXhPD for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 10:05:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53B20611BC
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 10:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A850CCCE58
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 09:56:14 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 53D8DE000E;
 Thu, 10 Mar 2022 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646906168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux2gqbAylMcs91voQW+vhGucq4T80bj21uUzSfXNpyc=;
 b=GO20Xvw9l1rvnOzH3Pw64RBI+xPd2kIbMy7nR4OqKKxWLNtcpDfzkzmPPURfcPl4ISfnsv
 cf08j9Bb0+bkk6LPcztZkl9vvpRXZulG9gEbYCSwyUZR4VX0Suzkj5mKlyN16GdfFoiWPF
 brhfU0y5NAJuG7J8etV9qrUwBHrcgon5vBqcm/ADw4Y6WkTA+ifbCHc6fh4HDmVyaFmLKH
 v+picE5A7S9cS9B19G+MQ5N4PPY2zR5+DLmlfIOfvUcN01RS4eTFq2uXJA4R2Ptn+e/Apu
 BF+REgHa6Has9Xjow19vcTChw50Ar4rNYWxMRJZo7O7ndtfHbfPU4svb8/52Qw==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 10:56:01 +0100
Message-Id: <20220310095602.2435745-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/libodb-boost: add host variant
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
From: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Reply-To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host variant of libodb-boost required by the ODB compiler.
The libodb-boost headers are needed at compile time, and
therefore installed in $(HOST_DIR).

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/libodb-boost/libodb-boost.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
index bac5f1e78f..39c9f91030 100644
--- a/package/libodb-boost/libodb-boost.mk
+++ b/package/libodb-boost/libodb-boost.mk
@@ -12,6 +12,8 @@ LIBODB_BOOST_INSTALL_STAGING = YES
 LIBODB_BOOST_LICENSE = GPL-2.0
 LIBODB_BOOST_LICENSE_FILES = LICENSE
 LIBODB_BOOST_DEPENDENCIES = boost libodb
+HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
 LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
