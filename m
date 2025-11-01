Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D4FCCF9F0
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 09:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C52FD6125E;
	Sat,  1 Nov 2025 09:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N19sa0iiysOG; Sat,  1 Nov 2025 09:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60DE6127A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60DE6127A;
	Sat,  1 Nov 2025 09:38:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D47BA964
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A7D40F09
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJLY05ac3Aa6 for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 09:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD2614086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD2614086F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD2614086F
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:38:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2B85560128;
 Sat,  1 Nov 2025 10:38:36 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 10:38:36 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 10:38:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251029210230.1841049-1-bernd@kuhls.net>
References: <20251029210230.1841049-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <eb255f44a3af8c944a1d57be62459f50@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761989918;
 bh=G/CTQODBW6FKBBgSP8ywGKyQi8HRMIiEzA0Ka6GqdlM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QPwig9F6QgtjN/NPwRuhU2Jk6ZCn6ZN6yaR5vjz+cqhSJpVx8aBkezKD6Hm+jtVPM
 Z1WyxRUFUwl5R2ihGAHNlTdawScN935NXj4Y4dDPGmI/6fL0ZLJIJZOIx/UGzWpbkD
 7Bkm8EXQUC5MGfGM2kzSTWwIQ67p85QF79t0CpGksPQKmKaDvsRHewu440RJl2VLxy
 5N/7nJ0AQpbopSQ9oIkQtsnQn3omejXsKmeCGXVGkh9Pjc6M3AyAYKhylRguO55l9c
 RyHJEhpCD3VxiYjUyWUIa2upx7iochERVAUfOWI7cQc+JHgXvlCIw+HfOLuzI5gIGk
 dtz+ALIn5n4yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QPwig9F6
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libxml2: fix build of
 packages detecting libxml2 using libxml2-config.cmake
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

On 29/10/2025 22:02, Bernd Kuhls wrote:
> Fixes build error seen with libiio:
> 
> mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path 
> used
>  in cross-compilation: '-I/usr/include/libxml2'
> 
> caused by bump of libxml2 to 2.15.0 with buildroot commit
> d81922c1ef8825f10b802984d9721412a1a1a377.
> 
> Upstream acknowledged the problem and waits for a fix
> https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2453923
> so we revert the offending commit for now.
> 
> Fixes:
> https://autobuild.buildroot.net/results/fde/fde40a3d6ac58f568e49419e5176db5a62a0a4d9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
