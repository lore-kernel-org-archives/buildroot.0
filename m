Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82F1C53209
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 13:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25274606ED;
	Mon, 27 Jul 2026 13:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzrFbrQxWOHf; Mon, 27 Jul 2026 13:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CCE26063F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785157552;
	bh=z8jfRzgr5erPQ5kdqN+vlRkx3Av3hhX6/xPiDZB3P7k=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fL9V/qUKN2tmzExVHUBNVQBp/RE89Z8daP6CgTH/nPo8nKBA9HdS+xTVEem942HEz
	 FUhPfVmw+nLvx9YnGUbliYdOlBxHNL9G1f5oiu/US6GIjqwwck2xdEH+qF/fb+1TWV
	 XZ0bvwv3vcBX7i2MJjF81d/V0bHUHUzEtn3jrho2UuoJg5YtNJMY/hmIGX8VarWbrN
	 nd2U3MIJQzjh09t0N/0kb2e8HBi88kYQPDAsjFxkK7ZiUdLMK19E35KO378rLuMncy
	 /L6p5dx0TG/4Fdwz0lMf3mKlxqvzJe6Eog4SNfAQuOPQH5mtnEVJkylLTy3ecqNgu9
	 1X26PXj86r36w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CCE26063F;
	Mon, 27 Jul 2026 13:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB4DA194
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CAAE80C64
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nolLBiizVJ5b for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 13:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1974880BA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1974880BA2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1974880BA2
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 13:05:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1wszrb14P9-00333R; Mon, 27
 Jul 2026 15:05:36 +0200
Message-ID: <393511ee-1b43-4e3c-bc64-e71c1d900c0a@gmx.de>
Date: Mon, 27 Jul 2026 15:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260727125510.381611-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260727125510.381611-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:+raE4+JZGAs+k5vMehtQ0tdbaGNzmPNyCf3/VsZ72ZsrsCTZypM
 ESIHKBIKgKF75rppuowjTVIsD8cLnfAJYFvjs2LudFJsej18U59cr04lpxSNqgWLo5ZwIGa
 Ixu5HwPdFBFYzXizpwtDMX+z/P4Eb7UfUtWAGBRLQWZtjA4f/3lAcB8LNEwdWlncPrtAmgw
 F/vbIyuuiC7RYd78E81IQ==
UI-OutboundReport: notjunk:1;M01:P0:sJOd4ToCxX0=;gZ90UWahuOyHWTgffahn1+b3qUG
 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
 4OsgQUGq1P/L
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785157536; x=1785762336; i=fiona.klute@gmx.de;
 bh=1L2qvTW3tUhO2Dr9FbVu2tyysf0pBB5yLHjDSt401aU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dZL6CEDiKYd7UJA1iG++Kkri6aTuQNvIQU0OTRULY4Y/qYZBsMlIvTHAZszgVklK
 Msu84yrYZnkTvBJrpNH1hlgbf0jvAOHzyCi5d1hICSs41OVgHDCW9yW8Xd57Q94hS
 48QAE4qgYEKGSXo0bP8qBEM9/+QJ6g6kP3TyrlWcQL4ddUrDrxbp+nqL9If51XgrX
 KD7mW7GBvpXPPhzLg/TwOEPGPzgJNybjowW3epCCibp483JDhyIDNg9q4Sik0U0cM
 6m3E7uWdEWKpPDi/zSFIB8qR3up1MBdACjCiOmboTaxiEkvYj1PNbMdnsU0XYT6kq
 ZN7zyXIKe1A/OVpgEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dZL6CEDi
Subject: Re: [Buildroot] [PATCH v2] docs/manual: update 'releases' to
 reflect LTS changes
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 27.07.26 um 14:55 schrieb Thomas Perale:
> With the release of 2025.02, LTS releases are now made every two years
> with a 3-year support.
> 
> This reflect the table showed at https://lts.buildroot.org/#releases.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   docs/manual/release-engineering.adoc | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/manual/release-engineering.adoc b/docs/manual/release-engineering.adoc
> index 0cf38183f9..ca64bd18b3 100644
> --- a/docs/manual/release-engineering.adoc
> +++ b/docs/manual/release-engineering.adoc
> @@ -5,19 +5,21 @@
>   == Release Engineering
>   === Releases
>   
> -The Buildroot project makes quarterly releases with monthly bugfix
> -releases.  The first release of each year is a long term support
> -release, LTS.
> +The Buildroot project makes quarterly releases with monthly bugfix releases.
> +Starting with 2025.02, the first release of every odd-numbered year is a long-term
> +support (LTS) release supported for three years.
>   
> - - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
> - - Bugfix releases: 2020.02.1, 2020.02.2, ...
> - - LTS releases: 2020.02, 2021.02, ...
> + - LTS releases: 2025.02, 2027.02, 2029.02 ...
> + - Stable releases: 2025.05, 2025.08, 2025.11, 2026.02, ...
> + - Bugfix releases: 2025.02.1, 2025.02.2, ...
>   
> -Releases are supported until the first bugfix release of the next
> -release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
> +LTS releases are supported for three years, with a one-year overlap with the
> +next LTS release, e.g., 2025.02.x is EOL when 2028.02 is released.
>   
> -LTS releases are supported until the first bugfix release of the next
> -LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
> +Stable releases are supported until the next release, e.g., 2025.05.x is EOL
> +when 2025.08 is released.

I think "stable releases" is redundant and possibly confusing. All 
releases are meant to be stable, the difference is support duration. 
"Other releases" fits well in this context, in general "regular 
releases" or "non-LTS releases" should be clearer.

Best regards,
Fiona

> +See the table at https://lts.buildroot.org/#releases[lts.buildroot.org].
>   
>   === Development
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
