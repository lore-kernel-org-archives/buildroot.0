Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE372CCF9FE
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3EB241FA1;
	Fri, 31 Oct 2025 22:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MZRLr-bH0kj; Fri, 31 Oct 2025 22:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB42E41FA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB42E41FA2;
	Fri, 31 Oct 2025 22:23:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F05F1CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E212D41BBF
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNkRWjHGzRyq for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF28D40CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF28D40CE7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF28D40CE7
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:23:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0D6495FFC0;
 Fri, 31 Oct 2025 23:23:17 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 31 Oct 2025 23:23:17 +0100
MIME-Version: 1.0
Date: Fri, 31 Oct 2025 23:23:17 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Mario Lang <mlang@blind.guru>
In-Reply-To: <20251031101023.2343092-1-dario.binacchi@amarulasolutions.com>
References: <20251031101023.2343092-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <489ff7a65f545472e739333f5ecd14ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761949400;
 bh=/J/l0N/rtP/So2OXWeLmHePnSyWrskKx/nZty4V3d08=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fi1QakqSztSh/Ul475QiIEQ1I+cVomMAueYkHdhaTBxhE8V/2jIWMs7mbG+sxBtjM
 kUFedJHCWqWTrCEVCD53Z+ZAzJMCul8jjfu4TwPuLpd8oWMKVwB2fE7CcMF9w2OIM9
 FRgjLP/OTzl0mEGjVI+mr5rMSV3fWngklcwiQebreH4xHDSEB3oYNongQ6v3M63buw
 WGRWGnH5auRdIRqs3gmSlWcYD7CXJwoN0D2zAM8r/9lUVbqrOE/PqYVO4KIon/JH9C
 W8YHAsoHjwioK3jXgljg8cAZtbCxneHAqagjF/mBypdPKetXJcPXZT/S2kNkJXOo0g
 KdFvkukiUHiNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fi1QakqS
Subject: Re: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.8
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

On 31/10/2025 11:10, Dario Binacchi wrote:
> The added patch fix the following build error:
> 
> /usr/bin/install -c -d ../../../lib
> buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -shared   
> -Wl,-export-dynamic -o ../../../lib/libbrlttyxfv.so screen.o -ltinfo
> buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/14.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: 
> cannot find -ltinfo: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> git format-patch -M -n -s -o outgoing origin/master
> Update README hash:
> - v6.8:
>   - Update the copyright from 2024 to 2025.
> - v6.7:
>   - Update the supported braille devices lists.
>   - Add support for the HIMS eMotion.
>   - Add support for HT's Activator Pro models.
>   - Add support for the KGS Next Touch 40.
>   - Change the copyright from 2023 to 2024.
>   - Document that HT's Basic Braille Plus models are supported.
> 
> Release notes:
> https://github.com/brltty/brltty/blob/BRLTTY-6.8/Documents/ChangeLog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[...]
> diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
> index 22d58ebd00e3..e3105e53f1a3 100644
> --- a/package/brltty/brltty.mk
> +++ b/package/brltty/brltty.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -BRLTTY_VERSION = 6.6
> +BRLTTY_VERSION = 6.8

This new version is consistently failing when ncurses is not present. 
See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2133265664
Is this a new mandatory dependency?

Could you update this patch, so the package can build with
"test-pkg -a" please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
