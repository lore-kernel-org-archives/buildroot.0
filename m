Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E161C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 11:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43DFE607FC;
	Wed, 16 Sep 2026 11:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLCiZiixinBq; Wed, 16 Sep 2026 11:09:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4C636607EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789556969;
	b=oZIdAIrTK05MGvrCAe0dQIdRXj42Pv/75nGd3cYjli+zWi/ZMqdhCaryYPCF+KxDDrIg
	 ByeyCmt6TUNR3zObLQGD3XN2diWU1RL1BXvevzUzKbBvpgpno6YQMNLo7CpyO6mXzwtte
	 IGsFYxtakxZ8xD8W7I/L9WkhXX56Tn5sxZxlH7wdHhuz+zr82kXGEp9AEl6iIpDTMVEwh
	 nxrKRz44M/i+nvqXa9r3/FtzCUpeS7RYMtYVBVBRlLdQMMEOv5OEg84oMxOZn6tjvrAFj
	 vJTIHWuYSHxk0LkgGUM/hS+DbBLdE3Xd/dhIpTWlWDTnZE7wP3AL18DE5nn+9D79Tnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789556969;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yzdLWS8vahmWUNRzlV0Fxik6WMDoWxje1kDFdBe4AxA=;
	b=ZXMIntR2ciy7/zFPbglPNaWTHwIgf9eJLpbJMXtee3aztO6JlwX3R3fsbze6qveqGZ2S
	 Ma8LD/Tjxg4PLv80A7Aw366PwmWC0S68r9lpNeRsILZGUUDdm4xTE69lXKhiUjIXn2ZMC
	 /5qtkO5SITjjquRh3+9Mqu3z4Te/rlHZcv4zzAb7c+rjHVBQqz3+hTgP73jG/tovojj8z
	 pOLYhklFDKDi/zeiB2LjMJwrkIKLg1JePSY5ZXEfYD2LpjYwvqPSicwYro21FX+hKMdQe
	 ENmnboKhDs/TQOeaoMe8+5qxIwbuw55ymZfLhvZXLuqcJfOGoDMQbtZ24HT17GQkfZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789556969;
	bh=yzdLWS8vahmWUNRzlV0Fxik6WMDoWxje1kDFdBe4AxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cL0Ff/KC1vRzT1WR7nmVl43Ju6dnzCdCuUziTzoX2p5woqkDq/vLlL0j3dizSkNVr
	 E11uake1tnywQFmjspUT+8B6zTue+CAa3X2cv+z8rDf9Na6nSUc1dw+EWlxwdl4aXA
	 8HwlCilNjYnCl9IjJLK4mBGvBS57f4ETX9/7QroW+Gg7cv+Pj40PAbk8vhqpQaRmMi
	 ISiwyF4Dns5qNSX/UkazfTS8H85gQXB5i9cq1AyDkAyYp0TByGTfFG1wmoczYHVmna
	 1RZ5qpw8q/SShfrGgUOV1BxD9+/uSvOXDmjPKDXP8GvxulWOnv3kH6zMCDV0+K+q3i
	 JlOZdT3mGHNYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C636607EF;
	Wed, 16 Sep 2026 11:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C242B2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF99380DF6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrxOYU_UppoF for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 11:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4870080C8E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789556967;
 b=XFwPgXWkqhyWcIoswYztYAPEPuYwm3YLQe5xtfYPE+mlMKb5APIII41cwHDvaVrepEgG
 r/pXLXz7gH8QyLIbuSSovdjJDTzxhv1gPZauV/FJm+TV0XDb7r3COsskW9RkUEjoNS1S1
 SPp3vfOw1gU/T8860m0s+oGXQ0Km2Bx43fMvoeDFB4OnH09pRE065MQaQe8Jr1QKRPjA3
 fW9SAscbgy6ED+Jcm01jyxYqRThLVG4GI+XsUJ6nsl6MERHPFf6PDawjYehDj+XinnF7Y
 yvTRhK2DCrJqH94eo25jYoauAv5yW5OiQFn0avL9CbJko7hUwlpbKgs8mZds0fD59Aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789556967;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=N/qaYQkSVtOdvRTY1+69WVXY+4Wt/CMIfo37HH1JqRw=;
 b=bL4D0mdmEeN472YtdRHkBwAOiGXgjrFR2bJ2dwZMThvqS2DC1JZOsrXK9WhU/mBiBdCb
 zZc8TTDfEW7388UmgZlKS7eSC9MGz2nBBEI889/03ASeEHoMmTci2aaUxgLRw8tmthQll
 azoVma1djCfJ0DBTgUcIKIu9XBfoPzkUHURPqVZr7xFFdePKlC+Ig8mWQMNlhfY/FwSQ8
 dgUn7Lg9xRdRrZEySNtwSIuXgS5JYXWKvEdCUlLI5z9h8D3KmbIweMCakuUU+hTyO6PvB
 CC4ClTS4iBGMXPwX7yYtCmuQbp8EUk3ivhjbjoFSKrFAdc9LQzcOg2xBI7Qim1G3BsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=EiIMJ5z1; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4870080C8E
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 11:09:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1wntHy2pnr-00vKD2; Wed, 16
 Sep 2026 13:09:21 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 13:09:10 +0200
Message-ID: <20260916110912.265693-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:CjgOzW473Q8jcT2oVSDBVgCYOsbuIDdn9RchLaJdXe8BZAbRp1B
 bfVrR6D3zNuK4NtpbI/dG0b7qU/SuGLvm7KBjuKLkTQiAniUs2KH35KtKfd+SqJEPtoCOeA
 V9O3/S1vmJez+VPDQoIpcq9LRWpJengAsoOlVNoui3SfO1O9qZLmsZO+jLGjcWBHgbE/t8u
 Wbr6pT57+vNqluOfLFAjQ==
UI-OutboundReport: notjunk:1;M01:P0:kejRqGAM2xk=;udsLIym6ty1B4qPZy2zWFo6TnkF
 +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
 f9rP
Subject: [Buildroot] [PATCH v2 1/3] fs/common.mk: add optional hook to build
 a verity hash tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Using dm-verity may be useful for any read-only filesystem read from a
block device, the new hook will build the required hash tree if
enabled by a per-filesystem config option. The config option for extra
arguments allows users to override veritysetup defaults, e.g. to set
a fixed hash algorithm.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* add _VERITY_EXTRA_ARGS to allow users to override veritysetup defaults

 fs/common.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2f3f8bcc7e..d51d82b0bb 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -215,6 +215,15 @@ TARGETS_ROOTFS += rootfs-$(1)
 PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 endif
 
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_VERITY),y)
+ROOTFS_$(2)_DEPENDENCIES += host-cryptsetup
+define ROOTFS_$(2)_VERITY_FORMAT
+	@$$(call MESSAGE,"Generating verity hash tree $$(@F).verity")
+	$(HOST_DIR)/sbin/veritysetup format --root-hash-file $$@.verity.root-hash $$(call qstrip,$$(BR2_TARGET_ROOTFS_$(2)_VERITY_EXTRA_ARGS)) $$@ $$@.verity
+endef
+ROOTFS_$(2)_POST_GEN_HOOKS += ROOTFS_$(2)_VERITY_FORMAT
+endif
+
 # Check for legacy POST_TARGETS rules
 ifneq ($$(ROOTFS_$(2)_POST_TARGETS),)
 $$(error Filesystem $(1) uses post-target rules, which are no longer supported.\
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
