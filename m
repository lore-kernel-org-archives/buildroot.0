Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C015C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D8460E1D;
	Wed, 13 Apr 2022 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KR5H04vi78R5; Wed, 13 Apr 2022 21:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28F6460BD0;
	Wed, 13 Apr 2022 21:04:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1393D1BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0168E4030A
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9AbQ1t8F6mJ for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88933409E3
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:04:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A23B61C0002;
 Wed, 13 Apr 2022 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649883848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGo1QdVKtgJzKghwoQm0urptZ/yF9p4dvwhVnYe0+Fs=;
 b=LHj1Z9MfZ8qyCg6NCXFpyO32OJHpAh5pa/Tly+RsW4l1SPcTFshfIHiiW8wDM9ItBXRU8Y
 ct5GNyIBssLerU5fWUky9MKhD91up0AE6L+JsKA/2OZECD2qheOtvqf1+Vyn7szNKQYzuU
 C0yWpGNBJH69Agnj0G+N5fb6uHO1PKe0fsT4p9MK2Oy5hnM0eyX6PKMvboRJQ93Q+VTsbR
 IqyalS50vzjv+pobvCyRwOd5il/Gy5YnAIYipEenS5PdnUdpska/tHo9N+RHxBBiO8ouk8
 qkDiBMcjfE+Xlt2NBeFmzh+zcrrzG09+uucZaMCy+j7H5OV9FFQZS+Jg+tBJiw==
Date: Wed, 13 Apr 2022 23:04:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220413230407.6c747891@windsurf>
In-Reply-To: <20220410043227.602485-2-james.hilliard1@gmail.com>
References: <20220410043227.602485-1-james.hilliard1@gmail.com>
 <20220410043227.602485-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] scripts/autobuild-run: add
 --no-toolchains-csv option and drop docopt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  9 Apr 2022 22:32:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Since docopt is unmaintained and less flexible than argparse lets
> drop it and migrate to argparse.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks! I think it would have been great to split the conversion from
docopt to argparse from the addition of no-toolchains-csv. Regardless
of that, I wanted to apply, but spotted something incorrect in the help
text, showing that the argparse logic is probably wrong. Look:

  --toolchains-csv TOOLCHAINS_CSV
                        Toolchain configuration file (default: support/config-fragments/autobuild/toolchain-
                        configs.csv)
  --no-toolchains-csv   Generate random toolchain configuration (default: support/config-
                        fragments/autobuild/toolchain-configs.csv)

See how --no-toolchains-csv option has a default value... that doesn't
make any sense?

> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> +    toolchains_csv.add_argument("--toolchains-csv",
> +                                dest="toolchains_csv",
> +                                help="Toolchain configuration file",
> +                                type=pathlib.Path)
> +    toolchains_csv.add_argument("--no-toolchains-csv",
> +                                dest="toolchains_csv",
> +                                help="Generate random toolchain configuration",
> +                                action='store_false')
> +    parser.set_defaults(toolchains_csv=pathlib.Path("support/config-fragments/autobuild/toolchain-configs.csv"))

I suppose this is what makes it have this incorrect "default value".

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
