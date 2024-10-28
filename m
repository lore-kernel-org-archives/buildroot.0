Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8010FD3E2BA
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399004055D;
	Mon, 28 Oct 2024 19:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgYt1Nshx5xG; Mon, 28 Oct 2024 19:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B6E4056F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B6E4056F;
	Mon, 28 Oct 2024 19:35:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68651AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 494A44056B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39ol0fsYYTnD for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 19:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBFD0400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBFD0400F3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBFD0400F3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:35:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 969F4B0055A;
 Mon, 28 Oct 2024 20:35:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 28 Oct 2024 20:35:04 +0100
Message-ID: <20241028193504.15914-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730144112;
 bh=9e0HnZBTKrE1yZfU7OkjsCajd6SJ/l3YkNXSKNwdr2Q=;
 h=From:To:Cc:Subject:Date:From;
 b=Z3SYQlAfSxTFxHFmxCLEyRThsIMMbpQo+iVSg7CJM7IzNM0l9vSa9GNCFdWYpxA0q
 MY33WSHAfVmHdBUYvRT28H+PS4BLFmYCWr0NdtiTS1EweZt0e+yp6XKqS1BHlMnxid
 OZulW5KS0b5G65XxYjXbCXavx9HZ8jLY+Ww1G/D/ugE3qwBH0iyTrukzvTPNzF5XtR
 3l9W5luMN84OE2arv1VQj3o8+N2DDT0UxQywtX8KpsXWIGmgrLpk6ZU0brVjArkhmn
 EqOMjhGUH5bqLtAuwdaNeq/6DWGSQ39GJl1eEbBtDzsy82S43m/yE8CRkUbmIm5tUw
 /VC6iSwBXcVVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z3SYQlAf
Subject: [Buildroot] [PATCH 1/1] package/libopenmpt: bump to version 0.7.11
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

For release note, see:
https://lib.openmpt.org/libopenmpt/2024/10/26/releases-0.7.11-0.6.20-0.5.34-0.4.46/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenmpt/libopenmpt.hash | 2 +-
 package/libopenmpt/libopenmpt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
index ab501d20b4..0289393024 100644
--- a/package/libopenmpt/libopenmpt.hash
+++ b/package/libopenmpt/libopenmpt.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99feb892d04019220ba1  libopenmpt-0.7.10+release.autotools.tar.gz
+sha256  53a798b8c6e2e1f695e8ad05e93a0c1b53199e5aa9981837c41696b370520767  libopenmpt-0.7.11+release.autotools.tar.gz
 sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index 744c67c6b7..74ffbdbbd4 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENMPT_VERSION = 0.7.10
+LIBOPENMPT_VERSION = 0.7.11
 LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
