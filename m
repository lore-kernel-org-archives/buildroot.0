Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481EAC83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0604417F6;
	Wed, 30 Aug 2023 20:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0604417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngzzl94FXBK6; Wed, 30 Aug 2023 20:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33D2B417DF;
	Wed, 30 Aug 2023 20:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D2B417DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2B01BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E79FC417DF
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E79FC417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbzrGK4Qntx4 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:57:15 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61DF6417B8
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61DF6417B8
Received: from fli4l.lan.fli4l (p5b3a0af8.dip0.t-ipconnect.de [91.58.10.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 839EAA4C02EA
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:57:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50914)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qbSFV-0000E9-0z
 for buildroot@buildroot.org; Wed, 30 Aug 2023 22:57:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:57:13 +0200
Message-Id: <20230830205713.1219588-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693429033;
 bh=Z1LXuiyKgI8fvuxlXGTsHK16Nu4IbxKeKqF7zjouIJs=;
 h=From:To:Subject:Date:From;
 b=XJfoSRP+ytkXNJyM6VF8YWZmGOkfDXITeRvtQaXh3ZkI5DT/sfkbEaDju2siZ/fBQ
 yMS6USWI7y3H/56j1q/HD5Glt1BlqC9tdk25plAmjM1KnJ7wqIzZ+v+BfRIZA79I5k
 jwOw5e+Xy2i0F1k8NIxu7OqyVtdG8SEvZ/xhPfTfl2V/vNJHz0B2tIoFpmzOdqsBB5
 idIZBfiwa2lLtxqAFmkV5+LLhe2kNzWZr/JpmR6zViXlyUTNKSbqjdi1sbwLvWNJk3
 VAFT7B2xj7uCmz69y7GHfcbeKc6b6wRS6pgGkuaCfKcrjc5rHhDaa6PWlV6jot4seF
 zV7Q92SPxxkIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XJfoSRP+
Subject: [Buildroot] [PATCH/next 1/1] package/tor: bump version to 0.4.8.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://forum.torproject.org/t/stable-release-0-4-8-5/8996

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index d87e2742d3..b6b183c2d1 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.4.tar.gz.sha256sum
-sha256  09c1ce74a25fc3b48c81ff146cbd0dd538cbbb8fe4e2964fc2fb2b192f6a1d2b  tor-0.4.8.4.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.5.tar.gz.sha256sum
+sha256  6957cfd14a29eee7555c52f8387a46f2ce2f5fe7dadf93547f1bc74b1657e119  tor-0.4.8.5.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index b3360d3c3b..e86fec29f4 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.4
+TOR_VERSION = 0.4.8.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
