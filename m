Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489C0C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F29E760A62;
	Sat, 15 Jul 2023 15:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F29E760A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAqoc5zoRDqS; Sat, 15 Jul 2023 15:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A3E60A70;
	Sat, 15 Jul 2023 15:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A3E60A70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82FEA1BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C99F81E12
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C99F81E12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCpU-D5kbL05 for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:06:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5229481E10
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5229481E10
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:06:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E008A4C0FC8;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq0-0002tE-39;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:20 +0200
Message-Id: <20230715150536.2959313-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=KMa0RFXG/3HEJqDHUG8veUUEAq2x2t59mY0AklqJaHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQx+exm7/9f7YMSYdt6Mq0n8PTinPFfOGx82QCzM4jV6cItkz/f4tlR/a6PIK52CY
 prqZxL8rcta4vVJPabwpSJCnzuamP9JYNJBVbxnDGkTwKMUeaeL3rmPUWMU7IwSpXc
 DiCSNAXOZyA2bXkQBn5bDIWpzAtaDn8duRPnj8obYa5rv7iK0NE7+2JpvZUUxehocp
 r0bKgY990SQ3ksmLFqCBHojYAOExQQEOQsQUQWsLM6CuBrZ2SQpau4TGQ1UxFdy45F
 gDQuGLynXm0AGGpWwrKvD386oAaO/cLh22/v/AHwJZD/Xo9G5GYfTkHriyo/u0l4bo
 c1iXY8sKIxYOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qQx+exm7
Subject: [Buildroot] [PATCH 04/20] package/erlang-lager: bump version to
 3.9.2
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/erlang-lager/lager/commit/459a3b2cdd9eadd29e5a7ce5c43932f5ccd6eb88

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-lager/erlang-lager.hash | 2 +-
 package/erlang-lager/erlang-lager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 282d112d3b..036f36f938 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  13316ba3006b174cf6b085ad13ed19ec0f618f10b83fc3530a072cdf4b50668b  erlang-lager-3.9.1.tar.gz
+sha256  197c4e6751ad7cde934633b6b53929964c0bfae756e86864f9c198346cb25fcf  erlang-lager-3.9.2.tar.gz
 sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index 7ff27ec0f2..d540d0388a 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 3.9.1
+ERLANG_LAGER_VERSION = 3.9.2
 ERLANG_LAGER_SITE = $(call github,erlang-lager,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
