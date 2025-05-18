Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF05CC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1BD16064D;
	Sun, 18 May 2025 14:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PSQbvJSSM_g; Sun, 18 May 2025 14:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02BA608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02BA608D9;
	Sun, 18 May 2025 14:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 512961BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 359A880DC7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTgM02-uu2T1 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CFB980C7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CFB980C7F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CFB980C7F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:41:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E3B5419F5C6;
 Sun, 18 May 2025 16:41:54 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 May 2025 16:41:54 +0200
MIME-Version: 1.0
Date: Sun, 18 May 2025 16:41:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518032722.75525-1-kadambini.nema@gmail.com>
References: <20250518032722.75525-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <09375eebcbe7db4edc32a68718caa0a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747579316;
 bh=Es5ur2AEeRBWr2vkSDudM/KD9ko936g3np17MSr3xhU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r5VMa0jEIp7KhsRfrGCA9l2HipLfizOGSzHUP9C7+I9egtq6DyzLR3KlUSO60i7VF
 J74C2NZyyhS5h+mqPH9kw7u4jabNYdFpgoSgCJ33KvkIEs1P8/B9mmlvXZUB7KZdZ/
 NDSOG3kZA9E6/c+V940vhOZV59548Cmgk3bku7yOCsZY2KQW6TIxpiHWP7m1E5mReu
 l2UdKs2IZtPO+q6dxXhHNx0jR/no+wjan+vdU/j1rOBSeKczKwXPoIu7jxNgTMoVgB
 IpTZ6AKROARfoZqhSXszBxAU4+YkcTAzej6Hkam2hIHqucyswM/LXWihCuSqiUqkMe
 G4bAM9y65ecIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r5VMa0jE
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: bump to version 3.19
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

On 18/05/2025 05:27, Kadambini Nema wrote:
> Release notes:
> https://github.com/esnet/iperf/releases/tag/3.19
> 
> Updated license hash due to copyright year bump:
> https://github.com/esnet/iperf/commit/9f6dc2164dea62221298818c54992c3f24a7e214
> 
> Added a patch to fix the build error with uClibc.
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
