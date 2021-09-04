Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59898C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0C660F3A
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E0C660F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB91F80B7E;
	Sat,  4 Sep 2021 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ATLNNWhEBP2; Sat,  4 Sep 2021 21:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 358EE801DF;
	Sat,  4 Sep 2021 21:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D477C1BF28F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C42BF4015B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiZZwZIVA5iV for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E382540105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 69112884DA; Sat,  4 Sep 2021 21:02:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:52:04 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8c6f578a4b4225e3bb042c9455ba6f450f1c16f1
X-Git-Newrev: 7e3b63f6b66ce25fcd1a632cf9b5b2f66b4d6a1c
X-Patchwork-Hint: ignore
Message-Id: <20210904210204.69112884DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/unbound: bump to
 version 1.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e3b63f6b66ce25fcd1a632cf9b5b2f66b4d6a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The release contains a bugfix to fix the make install of the python
module after build changes introduced in this release RC1.

This release contains a number of bug fixes. There is a crash fix for
broken internal structures in stream reuse, that is used when many TCP
or TLS upstream connections are made. Also a number of features are added.

https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.2

Signed-off-by: Kyle Harding <kyle@balena.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aaad2ab8e355f2894f90bdf96909deaa39e14fb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index ec7e940791..3c872aedf5 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.1.tar.gz.sha256
-sha256  8504d97b8fc5bd897345c95d116e0ee0ddf8c8ff99590ab2b4bd13278c9f50b8  unbound-1.13.1.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.13.2.tar.gz.sha256
+sha256  0a13b547f3b92a026b5ebd0423f54c991e5718037fd9f72445817f6a040e1a83  unbound-1.13.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 140b7d278b..37456db416 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.13.1
+UNBOUND_VERSION = 1.13.2
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
