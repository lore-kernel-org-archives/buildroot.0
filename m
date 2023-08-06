Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A8EC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 15:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F16B401D8;
	Sun,  6 Aug 2023 15:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F16B401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Msn_s7UP5q0t; Sun,  6 Aug 2023 15:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7035C405C6;
	Sun,  6 Aug 2023 15:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7035C405C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0686D1BF5DA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8D7F404C8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 15:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8D7F404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jx3LfuyqLi3U for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 15:40:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDEA9404AF
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 15:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDEA9404AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id B178120002;
 Sun,  6 Aug 2023 15:40:07 +0000 (UTC)
Date: Sun, 6 Aug 2023 17:40:06 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230806174006.6a7bd0a8@windsurf>
In-Reply-To: <20230801223741.367162-1-romain.naour@gmail.com>
References: <20230801223741.367162-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691336407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuZ9KM29CNeYcqgYiV7N6uGQXUxmJYLnHNw1H358FsQ=;
 b=buSADt/0sUfXLGRsTsOdfLYyVmE3KlLTCQIQb3xv64fCYzmvSkcE2I7yI8tfPUjqeYtY3h
 eOXLKc0iZRzrM1qck/trtNL1PUcE9BOC2QdarGbvujdHB+YZgYtDtXKm2hbxHQgj7ci3jh
 eiPh2mMZLUvDBi7eNW+9GfQLMq+YMNaTpOg0d4F2QOgnTDac+KlCyfEVHjyzNAiW4UJfzK
 wzl7ZkTX0yOKdmd5P4CpPIEmsYcerxIwXm4U9ToIBBhX7UJg/sbYCdZJ9cGUBFr6m0LC2v
 Gj4YBXMZQrIjrmhGxGYWQFeiYCt+ehjYsVq5cgWKi5aVqxQlDT08jJ+H7WF/+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=buSADt/0
Subject: Re: [Buildroot] [PATCH] package/luvi: bump 2.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Aug 2023 00:37:41 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> lua-openssl (0.7.8-0) bundled in luvi 2.13 fail to build with openssl-3.x
> 
> test-output/TestLuvi/build/luvi-2.13.0/deps/lua-openssl/src/lbn.c:28:27: error: expected ')' before 'SHLIB_VERSION_NUMBER'
>    28 |       "based on OpenSSL " SHLIB_VERSION_NUMBER
>       |                           ^~~~~~~~~~~~~~~~~~~~
> 
> Luvi 2.14 include an lua-openssl update to 0.8.2-0 fixing TestLuvi.
> 
> See:
> https://github.com/luvit/luvi/releases/tag/v2.14.0
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561386
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/luvi/luvi.hash | 2 +-
>  package/luvi/luvi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I realized only afterwards that it fixes a build issue, so I've applied
to master as well. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
