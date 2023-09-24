Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00705CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A154E4173B;
	Sun, 24 Sep 2023 18:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A154E4173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9ZqE3FG_8Lv; Sun, 24 Sep 2023 18:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B4741734;
	Sun, 24 Sep 2023 18:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8B4741734
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE111BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD18A60810
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD18A60810
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWQeWA5AAkzd for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:36:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA7BD607E3
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA7BD607E3
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0871A4C0860;
 Sun, 24 Sep 2023 20:36:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42944)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qkTxu-0008Qi-2H;
 Sun, 24 Sep 2023 20:36:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:36:20 +0200
Message-Id: <20230924183622.41519-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695580582;
 bh=bd/VMbL3yQgacalj3E54xKNSESpqRj816/Gg5IP8dCA=;
 h=From:To:Cc:Subject:Date:From;
 b=vdQYrj3XYAXsSuXBtWrPmRvuXJGt+o5iQB+Yxz5IPOp9asjITGyuFQJy8VCivRxln
 cTwoktW7xh0H5L74QUmI3jCIDh8S6Cuf+fyQUhzJu8vuP2kfzZaIJL20v6BE/Zz6Um
 LWyf+EGR71qJvNGZGhDx1/1gByZamZasWmMT2zPbqyIMtMRyC2395eWm2C9DPHvpGy
 Gq1IIE9N0egn07QRRFt+ZPWzOziJ6Dg9Q7lSeXzNrofJ+UYqBRuMO6vSwGT7BOPBZj
 0y6Vq3BGitKvFxEAWWDGYrk3tmyjRUMTXyuR7V7+ITFbUWOCYbWEXA6uIbrVd5nExb
 rxS4BUaUt9JVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vdQYrj3X
Subject: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.3.12
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 9f2c8cc1fd..c71f2593d1 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a6005440bf336309a2abbeeb3e006e229715c4b39ca31c6d0e510050e53dcc7  intel-gmmlib-22.3.10.tar.gz
+sha256  14ec859936aea696a65e6b9488e95a0ac26b15126ef65b20956ef219004dd9a6  intel-gmmlib-22.3.12.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index dddd1a13fd..578a6ab762 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.10
+INTEL_GMMLIB_VERSION = 22.3.12
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
