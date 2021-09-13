Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0F4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:08:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35ABD6101B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35ABD6101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C6680F79;
	Mon, 13 Sep 2021 13:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIl2WTe0VTV0; Mon, 13 Sep 2021 13:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B3E80F66;
	Mon, 13 Sep 2021 13:08:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4FD41BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C43F86073A
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNrBI5zFgCJL for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:07:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65F7D6071D
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 601761814BD; Mon, 13 Sep 2021 15:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1631538464; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=e/xURZP1B33ykv9OKeUdKscNGOT0RxnBPN9AIIFgl7c=;
 b=pDZ6zNT+3k8fv90L7CLwpb1sbexEs77Rj0/MmqSYDGckqvsruZMZKSX/I2q+4qqhCFV3mf
 /RAuckb0UPQLWWzrlJasHcfjCmArt9/VLpSm0D9wliESMsuaE0JgncAZXEUqYhOHJkb+y8
 da6EeD4dJqlao0kvc9u2nbysCzcS51M=
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:07:10 +0200
Message-Id: <20210913130716.85133-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/protobuf: update github url
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
From: Michael Nosthoff via buildroot <buildroot@lists.buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

protobuf moved from the google org to protocolbuffers in 2018.
There is a redirect but we should use the official url.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 75791fade2..fa8ea890e2 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -9,7 +9,7 @@
 # as they share the same version/site variables.
 PROTOBUF_VERSION = 3.17.3
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
-PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
+PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
 PROTOBUF_CPE_ID_VENDOR = google
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
