Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A49C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969AD41605;
	Sun, 29 Jan 2023 20:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969AD41605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCqW1rE4VBgt; Sun, 29 Jan 2023 20:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D93415F2;
	Sun, 29 Jan 2023 20:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81D93415F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4AD1BF3A9
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 394C1400CE
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 394C1400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuiIcAdrmTEl for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 20:55:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E482400CC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E482400CC
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:55:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 19F875FFA3;
 Sun, 29 Jan 2023 21:55:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 21:55:09 +0100
Date: Sun, 29 Jan 2023 21:55:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129205509.GW2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675025719;
 bh=STIc8DcHlxTS/TWWBIMHgIOqF1ZZkyEhtHkYjAXP0WE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJXkQhv2wx4qAaA9uasgE7Y4lLMO3i5J8KmdDGvnGuQrjp2BjV78biNKIhuusUQOC
 ul1Cuq7cn7mdf9lQAZR2rsEWh7Mn5VTUQQo5sJlkd0KPiHRCxlLIAp5IIdq5QjKk1N
 K04A48z45rAr915Dt++fu8zimlsnIXZWq/rVMNLhgJo1F8KTxFUz7o2LwiAXyg1QfE
 NVgbuEZOCP8QeIBER31fIdjSfH09H6GPKFETbKu3sul/DZhfUCLxsiJokP/qub+Ii0
 cLnYUpZQBh8oY+1tC/zViJIAUhpivOgIKjhbEpNLF8m0QR2pkAfzI3rD8vPnOLw1Ie
 WquiDS//8voGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RJXkQhv2
Subject: Re: [Buildroot] [PATCH v4 01/13] package/flatbuffers: build
 position independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> The upcoming tensorflow-lite package requires flatbuffers to be
> built with position independent code.
> 
> Fixes:
> /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flatbuffers/flatbuffers.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> index 9d286bf9e1..487d85ee1f 100644
> --- a/package/flatbuffers/flatbuffers.mk
> +++ b/package/flatbuffers/flatbuffers.mk
> @@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
>  
>  FLATBUFFERS_CONF_OPTS += \
>  	-DCMAKE_CXX_FLAGS="-std=c++11" \
> +	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
>  	-DFLATBUFFERS_BUILD_TESTS=OFF \
>  	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
>  
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
