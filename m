Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2978C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2DED80E16;
	Tue, 21 Jul 2026 20:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFohDDswJGv7; Tue, 21 Jul 2026 20:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A9980E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784664416;
	bh=u7b9JnSA8y5Ssswigbgf5QcGLLaviHzDJ1W589PCgCI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T7CF0ftiG8ngCNNLY7gObpE/pxI8b2Uz+Fh2N/nOUu3cpDUjomTQZ4dh4AAR8pmA5
	 P3/mqNe09jj0e7Blim0Ro5tY6TjgFLAlr41xw3WiHcWV1yxlcZDbdoig9KEN2aJlfN
	 E98laS18hHQP9UH7Xmi7ggdLtiUHO253Ee6pQ5hNb9EtURYcGQhQ2RKGPv7eNu4SnM
	 NaumPI+iuYfn5r14UasB/z/heA2Ez8SNOK29H029EfLbxP9qW6a/3SImKWVODSVG+T
	 MheZnqmg2aLOzdpwGccFcVhmrxYahFyhve4TeIxyZtO6R2+IfItqJabZDUeoMqG62X
	 mBvvLoFOqCDAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A9980E24;
	Tue, 21 Jul 2026 20:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C772EB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E8CA6063E
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6k_sQtthLGe9 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A415160611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A415160611
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F35C89097; Tue, 21 Jul 2026 20:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 22:05:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c8bd5739c1d63550bc80f0b204f67ff8a2854c8
X-Git-Newrev: a33f4bd9044f49dc52bcdadb4aac54aad0b8acfa
X-Patchwork-Hint: ignore
Message-Id: <20260721200615.4F35C89097@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protozero: bump version to 1.8.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a33f4bd9044f49dc52bcdadb4aac54aad0b8acfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/protozero/protozero.hash | 2 +-
 package/protozero/protozero.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 917746af35..e67771c3ea 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  6c7a896f1dc08435e8cd4f3780ff688cd0bfce6890599b755f6f3cb36398dc25  protozero-1.8.1.tar.gz
+sha256  68d1df951b4d8397355c8fc9ffed40d9c06282a877fe847403feac6edcee3ef1  protozero-1.8.2.tar.gz
 sha256  254c0e9f18d261bfc55ff277cf12e3c1ca25839d56af17fba65d142396021466  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index c5c4285955..66bc0dea0c 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.8.1
+PROTOZERO_VERSION = 1.8.2
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
