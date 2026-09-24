Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E46EC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 21:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D2B8124B;
	Thu, 24 Sep 2026 21:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrNX9LrB6sHl; Thu, 24 Sep 2026 21:42:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 812B98123E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790286121;
	b=irMgz7pNTael7+SSxjlNQgVXG1r2GOIkdWxDyPEMc0NIJqSjBU4DhwwRGtvmSZvDNhfq
	 kOggN29ifSKuuKScldC83W+ByjW7/Uh+7LFbPfJuGRQ3a86FHqArMytxKiu2PZOb62KHm
	 5JyXJYRGIGbiRHodbp4ScC5khfPDiK8ECq2DOxV3kzXuAeJRcYCu+GHkpFloZ0ezYbXtR
	 NAR2OV1qg2RG5ncuiQ5x7PZA+x47AWOtEJo+dtBCBY6vM7LzKKykx9Z+vI6YJJvA8NMqj
	 cZ6bpDAcVAuFbpRVK8W1UWwKTS04FbNwl53NQk5NvfbP/nBuyqjo/+fvPm/hGiiwhdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790286121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=G7VZPJaN4XH+wC8SHK7XTayID8B8mJuFPrYiOgAVB4Y=;
	b=STp2tdof2LmVOumZnRZTm/M3IUTvGvOLfkbaUbq2QOktATjHZtLwlCL4CVgqH7uSbqeb
	 p2J1nw1+/ptrIR3uGYwkhAHwqSUmycA+CjyRL6YHjzYB7O6+ZjEURlcjMfm6/OxP59QpQ
	 +WxvGHKp/QDkuWJIp/odtwkY4v1SjYXj+fymSGIUdjJHys+lxs5H9iBS/OWYfYXt73/nb
	 /E1DmoS/as9pEcYW7InYfu4VZWiMc5qcxoC15LJYGZx4RptKNRtHzEORV1EqMh4RIJfO/
	 DdtgI6PZPQA4f6tEvn/0t+EZMj5cMlBtXjyXVTiCvsuDYuUzwZj0gIhwnHGxFTMdraw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790286121;
	bh=G7VZPJaN4XH+wC8SHK7XTayID8B8mJuFPrYiOgAVB4Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ryVEkJMMqtCMFPQj9MSkzZxHUDriv+d6XXd30jQtolCPcH8BlHMHXNxEa+SsrlInO
	 WBaIon/oqVj3qOA/ICgSgIzBulO5Fl67R1icrvriasQwle/pvc3XFTBlynt/ekmKe3
	 PCAP7x74JMLRayje0Vui2Nsg+OUts0dob9ddSQoQTUKVROtqPUNVYUgOWQLJMLH8Nz
	 wbVLRy5dZC9CMuEjUQKJ3otqdlJauwA9ro2rHiNH2R1I2Tt6OhvDZ7MjbOXF+5Sn8c
	 3xO7pWr9Xp14O8i7/zekMk/kM6NxNmnELXvdkmyUxHRKL4P26nhVvMc9qdhU82+euA
	 v2x71XUfzga/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 812B98123E;
	Thu, 24 Sep 2026 21:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 968CFA32
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 21:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F8C40CC1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 21:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_kzwS6ZUxxe for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 21:41:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3FDB040CBF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790286118;
 b=V0L8V3ar3CRQAHq09btKKVoaMYKOn9xu8waot/lLI5yOOobAyPGfH5F54cNjCiFyCBjV
 Qw+zcFUyRbXOPFn7uKWW6JqpxT16wuEu0OdK+KlJPkOddTY+aphclfI6JDev/aW8w3I+p
 IWr+umScwymv36+pAppVPRqhLwcencMmoQkP9wWm/Q1/R1UGL3514akociBNZVi5ugoYd
 b1ASAFR3KuQ7fIxkmS/qcKwb12bUBNLNLcfLpZIxjubkBq4P+sjklYh9oqdNkIXqd0Xt3
 tpjgSzBrOm0zHJzk1AJOZeIeQOzqORCEhCG4Fw0V2Yit5galmf8w2UBUpttJLPLrnRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790286118;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=GcqynGEPFhM4x3hN4BDV7JyDLX8vIJs2vqOT6Je6IlM=;
 b=KHwx5vX7PLUZdactv5VohWtxgjWcP7piGNMppgZ27nsvXkssEU+F58nU+TN9IrZhtnSN
 AwfBdP/wc3qDdZdEDnbofAS3dI7P010/1LPYng7Z6/PJ3WhyXP6uorFL+mrEug90olQIs
 MTgJWrIgNpsM21esgWqvwgTk50sK25oM1Zpf7/kQXgjYoaL4w2ZsUx2QG7DpX/y/jZ2pd
 WNI0QoysZ44cCi4JwrCZXD5UuIJHUcPmWG+L2KRhSbHc9USUJYdUWv7g4HC60lBuhJI2F
 /mE1Hu6rhGrWhtbYomo0drm8Y9Bs6yxHqNsUV8o0rLJIBAffycGd0eHViWlJzJ0dNKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=l7U5M2ZW; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=l7U5M2ZW
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FDB040CBF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 21:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=GcqynGEPFhM4x3hN4BDV7JyDLX8vIJs2vqOT6Je6IlM=; b=
 l7U5M2ZWzome/gm2Rr/TLgHDUG9DUDMbzfxt1CNYbOxA+0N1lNRZJtg2loN6/1Ux4DCpJ5RxzT1A9
 8cLVPVnKdDMSzlBRA0y02SqCMNpUhnqrVeWBhwuepDEjA5mUOVY+UZDPCKPR9ONsA7UwrHmXr3MCX
 yW2r2cxUTbri2lRygFSUIXsFeMJ0klpnVVo61E1gpAUU/aeWm/etWjT63vWXo0jiZG+/pZayLdnFK
 yrvSCd5qkOyBinIRyIFMLZcGXurWwbDY7U51zzpGDOnWQvl/5h0mnj1tPsqCryJQkFTK3hC6295+u
 tm1UmuV/tY2ZmteKt+K5LXXv2Aluze1rYQ==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x9rCQ-006rH8-5u; Thu, 24 Sep 2026 23:41:49 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id b448c5df;
 Thu, 24 Sep 2026 21:41:49 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 24 Sep 2026 23:41:47 +0200
Message-ID: <20260924214149.1533853-1-aperez@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bubblewrap: security bump to version
 0.13.0
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

While there are no CVEs for this Bubblewrap release, it includes a fix
to ensure that arguments that receive a path are not empty (which before
treated those as the root directory: a bit of a footgun!), and that is a
follow-up to the security fixes included in 0.12.0.

Additionally, it patches a number of build failures, which fixes e.g.:

  https://autobuild.buildroot.org/results/2eb2d222daaadc2eb16b42fa2ec102ab0689f038
  https://autobuild.buildroot.org/results/674413f089ce9b80a59058674b3ef6879e1d389c

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.13.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index e150e1495d..43b22dcb5e 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
-sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.13.0
+sha256  4734237473c0e5d695e4e9034a34e43b2dbf5164655bd13fa59ae376b2b7a765  bubblewrap-0.13.0.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index cb31406c8f..dcc3c23d7c 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.12.0
+BUBBLEWRAP_VERSION = 0.13.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
