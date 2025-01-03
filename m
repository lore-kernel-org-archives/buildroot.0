Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A87E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 18:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1814408AE;
	Fri,  3 Jan 2025 18:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mU1Qs4yBFPi; Fri,  3 Jan 2025 18:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971A640896
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 971A640896;
	Fri,  3 Jan 2025 18:09:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3953CE0F
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 18:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A87060B1C
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 18:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbHuSDHo9nes for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 18:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47F5A60AD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F5A60AD5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47F5A60AD5
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 18:09:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F02A378034D;
 Fri,  3 Jan 2025 19:09:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37568])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Jan 2025 19:09:42 +0100
MIME-Version: 1.0
Date: Fri, 03 Jan 2025 19:09:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Micha=C5=82_=C5=81yszczek?=
 <michal.lyszczek@bofc.pl>
In-Reply-To: <20250102110025.722992-2-adam.duskett@amarulasolutions.com>
References: <20250102110025.722992-1-adam.duskett@amarulasolutions.com>
 <20250102110025.722992-2-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ef072488b5972d0efc7a756039d50ab8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735927785;
 bh=VDRx46NbrQ+85emYZrEM7KD3DOBeohtM980NaOZIrBU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WxrDgjr+iMhf9jWbMHEY6aYN1uxx0in07ZjBMZTLf14gSLXHZdE3UPEKa6QW7O6qm
 +Eqxs7/zK/ebUSe3A1qsv0+ojg6Rk917wEx2p+jU+nrwCZFnEEBbwfaWPQ6v7V+muZ
 3YmzI5SSF5hH8Lme0XQWRkIh/kFnvWpPVjqLySk7REiJWt4EOk/9dNXS7eLNFuXRt0
 vL26Fl1joEFotZGqYEj8GN0zySUUzc35wEY0EmwaZ2pt78rq/ZzA6UmbWPrcYATJ3b
 3GE4d/gPdlNjaZz32wBMh1utKAzk6XKxNrMaVk1G29i2bYvCIzMQnwX/E3i3K5gpUi
 f8WpdAFIVihsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WxrDgjr+
Subject: Re: [Buildroot] [PATCH 1/1] package/openrc: bump to version 0.56
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

On 02/01/2025 12:00, Adam Duskett wrote:
> Other changes:
>   - Update 0007-allow-setting-rc_libexecdir-path.patch to apply cleanly
>   - Remove the split-usr logic, as it was removed in version 0.54. This
>     logic is now handled by passing the following to meson during the
>     configure stage: --bindir /bin --libdir /lib64 --libexecdir /lib
>                      --sbindir /sbin
>   - libcap is now a dependency
>   - The audit package must be explicity set as disabled if not 
> available.
>     If not, configuration errors occure if audit is not found.
> 
> 
> ./support/testing/run-tests tests.init.test_openrc
> 
> 11:45:44 TestInitSystemOpenrcRwFull               Starting
> 11:45:57 TestInitSystemOpenrcRwFull               Cleaning up
> 11:45:57 TestInitSystemOpenrcRoFull               Starting
> 11:46:10 TestInitSystemOpenrcRoFull               Cleaning up
> 11:46:10 TestInitSystemOpenrcMergedUsrFull        Starting
> 11:46:10 TestInitSystemOpenrcMergedUsrFull        Building
> 11:51:59 TestInitSystemOpenrcMergedUsrFull        Building done
> 11:52:12 TestInitSystemOpenrcMergedUsrFull        Cleaning up
> 
> ----------------------------------------------------------------------
> Ran 3 tests in 388.180s
> OK
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
