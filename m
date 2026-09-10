Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6721FC79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FE940B8D;
	Thu, 10 Sep 2026 19:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gD4hdtm7pPB; Thu, 10 Sep 2026 19:27:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C61B040B2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789068436;
	b=O05a17jd8lxRfYoCWy38OSCzilVWBlUj0tsEWr43t3di7db+31XAbxtmljb3XG5ygYDQ
	 u+qIa7rwkHdeC9yLLo4bG6Qp99PAfq6KOOfbmxbQNbs6VMnWJx7tsb6L5SIJ5pr7+8U2/
	 upCfugMkbiSfry7pj4ku5na6V76UABAdnRLSnnrZwPJq2a2qc3mvnmLFli6VLvOg3NhSj
	 trW6IQt3ptGasKh309o8vcKHuoRANoxM+9niTvGSNe5/fbrhqz1c7KGx0j1WujKk2LZN1
	 V5KKIbMhgkNw8dCgUO40WWf4gu0x10W8fRuzaVLBQtebZ2f+G42SEu3t70n9CbBEeSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789068436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0dYaPgYbbp44v/4W5r/TNQck+UZcLLijj/fXjLTOoJQ=;
	b=iTpAWlLA1ACJExUbFLkC9JIVPbPFksY/Oo5JA/f/0ikNBoAKQx/hhTbbeTddW0w3R/No
	 JrramE5cpDDgQ0PMilTAUW2EhIQElysm8iuo2d/IvV87x1/YqGMnMimLWFTaQBBMtByHh
	 a4077/AEPZe1mQ9h23N31u8Qlkmt2hpVfDePiAHsaQJPXQP6ZodfPhcyK6e0xhS+7w7Gx
	 eWo+Cy/kTHJgeZQQFvMqyvEPergjX0/sxI8e/PYG2SP2uGP/WIfBzVcdSAv9ACxfR+0ev
	 DfvKjFBk58E8lJEXCQHapwLaz0rfU0OGDaj73Hj/5okMO0wDAPzK+vYmSfdK8QwAlvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789068436;
	bh=0dYaPgYbbp44v/4W5r/TNQck+UZcLLijj/fXjLTOoJQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lTgZjJiHrOnhaHGSDQXniUjMvG7SQG69lhwjFSzA0g6iH9pnqsHTk8C8OVcacKi5H
	 dNQyoOY5aIAHSjEz01lsSFgUsbbMsr49Y3vSh3juJ57SrfMuXR7ouchVkeT5fo0Qfa
	 P2vwGuE+PDv3FDFzALLmfjQpKThwp+1neKj9Y9YhqoVohZYxWTX2n6KPgq+ynDhGvs
	 CqMAgqPvX/0UljU1J9GT5cNd3ucjqGVXC2wpHOD++CW/sbWaS39C+VKfrrMQobJEl4
	 yK8U+BkWZb7AMaR0swKhmGOxSi8iVyPboIuHA05tSCcLaLoTQ3uQwuNIX1IjFaKE02
	 DIPHmaoFsxneA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61B040B2C;
	Thu, 10 Sep 2026 19:27:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E589362
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FFDA60BDF
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-_qYbDNqEsk for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:27:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 98A2960BDB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789068433;
 b=gC/iShZrVnMctsCqr962KdEeJw62jjJMYBhHO2JOIfqaubdamJVfTw2aJnzAJTd+lHzv
 iOUUXjS2SVLOifpf79lHywcPXtWzybPptwiyx1GMIPXaejayf4NJj9U6WzUjuWvINrbiW
 Q1il0HvaxY5BxH8MjTiR59cpaN2gbeMQra8KuJNxpONFxmpk0dlggUsEA4vtLBqR6StGf
 s2GahPMoZUn4WhO1YND5jJ82CngLeNghShpaKMJlq6NTwDOCIS/2fhpPZjx5F3mQDyXWH
 qkH4tJdf3lhfPAku7m/tBZS/eSr/T1z6aSpG1g4/BIxHFY4/ecqAVbzSHFxGCgUVW3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789068433;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2qtxeVQN50LUdOO+BqcTQUg/DxkVN+5aJyeF3awpHu4=;
 b=NnI7YG+BJLUJjpDyVVxvc8jtgwi6GMpDrtxEkGHp/8MD1jMQ5yvRhE0NjIDBLrNrjMTG
 ZDpA4kPY2Lke5B7Lf0RttjT2NQtCawCn1PWhRjIK6CK21P5AsgwTiVt0I9iX6cuuMm11X
 f555F0U1NXyWritjbj5mWttirvfQWABEImHo5juGxoGYLEUGX5wcxFpDHL6ubzH1CXYo1
 LU+h7d5kgnqbWL9J1fIl5BJtbm1O0zN7y7gIUjVIaVK6kG8GujXf5BW8Vw9fRLbwqjydE
 YjX7jU7nHxEOdzUWimJjwtTFR+jFCT5zWh09IrvcYcxZFpzMOLnnT3xEWDRc2jVdYWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xl3pCYrE; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98A2960BDB
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:27:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E4AD54E40106;
 Thu, 10 Sep 2026 19:27:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 627BD5FC38;
 Thu, 10 Sep 2026 19:27:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF85E11C787F4; 
 Thu, 10 Sep 2026 21:27:02 +0200 (CEST)
Date: Thu, 10 Sep 2026 21:27:02 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, stefan_preiss@gmx.de, arnout@mind.be
Message-ID: <aqMEKWVKb_2_RkGO@windsurf>
References: <20260701135640.3979236-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701135640.3979236-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/poco: convert to CMake package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yegor,

On Wed, Jul 01, 2026 at 03:56:40PM +0200, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Currently when building with make, the cmake config files are not
> generated. This leads to problems when integrating the package in an
> application built with cmake.
> 
> This patch is based on this one:
> https://lists.buildroot.org/pipermail/buildroot/2026-April/801019.html
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Sorry for the delay in getting back to you. Unfortunately, this patch
breaks the build.

I've tested this configuration:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_POCO=y
BR2_PACKAGE_POCO_ACTIVERECORD=y
BR2_PACKAGE_POCO_CPP_PARSER=y
BR2_PACKAGE_POCO_DATA_MYSQL=y
BR2_PACKAGE_POCO_DATA_PGSQL=y
BR2_PACKAGE_POCO_DATA_SQLITE=y
BR2_PACKAGE_POCO_JWT=y
BR2_PACKAGE_POCO_MONGODB=y
BR2_PACKAGE_POCO_NETSSL_OPENSSL=y
BR2_PACKAGE_POCO_PDF=y
BR2_PACKAGE_POCO_PROMETHEUS=y
BR2_PACKAGE_POCO_REDIS=y
BR2_PACKAGE_POCO_ZIP=y
# BR2_TARGET_ROOTFS_TAR is not set

which basically has all Poco sub-options enabled. And it fails with:

CMake Error at /home/thomas/projets/buildroot/output/host/share/cmake-4.4/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
  Could NOT find PNG (missing: PNG_LIBRARY PNG_PNG_INCLUDE_DIR)
Call Stack (most recent call first):
  /home/thomas/projets/buildroot/output/host/share/cmake-4.4/Modules/FindPackageHandleStandardArgs.cmake:654 (_FPHSA_FAILURE_MESSAGE)
  /home/thomas/projets/buildroot/output/host/share/cmake-4.4/Modules/FindPNG.cmake:218 (find_package_handle_standard_args)
  PDF/CMakeLists.txt:93 (find_package)

So it seems like it now needs libpng? Not sure under what conditions.

Same build, but without your patch: the build completes successfully.

Could you have a look and submit a v2?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
