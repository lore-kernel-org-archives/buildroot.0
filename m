Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB2EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B275780E37;
	Sun, 20 Sep 2026 14:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01ng8zwxC5ZT; Sun, 20 Sep 2026 14:47:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E015A80DAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915652;
	b=BB1ROljkP4Da3O3FZFqFPJc/UWft22z6ew3ag5/5vOXiPYm0xVk5lo++U8b/yxxhjBu1
	 7+BPEXSaVlJm1y+yrVOk+/zvbM9U+wqDPf7f6LRoDe6L9wfporbwShAX//MiT3vrd8iml
	 wECRc1gflqzXHJnUGliPjzVKsfaxN9ZEpUqGW13z5EwMlBg+84R3MysGAu8yZavrdSjO4
	 jdXxgR7QG1zrcTx+8oPZi8Ermr0JodEgxRz3f5Y4GiMLwn7M+JTL+c5grxM8M7NHKY8Zc
	 h+GFZOacZpaLqlARfuQ0MbfTqAQzN3+JtddPdrbqsmpIArcmppsC54hL5ECDv1VUtrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915652;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	b=q7lvy2joHNZY3sJyhA5whQpXHgmUW+WpMdlIQsjTU0RPEu25mlmOv3YOJGFbKqwTAzyi
	 fwAfAP709c+OoSlhGFqsAqB46OozoR5u9FoYOZJGKKr3YVruvdXwnaZRbxMQKJairYQqQ
	 rJsvf50yAT+qvdA4p5ihZjuHpiXTgPZuoxZ9jDMVdulQdtSza8pd1ZSfxAY3z8aOnFjlr
	 au2LsSX5MxaNNkttoyJSXj3tKrHQFCUSNO63Bql1ca4DnCoR8WdKDqAzJo9G8KnNqJLm+
	 Ildi1h4Z1unoYonoQGhrHSj8toDSITnk6fZw5DEaHqqegj1STXi1x6RKUjjDySWaG4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915652;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+BUDTFD6a9/ypvXp/MMDqXqIxlkQq2UR5EV3kmbfvhajs42RqqBhKHRM6jjeuQHt
	 S4vWeBF74QH0NqUz5dvijQRtNwq1vRNs7QwXfCcwBGH0HnaOcwc9nSHghAE7wawTLN
	 7AVJ+IHvsdpk6HAUeI48D9hhHhlBnbXtrTCCU2i1LqdfXBk8UDpMX4zNc5FE9OZMQ/
	 /ypqI2GtQNQ3tyiyAN01HS+FPS2IEZnmP8CbA4kXJRguds78oQvL6VmPicVOBsFB+O
	 ts0cc0inAdYiSwrnjOXaBh+Pz4a7KcWEIDXK6VpwHUqENswo+KKSEc5E5nj0bHx7UB
	 ylkJXWu20nmwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E015A80DAB;
	Sun, 20 Sep 2026 14:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 256A137A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B9F84080D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCI86IQQFqEq for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 42FB640808
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915650;
 b=tXR9+qscZoiQZYf109y8ABL/QWBx2rw5aX0StxJbP7Th6DsXfskXIXQS3TdJJN8k1uPF
 6ueFefZ4ZOdaRrZE+Nm+ow8q74Gj3aUh+KhXw/gVPQNvuVuINJ2iqtO9N73x6cex3bN2V
 HiCoa2ym6nI6B+uyA1m4sHSezrXaJptCR4VWL2MdkaLouzwOfX7nrFex6xK762eguDDls
 lAnz/ERGPRbU7hE0Ah3bI1hQaPDP9ueOSyQ5qDvmCQ+cNDt52fmTTCFCRFUYKnorQDHqB
 vHxUjbQB0IUm+6qy1HZ7pf4E/kJpVlX93wpKZxeinYSP7JtKGVTxffUNYRBMj+RL3Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915650;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 b=Ps8n9v1Jc4dd14y/PZ3yCt7a91qS5rHXhor1nnpWrRol4eHJDwxKWvsi48BvuOCJgUuc
 VLnv/akxWTRL4gx5DaBCbZcdAnT7LtX7OIfSBWrk4WX91y/1150Gi3J8+m60Txt6KuiDr
 UeC++XkvE+nFfAQ8Et3Ky86x4tmQhFl0m8dATAO6ig7cMTfMJP7rUwhItFlfEN8dUx+D6
 jyKYJ89Ce7wtTPrzdWpsezMJ4UFsXSQ7LvqrGBSrtBrjQPyaIRZP8EPP/LiUHXQRtgTui
 a2KnJQIykipkCH4CerV9EMuUQHYKUorU68wujyyRiZLWKgZ9NwN6kJQ1BxEqhce8yUA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="t/brAtgL"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=t/brAtgL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42FB640808
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915491;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=t/brAtgLJiI8R2yjtR6kd4qdGTBLUPgMC/YQAqJAoCsvK7OB2XxcItys1+h7KxHZk
 Ldd4thlyCYuk6SGeIJNesDuaUKu4e8A9FU3OPxYD/7w7w9H9pHIMc7PbCBWTC5be0c
 hFtoHuv51mwNfCcQcyQPtVO67aDjBVRVf4+Rwbb+CS5gv2dZ/jSXco8eavumQDNk9T
 jfg9MLw/e1PAtnLLrMhBq7ZFBG2p7XEcw3gf+s0+FK4L6+mRT5pXwhiwctUFciN7il
 mHcyPmrdp0dLCqpIiWyDrVf45XhDd29dHuUMeoQF9WWkElidTe9sQtYTjAQm4hQW/n
 nj8ZYqzva4gyw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:6oTetIUvkm+gIQPEqSmFF+tzH2jKHOOdMzu6j4vhcs5a6EhICzMb9N+ohsmo1RUncG5tBSw8QvlQT1RnPDtpu8v1liSWjHtk6aVBmTwYAwnMkDt6sTpzPyNJE6AXokIxQW6DXJBgIUrXixcIdUCODtNmdc82LeN0vLvZXijlUEtwfA3cgHe2uKk9Zeof4iaGWQrQn1oBXiXyu1pDUoYdJ0iqEBZcXqG9jhGb1r+nT2e4laK+KHc5so81+Kz6gI7587dq/6nujIwmbft0qmLXrSe//v5FX4pIdvX8yjZposlW4tsFsZSbvB3YnAVQdbq4XTRm3deDFk/dZ4VkH1DhrXMFbJLCu2m+BkAwV28sPZh42d7FkR2FaxU1BsgASxw7xOK4h7iV4O2U/RxMRqLhnZf2cECGhn9UaLGZnYDiJtzysE4eCU6J0LSHE5Oawg3BeNYdub+FdHVqb5cUbZzgbvWnBGemJqLvcwqG4K17OM9oabiLHwdXYHmO2oai1BqagGxKGUCVOO+A6EVD0/i0aSrcs6D350P9+ymGsdF91Pl69HQF997/wNEXKzskaDeQhApNGxi8WSXPAThRTU2RfSCdGaZ6wWk=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DE2CA4C4867
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-1emS
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:39 +0200
Message-ID: <20260920144428.3009612-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 18/66] package/daq3: bump version to 3.0.27
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

https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 524c0eb868..a81ae595b4 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
+sha256  03fac3da27e3230a7d26262f2480cd65a409cee3596c6758a7f9eacb7f24601c  daq3-3.0.27.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ec3f4ba670..43139ee065 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.25
+DAQ3_VERSION = 3.0.27
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
