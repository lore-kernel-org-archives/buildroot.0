Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5930CE8E67
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 12:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB4D8134A;
	Thu, 24 Oct 2024 12:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sLpytNtD2Gd; Thu, 24 Oct 2024 12:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F4981351
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F4981351;
	Thu, 24 Oct 2024 12:19:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61AF25A5B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 12:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E16181350
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 12:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbsGZHfO6_RV for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 12:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 456AC8134E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 456AC8134E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 456AC8134E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 12:19:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EB15E352067A; Thu, 24 Oct 2024 14:19:43 +0200 (CEST)
Date: Thu, 24 Oct 2024 14:19:43 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zxo7X1XBQ/c7ow3w@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1729772384; bh=+sysfi8zXeTIinh+taogDtmQZENRMxEAbQARSlwxakw=;
 h=Date:From:To:Subject:From;
 b=lnXx4vEi90xcihbBN0+F0SuvYGLDnzGIJGNcW3a4OXx0A12+fjX6yhyV02njpd4ua
 h/Z4m2JatVAzCh/xg6vumzU3F8/G6GVmfjlKKdOIDdSaFp/ttY8MfWrVskNNB+ZhgR
 58+8SsBIep1njmfTd71iMA5YBkUd4bTXDkH8F97Oe7JLPAG+1vDHrHbSZkFYYd5Xjn
 fPDTVTSL2r2l402K/CEbb7LCqtgXcHiqxK85LpKHNJdkG33DD1ILHhKp5NdJtljmvS
 rPrXeN5PgCRWZHa1+7A48AW72L+f0iIy5o6qwx2b+FUxZ7QbW5ZA7Wmq4D7ITdfEFs
 nYSSd6oTZQAgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=lnXx4vEi
Subject: [Buildroot] [PATCH] package/bind: update to 9.18.31
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

See here for a changelog:
https://downloads.isc.org/isc/bind9/9.18.31/doc/arm/html/notes.html#notes-for-bind-9-18-31

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index dbffff05ea..abcbf0a938 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.30/bind-9.18.30.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.31/bind-9.18.31.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  9f6817640970267317e5aa143ecf70531040f2155636b1a63ea45379aa09034a  bind-9.18.30.tar.xz
+sha256  51b258969275c5206ef745a5aac03dbe98f1c8031fefed378d53597e7987b1b3  bind-9.18.31.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 81e608380d..52b1e56c40 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.30
+BIND_VERSION = 9.18.31
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
