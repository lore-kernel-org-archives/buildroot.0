Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED71C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CF38221F;
	Sat, 17 May 2025 14:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6S7451_Deeg; Sat, 17 May 2025 14:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2011382221
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2011382221;
	Sat, 17 May 2025 14:30:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A2E1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE9218221F
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utfTjOeRiWQU for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2A3182221
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A3182221
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2A3182221
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:30:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E77D313F8C0;
 Sat, 17 May 2025 16:30:16 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 16:30:16 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 16:30:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250516143027.237233-1-thomas.petazzoni@bootlin.com>
References: <20250516143027.237233-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f69ecc7c985caabb6ac8532f1cb486b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747492218;
 bh=K7NfESZBT0Wxm6tXqPrPgsW8Ix56yzME2Y9xzwFMgfw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VxjAW4NHj7wKQxODaCyuGjlgR0YrrJ1xOdDCeC7qMb5wQxxJRrr/q244ESAovvt+w
 iMuCKfb/K2As6nQ/COeteZEVqofBA8tdg+sU7OguT35iVxdCI/qgyQyci2cfEkkYzo
 bFkSYnIlBMs+49y3Hg/kMIQMTzpGQ4U8vnysnwWWbQVLslvw+gR/kwSbhtw/JYk3FV
 FOyDWbxmDehn7gIdw886yijrH1XE4JqfCdEnNzkMTX5VCeWk/3Q14JHY78qkAGsxDp
 Jz1IbOZfz0nhr/xOleuW6DA7ygby8twq4Q/j7dnaSgKjq0xbN2q3pEU9AxqP+EFagM
 ne7CYnN+UdmyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VxjAW4NH
Subject: Re: [Buildroot] [PATCH] package/cdrkit: add patch to fix CMake 4.0
 build issue
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

On 16/05/2025 16:30, Thomas Petazzoni via buildroot wrote:
> CMake 4.0 requires to have a cmake_minimum_required() in
> CMakeLists.txt, which cdrkit doesn't have, so ths commit adds a patch
> adding the missing statement. We have chosen version 3.18 because that
> the oldest version that we expect is 3.18. From
> package/cmake/Config.in.host:
> 
>   # The minimum system cmake version we expect if 3.18 as provided by
>   # Debian bullseye, that we use in our reference build docker image.
> 
> The patch cannot be upstreamed, as cdrkit basically no longer has any
> upstream.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/3412e47836b54928a55c12b46549d6307ab623e7/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
