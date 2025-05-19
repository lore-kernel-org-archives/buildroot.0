Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C8CC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4711040E04;
	Mon, 19 May 2025 16:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4B-2jA2ctjsD; Mon, 19 May 2025 16:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8466C40E31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8466C40E31;
	Mon, 19 May 2025 16:43:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0730193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2239401CB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uonCeJmNcjaJ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:43:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D484E40167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D484E40167
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D484E40167
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:43:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CBC2BB0059A;
 Mon, 19 May 2025 18:43:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 18:43:26 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 18:43:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Bogdan Radulescu <bogdan@nimblex.net>, Joachim
 Wiberg <troglobit@gmail.com>, Steve Kenton <skenton@ou.edu>, Wade Berrier
 <wberrier@gmail.com>
In-Reply-To: <20250518174630.2149476-1-bernd@kuhls.net>
References: <20250518174630.2149476-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <eed4bf7501c3a9d8d38bb731c2806550@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747673012;
 bh=SjgxzgzTIuCbhKCOoOL3qVVNYG/2RQOaG4nm6vGNqSE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tF2m9FwmujmhR1rcvqNRibNm/LFkiRWIVdHWEy39aP89vI65VqkcEbSd72VdGXn+g
 wSxdnVHYf12Bmgl2HfkgPN0nIlhUEDbJ6nY3ZAn3s8QSaPqoaYNkPdZN3iQnv2eumf
 /acAluJ6F52sndmOlLzRYfii+PiZILwFcwE7VugjsDHSpaKlSuyJma1FRswd544nK3
 vsvhEQdAJPqrSmUHSuEpRoNXuVlI0klqX8GFduNnfoL0l7zx4SZp9dwBmhVLdRjVXa
 u6NQnhYKXjCiDlw7YWZZB9vdMgb9VmRWc0Y4JxzVWs8s8gtRON6yaE1TEUdaT598oN
 f89b68qn0MnFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tF2m9Fwm
Subject: Re: [Buildroot] [PATCH 1/5] package/iftop: fix build with gcc-15.x
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

On 18/05/2025 19:46, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
