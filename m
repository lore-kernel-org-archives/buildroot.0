Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6171C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7968F4031D;
	Sun, 24 Dec 2023 08:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7968F4031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBtSp9dY2-No; Sun, 24 Dec 2023 08:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F5E402E0;
	Sun, 24 Dec 2023 08:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73F5E402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C53C61BF359
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CE7A40395
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE7A40395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ly1yf9eF-lAv for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:14:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE89F4031D
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE89F4031D
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EF64A4C0EC4;
 Sun, 24 Dec 2023 09:13:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34492)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJbt-0000sF-33;
 Sun, 24 Dec 2023 09:13:21 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:13:21 +0100
Message-Id: <20231224081321.19791-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231224081321.19791-1-bernd@kuhls.net>
References: <20231224081321.19791-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703405602;
 bh=lL/exD1bZ1qvYmWhHF4LDVHTQf6H7qWFWPhQSI3Uwvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oTvAopmtqWM/mc20ixxFx+mH50JhoU1f2Jq3e4gXU81G7xV6PO5AbBKdhoo37n7+6
 C5RvZqpmcbEbz8UBwCCPu8Sc1CkJYkfnn3UrNgTyokjgkkDn/y2eeIT96vanx1kzAY
 4umLpT9B5NweuJyTO5YdSsm2/Z4WhD4gQfB/qBffWyVBxI1EkUKP162M+ftXSdlfAS
 APOGWcGTW7KzI3zDIo4+OgrVPaZxF9A5DeoP57c2nUZk6RGNUD8M+FgQfeyZRjHOGZ
 rG5BrTrxooeuO/t76GJCL8sL6y/Eqp6KYA8YYZanDG69Tlpm67k19P/DS9WJx6Re0y
 TMSLZU65/mpsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=oTvAopmt
Subject: [Buildroot] [PATCH 6/6] package/libva-utils: bump version to 2.20.1
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
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index b7b6fe3bbc..f82a251ef8 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a5e3c3c24677a6b4bbee21042c4c06b0a2c62e56ebb1baa4e712392b5c72f9b  libva-utils-2.20.0.tar.gz
+sha256  97413a7ec27ec479b97ffc7ab8acebe053615224a4b051602859cf9f88e4e889  libva-utils-2.20.1.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 4f0fa68aa9..1f53964789 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.20.0
+LIBVA_UTILS_VERSION = 2.20.1
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
