Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DC5CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F9D0811D2;
	Fri, 10 Oct 2025 17:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOQJ1IoDQOfx; Fri, 10 Oct 2025 17:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AEF811C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5AEF811C5;
	Fri, 10 Oct 2025 17:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B8A119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DB3A40570
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHffNLRd4ZKH for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E0FC4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0FC4056C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E0FC4056C
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:16:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4A34760128;
 Fri, 10 Oct 2025 19:16:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 19:16:28 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 19:16:28 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <5ff528f1f4822ab5d2d0ea102bc7c44281026e14.1759924403.git.baruch@tkos.co.il>
References: <5ff528f1f4822ab5d2d0ea102bc7c44281026e14.1759924403.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.11
Message-ID: <83951a6294bfd1af3fd164e89537449a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760116590;
 bh=s7tXfUDfUoYpLhtmn5ogz5DDhhd+/sGc8yHRKuAtMF8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u/xiVWUZchs77n98whzJNOkQwHDKGUc7pK0HnE8QeoCNUwVzF533FVZtk5zJdAMJG
 /F5LnPzqo8+E/yuXQ+G28VJe6rNumR3CtXPj4ERKeM/SngbACnasyfmsoHoo/VPOVk
 ppj3Bolg/mkG9BGcbGxW4gJFn+LDsLkV6hROEIoBZ/hCgK+oiIO7zariWbBBsJP8Sa
 zGxzWzqwi1u4MxpFx1mWq/3/W/nOCtxXYLJAxaapyXEYqbu7gGR3bzpYYH6afrCobu
 dqa1vT69kVnJ3BdvRvW679nApEVapxvQXVsVIgSLCSUcvyXDexOMYl3GqkGL/vmHsC
 va2cn7Ayd+GSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u/xiVWUZ
Subject: Re: [Buildroot] [PATCH] package/ebtables: disable sparc64 target
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/10/2025 13:53, Baruch Siach via buildroot wrote:
> Commit c5d6cde7b627 ("package/ebtables: remove KERNEL_64_USERSPACE_32
> workaround") fixed build with GCC 14 for when Buildroot
> BR2_KERNEL_64_USERLAND_32 is enabled. However, ebtables configure 
> script
> enables its own KERNEL_64_USERSPACE_32 macro unconditionally for 
> sparc64
> target, which triggers a similar build failure.
> 
> Disable sparc64 target for ebtables and its reverse dependency to avoid
> build failure.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9a2510e0038cd13db8c3aac0122ea7a0f834fcd2/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
