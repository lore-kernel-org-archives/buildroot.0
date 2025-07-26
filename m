Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEFFC87FCA
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 11:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45EEF411EF;
	Sat, 26 Jul 2025 11:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goemZZ9aXbYf; Sat, 26 Jul 2025 11:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAC140A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BAC140A80;
	Sat, 26 Jul 2025 11:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4457BDA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3513D400B8
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81Vwd9ySTcrg for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 11:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37C0040080
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C0040080
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37C0040080
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 11:20:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7F6E06013B;
 Sat, 26 Jul 2025 13:20:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 13:20:18 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 13:20:18 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Will Newton
 <will.newton@gmail.com>
In-Reply-To: <20250726025558.161102-1-fancp2007@gmail.com>
References: <20250726025558.161102-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <478214cc810dddee18c4fb0f1cda7fdf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753528821;
 bh=SIB6T9bdVjgOvHj6FE6xvucyHAMQaaNh1AtwU3476GI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CmcUzf0XPeOs7h+RwkYwth2F0K6y4ALZDkX7hdBGempxugaPzjoF+PEvYPaF52QR6
 EqNR/hvlt/F6T3H4zD49DJlWOMdim3c8oKEwUWNQs63xB3es5FgbohKWPnW4wvOz4a
 z2YV+rlv830g0qKfhMo3BGwG4x3Gv1k4JoyxipoVLNOlcVBDE/HB0FKM52yPyubaux
 cTt9FgrD9mFJiLwRyQ0iceUESfF/cZnMW16CRrtpd4ok6GGa5BiEkPh0ofH8avzZlQ
 562McP+ooOFtGXAEet6yd6J8XLmfzA6XinLs9xjXhYkaBiaPBS2319S+Prr7E8jwgZ
 fm+y4CBsyIkKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CmcUzf0X
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump version to 1.0.2
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

On 26/07/2025 04:55, Scott Fan wrote:
> Fix double-close bugs on bind() errors reported by MC on the list.
> 
> Removed MHD2 draft code, now in libmicrohttpd2.git.
> 
> Changelog: https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
