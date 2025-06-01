Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8579DC5B543
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 21:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 268FB6107C;
	Sun,  1 Jun 2025 21:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpneQOoHpLUb; Sun,  1 Jun 2025 21:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C7BC61095
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C7BC61095;
	Sun,  1 Jun 2025 21:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA3C127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 21:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B76640513
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 21:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5T8Cxww1cpEQ for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 21:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 648A340012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 648A340012
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 648A340012
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 21:35:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C70F65FFAF;
 Sun,  1 Jun 2025 23:34:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 23:34:54 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 23:34:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20250514090744.3586626-1-adam.duskett@amarulasolutions.com>
References: <20250514090744.3586626-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e829b032a59e13d47d8e70b5ff2ef353@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748813698;
 bh=gS5iTSPJWlEGbj1vnC56B4RqwE2GxlZgahlzd/gVgvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oKjhOjAIxrZIyJvPHYQdqpQRkTwgemQJTHcJqrL+vd7Xbf78bOaD4xMW2B673Fig3
 pFPalMiidtCGms8xwb+tx685sr0LDFNm6LvQSTWYonK4uNTQIqTRd/u3x1AHuXKW06
 TLvn46bE25QGE6+L71qFDK5CKviWLTYvto3euFa0PT0qPMzJSplQau0Ne3oezcRpCr
 Knh7p2mTA6pjl12wxW5YN8nJJRADQ/Gyy52FV9p8WEBheC2X7IQBGzHb5GBk1DxJF9
 bb2IBCO+1oR9eYErRi84kUJ4SOxUiyiIMqhJByNfJ68Yn2wnFbgzkOzDqGWUesqMmQ
 prwavs+mTHTyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oKjhOjAI
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 257.5
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

On 14/05/2025 11:07, Adam Duskett wrote:
> Noteable changes:
>   - Add -Dipe=false and -Dsysupdated=disabled as defaults to CONF_OPTS 
> and
>     HOST_CONF_OPTS. If another user has a use for either, they can 
> submit a
>     patch at a later date.
> 
>   - systemd-networkd now requires kernel >= 5.4 due to the inclusion of 
> the
>     sockios.h header, which uses the SIOCGSTAMP_OLD macro. This macro 
> was first
>     introduced in kernel 5.2, but the official README recommends 5.4 as 
> a
>     baseline, so stick with that. Due to this change:
>       - systemd-networkd now depends on 
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>       - default y only if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
>       - Add a section in migrating.adoc about the new requirement
> 
>   - The sha256sum of README.md changed due to the addition of some 
> CentOS CI
>     lines.
> 
>   - Add the new license file LICENSES/alg-sha1-public-domain.txt.
> 
> Tested with `./utils/test-pkg -p systemd -a`
> 40 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info 
> failed
> 
> Tested with `./support/testing/run-tests tests.init.test_systemd`
> All tests passed
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
