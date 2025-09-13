Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93692CAC58F
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 23:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5466A41F3A;
	Sat, 13 Sep 2025 23:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv0sARWKaI9t; Sat, 13 Sep 2025 23:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E5B41F3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E5B41F3F;
	Sat, 13 Sep 2025 23:30:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB3FC117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 23:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C196D41F3F
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 23:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JeondKUG6kyC for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 23:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E485C41F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E485C41F3A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E485C41F3A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 23:30:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4CE5F20039E;
 Sun, 14 Sep 2025 01:30:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 01:30:44 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 01:30:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250909161216.59631-1-bernd@kuhls.net>
References: <20250909161216.59631-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3913e994ff2e81a8a57a05a76d93c39f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757806245;
 bh=psUqk8GegGfTJ9iNgYBMkRfhzuYEvsVlRjcRC0nqKr4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ujSRRj11Zhxltn6m7+g3srE9guZm5sY+Uvebv3k0SgHpOdicqJ1HyZq0whYh9i24/
 1WHaN767t1SHTloQ3Zvv8saXCqAUuY1D9FMBddLi4CkD6AIyFHhZCByFpdkEbDgO82
 euahXZfygFqm3iXeB+fk7Fq5nvdvbQmGr7/Oaukiv5OuzqAMP7aiRIvNpKDaSTjvGT
 Bj/JXM2FA1pfpmtSa+UQ6axDeSmTyWOc5EOOc+dgIfiHLECj/dVxrn4GZ7UGSLNUOp
 rkK4go/sPkTwsh4efsBBdpAgny9vhZdWx4A1pcNlKJqGpnodGwGz3SUfsQitDzkQ+2
 vfc+9Zt8+fFgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ujSRRj11
Subject: Re: [Buildroot] [PATCH 1/1] package/php-imagick: bump to version
 3.8.0
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

On 09/09/2025 18:12, Bernd Kuhls wrote:
> Changelog:
> https://pecl.php.net/package-changelog.php?package=imagick&release=3.8.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
