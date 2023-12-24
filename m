Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F43DC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45FE140119;
	Sun, 24 Dec 2023 08:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45FE140119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdBKsF3Wfopk; Sun, 24 Dec 2023 08:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8841E40272;
	Sun, 24 Dec 2023 08:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8841E40272
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C19C1BF359
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74BDA4174F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74BDA4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLQKrxW38AAn for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:13:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E273409EB
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E273409EB
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F35EA4C077D;
 Sun, 24 Dec 2023 09:13:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34492)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJbt-0000sF-2u;
 Sun, 24 Dec 2023 09:13:21 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:13:20 +0100
Message-Id: <20231224081321.19791-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231224081321.19791-1-bernd@kuhls.net>
References: <20231224081321.19791-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703405602;
 bh=ET7mHIFECFQ2LjI9s3nq5j+kRoQZp2Ano4YBoD7TFss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gMklrP0Nvz3IDHB2rqjOQBia5SpimN06B4PUnd4aYLlFjQLtmh6gmawthjYvqrKGV
 HQyFPbnU8ULSD8yARvdeWhZFY5eHRzm9I34eNh2Cuag1UCHiImJwTgCRtygp7dyqid
 FcMQWfNH6OTw3YVuEcWmP6PUm07XH5KqzLFG8zBDjEmjUpF4oY9c4s6nrWlvebAKBr
 Ula+I9LAK8oPLrurmbpntfyFBh4BKouNTu1fJNcDgRt7XxN7oAqq6Avr1TTjTzg8x4
 4lyQoyhmPPd+ZzDS4YIHZ1tidTrffkEZDfWnu0EMrw7L1eJkVYxbS1wAWiD2TMM0qe
 m3QCIeuLWiBsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=gMklrP0N
Subject: [Buildroot] [PATCH 5/6] package/libvpl: bump version to 2.10.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 8f3ea64d2e..df1914e4a4 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  978398c7bb1665a6ad7a1a15cc57dc0204608e56c88436e376b717320a9e63fd  libvpl-2023.4.0.tar.gz
+sha256  524299a7b920ac0de1f6913ca90515858ea3a8ea2daaea60f8e0be62f22c8041  libvpl-2.10.1.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 3b0adaaf0f..0c5d354874 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2023.4.0
+LIBVPL_VERSION = 2.10.1
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
