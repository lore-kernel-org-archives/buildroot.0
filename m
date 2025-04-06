Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D5C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 16:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4433660E9A;
	Sun,  6 Apr 2025 16:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_R7ecQaAykY; Sun,  6 Apr 2025 16:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78DA560EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78DA560EBF;
	Sun,  6 Apr 2025 16:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6300EDA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D2660EBF
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lq8utGWQXdN8 for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 16:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48FE260E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FE260E9A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48FE260E9A
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:33:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 116A35FF95;
 Sun,  6 Apr 2025 18:33:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Apr 2025 18:33:14 +0200
MIME-Version: 1.0
Date: Sun, 06 Apr 2025 18:33:14 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250406150929.691964-1-dario.binacchi@amarulasolutions.com>
References: <20250406150929.691964-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d10a750a5def10f302ff558ff84f4b3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743957198;
 bh=Kp4RAJUdRmCzKwTNW3ilxphYMc8UZlc7+Em9wNiEykE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aqx4NYWO+rHqvFFVW/KdEiyDgxxCZAqNtuw7CiuD76fxGizv/GILmMuMOh0lnTGM9
 k3Q+sV63+n3aQmN4Cs1WlNHPnTum7lSenfU0jFEhsX4W/Kk7kedK4S2SH1PmvafR7J
 ZL9B3zsPyhwsbHs2zhuqUDmhkgLEZpWYXfhAQo36bZPF4iZOvlYfy6Ic5GraHagMuj
 vzEvGpUO3HmC9YuJAdd/R6mTTpVfNeP89D1IX3uo7rMUAxvYS1mSoUF/Zb7j8Xi+8P
 BEqq+IGaPejFeed8EyBhMm2jl3wG4AiKf7A+lro6IOO1+9/O1WgyzEJAIr8rZTEDQd
 9Er0Mfc5hKYBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aqx4NYWO
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: bump to version 1.7.5
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

Hi Dario,

Thanks for the patch.

This apr version seems to break the test_apache runtime test:
https://gitlab.com/jolivain/buildroot/-/jobs/9637031124

The failure seems to happen in the apr-utils package.

Without this bump, the test succeeds. See for example:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9569779578

On 06/04/2025 17:09, Dario Binacchi wrote:
> Release notes:
> https://downloads.apache.org/apr/CHANGES-APR-1.7
> 
> The removal of patches:
> 
> - 0003-Revert-Add-the-ability-to-cross-compile-APR.patch
> - 0004-Merge-r1920082-from-1.8.x.patch
> 
> is respectively related to commits [1] and [2] included in the new
> release.

Also, could you add a note in the commit log explaining why this bump
is not flagged as "security". For example:

"""
Note: the upstream release note mention v1.7.5 is a security update.
The package patch 0004-Merge-r1920082-from-1.8.x.patch in Buildroot
was already fixing this security issue. This is why this commit is
not marked as a security bump.
"""

> [1] 
> https://github.com/apache/apr/commit/6ab04292969c5d85f0b51f3c9eba9aabf4c44ab0
> [2] 
> https://github.com/apache/apr/commit/36ea6d5a2bfc480dd8032cc8651e6793552bc2aa
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Could you have a look at the apache runtime test failure, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
