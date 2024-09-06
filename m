Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699B1E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11CEB40151;
	Fri,  6 Sep 2024 18:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0vszww5x45D; Fri,  6 Sep 2024 18:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE920401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE920401D5;
	Fri,  6 Sep 2024 18:34:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9C851BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A768E8411D
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rktdcq72BY8G for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96D3E8411F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D3E8411F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96D3E8411F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:34:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B2CD313F88F;
 Fri,  6 Sep 2024 20:33:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 06 Sep 2024 20:33:56 +0200
Date: Fri, 6 Sep 2024 20:33:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZttLFI21Y94ar9HY@landeda>
References: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
 <20240906171503.3495498-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906171503.3495498-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725647643;
 bh=VifqS4TMShIpr5IC5O+Dei1f2RMM7045nupksgyULXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DrFHKNHObHdvJ2VpyYrGLbeQdZXw7EwzcQf/BRjSr8I8c8JSU+lT1z1XJBeqThwE+
 Cx1dGGUq9Q2OgmSxlDtqtZTnWs7v58880COkQyCWsxIZA+vqyG8RNiCY1HYQWL8oKt
 gNvk+XeRNtxn9BrFuCh2CkI+iKGuRPQAANWnF5vIOJMqxUMQ1pFtHdKUHwQtYXF8Ll
 jlUfpna3oTZ1SFvjPyGC0WwSPZOnRqSWYFJVOsZxQ6wYLyrVPAkcEhQJ/OxqOGfZZ/
 B6ZHp/oUl5MxxqlVJmCLNJfaI911rIr1czOFbIzl5J4cTeYNNNzy2TxLw5teyK2+HC
 P5fR7MrLtwQdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DrFHKNHO
Subject: Re: [Buildroot] [PATCH v3 2/2] package/ipmitool: use versioned or
 local PEN registry
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-09-06 19:15 +0200, Dario Binacchi spake thusly:
[--SNIP--]
> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> index 9516ff8596d3..c4b3ee734d44 100644
> --- a/package/ipmitool/Config.in
> +++ b/package/ipmitool/Config.in
> @@ -9,14 +9,34 @@ config BR2_PACKAGE_IPMITOOL
>  
>  if BR2_PACKAGE_IPMITOOL
>  
> -config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
> -	string "IANA PEN registry URL or path"
> -	default "https://www.iana.org/assignments/enterprise-numbers.txt"

You forgot to add legacy handling for this variable:

    config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
        string "IANA PEN registry move to iana-assignment package"
        help
          Installation of the IANA PEN is now handled by the
          iana-assignment package; to install a custom PEN,
          use a rootfs-overlay for example.


    config BR2_PACKAGE_IPMITOOL_PEN_REG_URI_WRAP
        bool
        default y if BR2_PACKAGE_IPMITOOL_PEN_REG_URI != ""
        select BR2_LEGACY

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
