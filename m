Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D053BEEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A0B409B4;
	Thu,  5 Mar 2026 08:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nvq22d4bKVIW; Thu,  5 Mar 2026 08:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C9C40A22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697755;
	bh=naSXeYoKFMkkMpkNNiuW28UTQxujLE9Cjq392TEG9YY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BgTZq5XeFqn/hoty3mspzryQYFc0KMhR2IEYD0VNg+7QjIqVpEIjKQgn9NJlGB5+z
	 FXO/A/8g1eKQixKXX4cQezUz2gZ07Zp/Rv4jYLKLCTLoM2UiI5iVdqGEzx2qG8CSnm
	 BT0Ms383mkZYL0ksIRMJ5Y22qROi23sS4BHBuqH2WYn6PXzYFYqR7CHNjzv6eR5UQ+
	 nHMv5MZsSC11C/+yI2Cj/G7x0t4O55DimavSABiQf5CWjtyDMnVz1ZmrzWr5jcyzk5
	 /OHwmeFuirASoooZYVl6TFh6eHaPBd9ZFqxdv00VM8Vxv1Ygg6iopuEjqMA1hRB6um
	 6sSx1jApna61w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C9C40A22;
	Thu,  5 Mar 2026 08:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0188A1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87121405A5
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0fN1Qewg9qh for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13D6405C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B13D6405C9
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE20081829; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 17:08:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ceb56821b5c1a23ef763bf98e55c6e09ccd846
X-Git-Newrev: c61dbf8493f6e6c45e55716617c8f8c3b8224879
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.BE20081829@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gkrellm: bump version to 2.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c61dbf8493f6e6c45e55716617c8f8c3b8224879
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.srcbox.net/gkrellm/gkrellm/releases/tag/gkrellm-2.5.1

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gkrellm/gkrellm.hash | 4 ++--
 package/gkrellm/gkrellm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gkrellm/gkrellm.hash b/package/gkrellm/gkrellm.hash
index 2f0fbcbeb4..e8a6ef5540 100644
--- a/package/gkrellm/gkrellm.hash
+++ b/package/gkrellm/gkrellm.hash
@@ -1,5 +1,5 @@
-# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.0/gkrellm-2.5.0.tar.bz2.sha256sum
-sha256  68c75a03a06b935afa93d3331ca1c2d862c1d50c3e9df19d9a8d48970d766b55  gkrellm-2.5.0.tar.bz2
+# From https://git.srcbox.net/gkrellm/gkrellm/releases/download/gkrellm-2.5.1/gkrellm-2.5.1.tar.bz2.sha256sum
+sha256  089e3c1ed398482e682c9900b504ea166a6144a6c9fa041e70c5bbca6b177e63  gkrellm-2.5.1.tar.bz2
 # Locally computed
 sha256  691de85c3c6eeda5b6982c751548575344739ce4b4418d78905e599359f6c435  COPYING
 sha256  a4bb0b604fe7d40ca4469ffd5e2e2de70ff8ece43e47980ab2c8962d5e913330  COPYRIGHT
diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 6ee00858d3..16d0729d5f 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GKRELLM_VERSION = 2.5.0
-GKRELLM_SITE = http://gkrellm.srcbox.net/releases
+GKRELLM_VERSION = 2.5.1
+GKRELLM_SITE = https://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
 GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
