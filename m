Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEF5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 11:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48E4E40528;
	Fri, 25 Feb 2022 11:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXkzRSuXikZI; Fri, 25 Feb 2022 11:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A3C340465;
	Fri, 25 Feb 2022 11:34:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 836E21BF34C
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 11:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DBC83145
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 11:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pH9Nt5LYKS3w for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 11:34:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64641832C2
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 11:34:12 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FCE8200009;
 Fri, 25 Feb 2022 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645788848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOZULGGBy6ViDlGubj9SbVt/59H+qXY8yqZ9DB7AQM0=;
 b=UaOKoaXivCxXgnAEJgHmvV6XMKzXTspLyDh5tOieiUu7IEKYdsplWFQR025dYeBUG2n8NN
 RCPKuqlSXUjEg728nViNRe3ntSnt8Fpbn/lRyyNu+ENsTpLGYx33iIMV8fKaNapKCaGt7u
 Pzi+j+1gduQ5xYPsoUyj/Ta02MZgXb1d7MvWTaVdLWTuQqWfp83QQTRwLHMdAk1yYx0ydP
 EsqZO4j+/G510JqNwydJ0nnLu65Su+/KAcP0Rl/FWFeSUndqm2byxkmtaYDVS7ALfTxfS0
 pVxz0H7MTQf4U67jLGRIHowbcFhNlFBWZImH2RyHhSE0hwm2hIpcU5gOQI/W/g==
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 12:34:00 +0100
Message-Id: <20220225113400.802049-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
References: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/libodb-boost: add host variant
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

Add host variant of libodb-boost required by host-odb package.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/libodb-boost/libodb-boost.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
index bac5f1e78f..7f2ad1fe72 100644
--- a/package/libodb-boost/libodb-boost.mk
+++ b/package/libodb-boost/libodb-boost.mk
@@ -11,7 +11,10 @@ LIBODB_BOOST_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_BOOST_VE
 LIBODB_BOOST_INSTALL_STAGING = YES
 LIBODB_BOOST_LICENSE = GPL-2.0
 LIBODB_BOOST_LICENSE_FILES = LICENSE
-LIBODB_BOOST_DEPENDENCIES = boost libodb
+LIBODB_BOOST_DEPENDENCIES = boost libodb \
+			    host-boost \
+			    host-libodb
 LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
