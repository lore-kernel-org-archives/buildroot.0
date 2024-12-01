Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6697AD49780
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03DDD4F43D;
	Sun,  1 Dec 2024 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ba-hLDiOAHpt; Sun,  1 Dec 2024 17:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E0E4F46A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E0E4F46A;
	Sun,  1 Dec 2024 17:51:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A4146C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AAA985120
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbq9Z_GqZiUS for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 17:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CB058511A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB058511A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CB058511A
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:51:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D35E1B00573;
 Sun,  1 Dec 2024 18:51:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44014])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Dec 2024 18:51:27 +0100
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 18:51:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
References: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <26e34f1dceb2496f7f6f17248c258154@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733075492;
 bh=x7qoq2pq6OilHYmEyIh6UTIMNgOXq/KNk4G+MrahxrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mJdmXwa/qdct1AJHNjk6gwXm6VbpLH0Taoj7Nv3j0gPyB4Mn73U5vbZaFhG0IG9Lq
 6d7W7gha1O9ai2QpZVGN8hsbxZSJ2INq6HYDzAPU4Tm2vKWp/SkJcRp5eRLQeVphDo
 uzzoeNcPCahWwXjvw52S0I2dxBVXt5cY9EAASKPFg3GXOCJhf7NKk+rzeTVxVZiU4M
 7t0DMtqZLF/2hLB+yDYSThhxHVz5jVO73ueY9eLFu6G6gbCJEw+dPL28ytvOuykKpa
 b826qoxyGNcEQcfrpxtrIWq20b7cf52Tfb52BeNexCvNPpN1OHh6059El6EXkMyFj/
 ytAowMeYNfx6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mJdmXwa/
Subject: Re: [Buildroot] [PATCH 0/4] package/sway: bump to version 1.10
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

Hi Raphael,

On 24/11/2024 12:49, Raphael Pavlidis wrote:
> To bump sway to 1.10, we need to bump wlroots to 0.18.1.
> To bump wlroots to 0.18.1, we need to bump libxkbcommon 1.7.0.
> 
> Also, if wlroots is bumped to 0.18.1, we need to bump cage.

I applied this series to the branch "next". While doing my review, I did
few reworks (minor fixups, and adding info in commit logs). See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ae0e6d14d547c0d71cf68c75c821f4b2c1d367dd
https://gitlab.com/buildroot.org/buildroot/-/commit/a6a92a08b35ccecd1ed70feae97a247c7a8bb8aa
https://gitlab.com/buildroot.org/buildroot/-/commit/2f47195d540f63543728fd4982f2e6ae8aac2b2b
https://gitlab.com/buildroot.org/buildroot/-/commit/24bad65295ff697e83fc90fcebb8278e880e407d

Best regards,

Julien.

> Raphael Pavlidis (4):
>   package/libxkbcommon: bump version to 1.7.0
>   package/wlroots: bump to version 0.18.1
>   package/cage: bump to version 0.2.0
>   package/sway: bump to version 1.10
> 
>  package/cage/cage.hash                        |   6 +-
>  package/cage/cage.mk                          |   8 +-
>  package/libxkbcommon/libxkbcommon.hash        |   4 +-
>  package/libxkbcommon/libxkbcommon.mk          |   2 +-
>  package/sway/sway.hash                        |   6 +-
>  package/sway/sway.mk                          |   8 +-
>  ...1-Add-feature-macros-to-more-C-files.patch | 181 ------------------
>  package/wlroots/Config.in                     |   1 +
>  package/wlroots/wlroots.hash                  |   6 +-
>  package/wlroots/wlroots.mk                    |   3 +-
>  10 files changed, 20 insertions(+), 205 deletions(-)
>  delete mode 100644 
> package/wlroots/0001-Add-feature-macros-to-more-C-files.patch
> 
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
