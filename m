Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22EBC3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B8560593;
	Wed,  7 May 2025 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iZuH3Hij14E; Wed,  7 May 2025 21:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB19B6059B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB19B6059B;
	Wed,  7 May 2025 21:02:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F9F151
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FB4940609
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8gBiakTZ8f3 for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 440E34059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 440E34059A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 440E34059A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:02:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0D12013F880;
 Wed,  7 May 2025 23:02:05 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:47100])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 23:02:05 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 23:02:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507193943.735464-1-romain.naour@smile.fr>
References: <20250507193943.735464-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <3692303e5b383e5015f912091923eeb0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746651727;
 bh=Q8wrKMsre8xf5/bCy1cjHil+0F+yuAkRiQYef+BSiJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oJezOVZLx7fT55mgN60S3leoKIpmHCYd4n1rMjWsekZLzXQAGGTdKbxh0W5OiXeRH
 1YuGJj/97KX+5WeGe7P1uVCFREMSm2CNqn4Th69Orw/YBIwJXkbdeIbZP1X1AS44x4
 5gm5l80GGSoOgCKQ/O3rBUniGhBE5jyoeU7cbkWGNmu8043lv0AXKPTdfPJ1oLsf5r
 z13U2Cvh5PByfUBK6Qh76iqJHCTUrRbbXwmO1HPfQwMQYrH+h/IrmPxxBHi5I+zhey
 Op2X7PeLpNJ+GKGmOseeBoGiYt2gIc4sFXi+qxQs96n3+S/kVQAT/oWTL5hqqcJsc+
 CuD0iySRKRPxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oJezOVZL
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 10.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/05/2025 21:39, Romain Naour via buildroot wrote:
> Changes log:
> https://wiki.qemu.org/ChangeLog/10.0
> 
> Remove upstream patches:
> 
> - 0002-stubs-only-build-stubs-for-QAPI-events-when-needed.patch
>   
> https://gitlab.com/qemu-project/qemu/-/commit/8113dbbcdaee05f319a7e48272416d918cb2b04a
> - 0003-sched_attr-Do-not-define-for-glibc-2.41.patch
>   
> https://gitlab.com/qemu-project/qemu/-/commit/27a8d899c7a100fd5aa040a8b993bb257687c393
> 
> Note:
>   32-bit host support is now deprecated for all platforms and will be
>   removed in a future QEMU release.
>   
> https://gitlab.com/qemu-project/qemu/-/commit/6d701c9bac1d3571e9ad511e01b27df7237f0b13
> 
> Qemu defconfigs were runtime tested on Gitlab-CI:
> https://gitlab.com/kubu93/buildroot/-/pipelines/1805672685
> 
> qemu_s390x_defconfig, qemu_arm_vexpress_tz_defconfig,
> qemu_aarch64_ebbr_defconfig were tested locally.
> 
> Runtime tests using host-qemu were locally tested:
> TestXvisor, TestFwts, TestEdk2, TestGrubAArch64EFI.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
