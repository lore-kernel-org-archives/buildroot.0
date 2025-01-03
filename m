Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C09FE7718F
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 18:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387B140226;
	Fri,  3 Jan 2025 18:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNBLDbV4c1uD; Fri,  3 Jan 2025 18:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F80440196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F80440196;
	Fri,  3 Jan 2025 18:12:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB7C4F27
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 18:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C00340196
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 18:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTZk609TJqC3 for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 18:12:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83DE44015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83DE44015A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83DE44015A
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 18:12:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7CF85B00571;
 Fri,  3 Jan 2025 19:12:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47688])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Jan 2025 19:12:41 +0100
MIME-Version: 1.0
Date: Fri, 03 Jan 2025 19:12:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Alexandre Esse <alexandre.esse.dev@gmail.com>
In-Reply-To: <20250102210235.3386319-1-thomas.petazzoni@bootlin.com>
References: <20250102210235.3386319-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a7302095ae1a578d458f3d75ef19d8e8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735927963;
 bh=BtQ4Q+3LDQLza7OxBJQvKhRnDfOyd2jHPNIKZzRQbz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pBI2PpL0ddBUwmmnICy+c+cXJYZTfPgRNGV/LeXPviv6oTzQkWn9UdzjesLbvBHNw
 kIRGJ5ifaXIzXCEuYdzmmYFSZFK8ES6Lg3r+2j2MLAc0VWwSw+IXx4WNMTscQF+qJG
 J6uwSXooBIOjtMW70nlTojZQe2itjKGoXW7Ur4w/kFJr1T8sUkx9wTyRHFJ+GyiJh1
 OfEBeFRj6+hCYIyqO5inJaEPAbW9+VnERarFO6DWcoxysh+EO1rur9nn4mc0yGJ6xS
 pZu16kchWtOG8TpGOZF0gj6CwqajsXiD+tB0DVT+QGxFAmE8czmEy+m4iNlNsnb4NR
 zusk6/pMYtsKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pBI2PpL0
Subject: Re: [Buildroot] [PATCH] package/v4l2loopback: enable
 CONFIG_MEDIA_CAMERA_SUPPORT kernel option
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

On 02/01/2025 22:02, Thomas Petazzoni via buildroot wrote:
> Setting CONFIG_VIDEO_DEV is no sufficient as drivers/media/Kconfig has
> some very convoluted logic to hide some options behind a
> CONFIG_MEDIA_SUPPORT_FILTER option, unless CONFIG_EXPERT is
> enabled. Due to this, several arch defconfigs don't have
> CONFIG_VIDEO_DEV enabled when doing $(call
> KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV).
> 
> To fix this, we enable one of the possible options that ensures
> CONFIG_VIDEO_DEV is enabled, and we've more or less arbitrarily chosen
> CONFIG_MEDIA_CAMERA_SUPPORT.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/2a337d29e7870564027bcd42bd0addd228eb6a24/
> 
> We've tried to track down which kernel version introduced this
> exactly, but it's been introduced a while ago and step by step making
> it difficult to pin-point which version version exactly introduced
> this. But the issue has been appearing for quite some time in the
> autobuilders, so it's clearly not a recent issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
