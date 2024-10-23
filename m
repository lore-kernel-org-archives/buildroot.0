Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A50CFA454
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 17:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA4F606CF;
	Wed, 23 Oct 2024 17:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUAvrTjLQ-hq; Wed, 23 Oct 2024 17:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 724AE6070A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724AE6070A;
	Wed, 23 Oct 2024 17:12:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A1462072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F4E401B8
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gS6NuRpVmPZy for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 17:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1550401E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1550401E0
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1550401E0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:11:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3emutYi7ZY7T43emutpERD; Wed, 23 Oct 2024 19:04:48 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>
Date: Wed, 23 Oct 2024 19:04:46 +0200
Message-ID: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKmcI16VukepQzPPpguFCuJctv0H03lq9AefaOUXgqAcwilUmNVBT8dJpkoMEzMrmSIzmMrprsYonyMFvBEfTy1pMm8UOJHjDYnvYKq2pkamE29h6hcy
 8dDLZ51c5ngfWrQtnyym4mtUdKEqc5xJ7XMrTPWfvks0/NrLGfKJJHweWZADm8XsLGl/pHE9TKWpcxyD82RECkZNnErbAg/7pk6p1slL+weYVSlsdj+DTPH3
 v7XF2tj181jYYA1lU0DrEFCgMBVHRQTbeVBsVJk2Lof3aE3eUuqnG+C3Zsj/cKAUwibU9nubSuI0+5w+48eSMxigapyfjn+7ytbGmfZbfNQGsbQpMNwBrNOF
 l4W7zlPj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1729703088; bh=GXGE1cwwx9SrACOw0sdtCtMNWxiraDwXaPDe0SLHBr8=;
 h=From:To:Subject:Date:MIME-Version;
 b=HmfsyVCSlaFJHYiNDjhYyriJSnFy7imZUf4oo2QjIS4GySpri8+ptgUZiuVI27EhF
 W/TRVpPd8dN9towfyr1Xc/TDkP566c3XwgE6eLhCCCZto6nOerD0QsGzl2LOJ2kGoq
 qIDIVETKTKcjAkpR/9Y/D0F9Y3hBaGXH4nhzg0ZGfhSVzvf1RgtDZh2XFOrP5ODX78
 EOP1vMtTjS5qt3gDrK+hzV4QjX6zrjaSahEroHMCVCvjpTUIVPjVbAt44EiKjZ4Q54
 L0DF8pMl6URTbg9jGvCCPTXfjhlHGjjSiD1ugJ0xEtYRW5IES69WhXldg8MgLEHK0j
 1aB/8v0zjAa6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=HmfsyVCS
Subject: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index d59e0a9188..c0738de4e7 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  233d88adf5bae6b4511980f0f6314f348326b55fdb3dc9c4212c810e1ab06789  libtraceevent-1.8.3.tar.gz
+sha256  dc456d4d2bf4b4cd4d0c737d3374a8093f9e5ca18c1d7fc2279a4bf41e613121  libtraceevent-1.8.4.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index 35e1152d37..8c3514f265 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.3
+LIBTRACEEVENT_VERSION = 1.8.4
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
