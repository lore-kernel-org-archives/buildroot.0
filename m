Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259C6C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C922281D5A;
	Wed, 20 Jul 2022 16:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C922281D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1a1qYRZfdBw5; Wed, 20 Jul 2022 16:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE8DA818C0;
	Wed, 20 Jul 2022 16:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE8DA818C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1953E1BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021D641A3D
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021D641A3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd9DTZSye-V5 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:41:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BF6641A1E
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BF6641A1E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AF94C8401E; Wed, 20 Jul 2022 16:27:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 18:41:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfdcad485d818be674baacf22257ad6280904bbf
X-Git-Newrev: 62a94cbd8f0a2cf6cb8fe2b491a77bfb1a142305
X-Patchwork-Hint: ignore
Message-Id: <20220720162739.AF94C8401E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeromq: drop libuuid dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7437172875532018653=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7437172875532018653==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=62a94cbd8f0a2cf6cb8fe2b491a77bfb1a142305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ZeroMQ removed the libuuid dependency in version 3.1.0, 10+ years ago.

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeromq/Config.in | 2 --
 package/zeromq/zeromq.mk | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index cf5c644c39..209acf1a57 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  ØMQ (ZeroMQ, 0MQ, zmq) looks like an embeddable networking
 	  library but acts like a concurrency framework. It gives you
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 219827b42b..452c5f4291 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -7,7 +7,6 @@
 ZEROMQ_VERSION = 4.3.4
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
-ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER

--===============7437172875532018653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7437172875532018653==--
