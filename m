Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C53C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 12:23:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AAA6127B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 12:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79AAA6127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266D7425DF;
	Sat, 18 Sep 2021 12:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7GrnmnAqz1e; Sat, 18 Sep 2021 12:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8962B425CD;
	Sat, 18 Sep 2021 12:23:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4C861BF364
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 12:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D476784345
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 12:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUe8k038HA9C for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 12:23:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4161E84344
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 12:23:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1881C8B514; Sat, 18 Sep 2021 12:21:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 14:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93cbbb2ce8b1e196e7a22fd43a31fe8c932b9605
X-Git-Newrev: e851eb6c7a1d91ca3a3b929417fd0f1677fbc870
X-Patchwork-Hint: ignore
Message-Id: <20210918122116.1881C8B514@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: fix compile without thread
 support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e851eb6c7a1d91ca3a3b929417fd0f1677fbc870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix compile without thread support (add configure option
  '-DNO_THREADS=ON' as requested)

Fixes:

  - http://autobuild.buildroot.net/results/2cca5952e7d677cd0d5fa97aa1a7bf3e722df3a2

  CMake Error at CMakeLists.txt:409 (message):
    Unable to find pthread dependency.

    If you want to disable multi-threading support, set NO_THREADS=ON.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libiio/libiio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 4ce933a0cd..f706298c22 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -17,6 +17,12 @@ LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBIIO_CONF_OPTS += -DNO_THREADS=OFF
+else
+LIBIIO_CONF_OPTS += -DNO_THREADS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIIO_XML_BACKEND),y)
 LIBIIO_DEPENDENCIES += libxml2
 LIBIIO_CONF_OPTS += -DWITH_XML_BACKEND=ON
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
