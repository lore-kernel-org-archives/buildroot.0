Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF55C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B932340C86;
	Thu, 11 Aug 2022 11:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B932340C86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QI_4dfDuo8O; Thu, 11 Aug 2022 11:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D88F3405DD;
	Thu, 11 Aug 2022 11:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D88F3405DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 167881C116E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69DD40531
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69DD40531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSME0v8CttEs for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:48:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25F5540382
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25F5540382
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EA7AB87136; Thu, 11 Aug 2022 11:33:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:46:40 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 61054337b39a3e6da1133ae85d088910e82349e8
X-Git-Newrev: fe8b3034da31930465e2706c9746235d7c552aaa
X-Patchwork-Hint: ignore
Message-Id: <20220811113358.EA7AB87136@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/zeromq: drop
 libuuid dependency
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7317508437463472118=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7317508437463472118==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fe8b3034da31930465e2706c9746235d7c552aaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

ZeroMQ removed the libuuid dependency in version 3.1.0, 10+ years ago.

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 62a94cbd8f0a2cf6cb8fe2b491a77bfb1a142305)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============7317508437463472118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7317508437463472118==--
