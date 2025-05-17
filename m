Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D045C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 18:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2938340B66;
	Sat, 17 May 2025 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YZ8rg7V9_pt; Sat, 17 May 2025 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2F640B72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2F640B72;
	Sat, 17 May 2025 18:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D229E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 18:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E76A402F3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lDs-X1Dd3m3 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 18:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36A8C40350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A8C40350
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A8C40350
 for <buildroot@uclibc.org>; Sat, 17 May 2025 18:01:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1uGLqN-0007tP-R9
 for buildroot@uclibc.org; Sat, 17 May 2025 20:01:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 17 May 2025 20:00:39 +0200
Message-ID: <pan$1a201$5abc6918$ccfd4734$95dc2ffe@ID-313208.user.individual.net>
References: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
 <20250516171134.1687054-5-elmehdi.younes__45909.3185419746$1747415572$gmane$org@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 4/5] package/spirv-headers spirv-tools: bump
 to version 1.4.309.0
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

Am Fri, 16 May 2025 19:11:33 +0200 schrieb El Mehdi YOUNES via buildroot:


> -SPIRV_HEADERS_VERSION = 1.3.261.1
> -SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$
(SPIRV_HEADERS_VERSION))
> +SPIRV_HEADERS_VERSION = 1.4.309.0
> +SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-
sdk-$(SPIRV_HEADERS_VERSION))

Hi,

please update the license hash:

$ make spirv-headers-legal-info
ERROR: while checking hashes from package/spirv-headers/spirv-headers.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 
9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a
ERROR: got     : 
ff04ae7e6a468587fe59434fee2e67c0e2a749b592c794b764ff80f30b94a084

The license file was updated by these two commits:
https://github.com/KhronosGroup/SPIRV-Headers/commit/
1c9115b562bab79ee2160fbd845f41b815b9f21f
https://github.com/KhronosGroup/SPIRV-Headers/commit/
23d4a398c2ccca05fc623cca8785ce7741c5345d

Also version 1.4.313.0 was released last month ;)

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
