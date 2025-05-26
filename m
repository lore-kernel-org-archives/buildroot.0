Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37B8C54FB3
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 19:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6A9406E4;
	Mon, 26 May 2025 19:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4GvWF_e07yd; Mon, 26 May 2025 19:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B671B406E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B671B406E5;
	Mon, 26 May 2025 19:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 231FD19F
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14846406E5
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Gews7Ies_3g for <buildroot@buildroot.org>;
 Mon, 26 May 2025 19:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17422406E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17422406E4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17422406E4
 for <buildroot@buildroot.org>; Mon, 26 May 2025 19:35:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E0D4F13F8C2;
 Mon, 26 May 2025 21:35:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 May 2025 21:35:36 +0200
MIME-Version: 1.0
Date: Mon, 26 May 2025 21:35:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20250525214421.404963-1-giulio.benetti@benettiengineering.com>
References: <20250525214421.404963-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4d43683d413b302b1fcb6ebf9d8f773b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748288139;
 bh=glXOMXifLkHto/NHO0d1u2qxlsoCPkWahgnl4HQlX/Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eljbpRvMsTloUYk3ieICVnM321rDeGBxk1HYakIj3d7B85Ty7sGO+EAqH5R7CBgv7
 HB6g4ZDDBs9Y1GIBPCjHI+ztIqWRDVysLQwT+yHLtw7poFI9H4aSwEqOufWZtZC7sO
 BLqgoba7UFU/CyuUc8x4DfxtbVw7j92PkiTf6PwsfZMdzetc4a8GP8dybNmpuqbGVB
 y0iILai76cahpcQA7wg59iljGFletHdb1OjvsqPXw+z4a8g5nISv+c9M/qHq2Tct3+
 fAg0rYwz1jI1peUIUn5XufcvG6d5UV1sEHdoMrLPabJUAe2r1rgjdq8LiEj81qnz/O
 5nXt7iFZPOxig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eljbpRvM
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2025-05-08
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

On 25/05/2025 23:44, Giulio Benetti wrote:
> With this version we can build with Linux 6.15.
> 
> Fixes:
> https://autobuild.buildroot.org/results/b6aed17d0ddbedafc3249850fc0dc92cc240b956/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
