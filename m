Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F80CFC518
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 10:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2037383147;
	Sun, 23 Nov 2025 10:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OM4swJBM7YXI; Sun, 23 Nov 2025 10:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C1F383478
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1F383478;
	Sun, 23 Nov 2025 10:26:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED71F158
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 10:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED6283478
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 10:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjEOpUkRyG87 for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 10:26:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9C6783147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9C6783147
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9C6783147
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 10:26:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0802578032A;
 Sun, 23 Nov 2025 11:26:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Nov 2025 11:26:47 +0100
MIME-Version: 1.0
Date: Sun, 23 Nov 2025 11:26:47 +0100
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122170503.2020720-1-mr.zoltan.gyarmati@gmail.com>
References: <20251122170503.2020720-1-mr.zoltan.gyarmati@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d817b5acaf16dc41297eb35c94bbd1e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763893609;
 bh=7DYv9vyKVnKyTWn5adEWvg/bG8lOe0wI+lkOoGLCP3M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p1J7Mq4Xp+5WfCVP2Kj0wHzTKEqsIHiO5TLqxrRY9WBVvaovvnH/5Sx7BO1sy3N2m
 IA77PRINDu6E65YGcQocFh2wY6GJ6Ol6nXRZF06ZlMKxCJ4MYQEs1lg3I3xf9f67Re
 +J992KfLlpEAUujfYxvfj7pDDUkITwzzc+K6UZvsSM3BCY2M8SAmKHZ3IrUog66ga8
 D8mYI2alh0PwMQf1LpHuXKEZ7IC/hgj9UIrJZBrKYSzF2ZaMHX1mymMyu2HR6byBpF
 GjxxPmkS9P+r4JupGnRZBU1lQ+UetsuV72sURSt2FqOstnUuXL15I6Z5+U8l2iUfZL
 scics5xrCR8Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p1J7Mq4X
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump to 9.7.0
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

On 22/11/2025 18:05, Zoltan Gyarmati wrote:
> We jumped from 9.5.1 straight to 9.7.0, for release notes, see:
> https://proj.org/en/stable/news.html
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
