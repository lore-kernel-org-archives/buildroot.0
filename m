Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE93C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4DC640302;
	Wed, 19 Oct 2022 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4DC640302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p82iWXJ8RoQO; Wed, 19 Oct 2022 20:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BCB41484;
	Wed, 19 Oct 2022 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BCB41484
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54D9F1BF344
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D4DD4013E
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D4DD4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EplhVZ047Pl3 for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 20:52:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895FC400C4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 895FC400C4
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 20:52:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:97d2:b3b8:72e7:abf5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F35C4780346;
 Wed, 19 Oct 2022 22:52:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:52:36 +0200
Date: Wed, 19 Oct 2022 22:52:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Simon Richter <simon.richter@ptwdosimetry.com>
Message-ID: <20221019205236.GG3666@scaer>
References: <20221019161513.994988-1-simon.richter@ptwdosimetry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019161513.994988-1-simon.richter@ptwdosimetry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666212759;
 bh=my4RA1otLbjt8kWxW7L+VunQP31CVKaq6vj1FkWp+68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNUhpn4iyeOqXx13Ed64wRo51suXphV+XET92jcoJbmIVlna/V2Op5+0rdXbLUxW5
 y0hg80t6RJ21QbED4kOOolPO0n+y9g+0Xaho/NwJxkg2Nel0c3iKY3iNPtiqez+Z+s
 tHJR3jjNPnlmbKh0nWDpkaP9TbzRzAADCarJNwMU0FQ2H+wIu6Pl2irKfZFmtNQs1v
 7m0/nT6UAfNInynWivD+F1uKFsfzEzkWlK1uO0+EkOx8z0pdGY//FUvmreiF0NGFcr
 y7TKoy8ov7XFK1eYn1K8DFfyfeKvfrmzA69EnD676HbvvNuT2kox37WgTnwEwja3/j
 aT0FJvBmauAIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aNUhpn4i
Subject: Re: [Buildroot] [PATCH 1/1] support/download/cargo-post-process:
 use cargo output for vendor config
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simon, All,

On 2022-10-19 18:15 +0200, Simon Richter spake thusly:
> Use the `cargo vendor` output to generate the vendor configuration.
> 
> Fixes the need to patch the configuration if there are
> dependencies that do not come from crates.io.

Could you provide a bit more details on how this works?

For example, we create a config file with:

    [source.crates-io]
    replace-with = "vendored-sources"
    [source.vendored-sources]
    directory = "VENDOR"

What would a similar config be like when using dependencies not coming
from crates.io?

Also, can we have a package that uses non-crates.io dependencies, so
that we have a test-case to ensure we have no regression?

> Signed-off-by: Simon Richter <simon.richter@ptwdosimetry.com>
> ---
>  support/download/cargo-post-process | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index a4a4718a2a..7d6ecdb030 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -22,17 +22,14 @@ post_process_unpack "${base_name}" "${output}"
>  
>  # Do the Cargo vendoring
>  pushd "${base_name}" > /dev/null
> -cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
>  
>  # Create the local .cargo/config with vendor info
>  mkdir -p .cargo/
> -cat <<EOF >.cargo/config
> -[source.crates-io]
> -replace-with = "vendored-sources"
> +cargo vendor \
> +	--manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
> +	--locked VENDOR 2>&1 \
> +	| sed -ne '1,/To use vendored sources, add/!p' > .cargo/config

This means that vendoring step is then entirely silent, and there is no
progress report.

Since the download during the vendoring can be quite big, that means a
long pause without any feedback to the user that something is going on.

Also, if there is a download issue, there is no way to find what
happened.

Can we keep the vendoring to stdout as it currently is, and re-run it
right after, just to generate the config.toml file? I.e. something like:

    cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
    cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR 2>&1 \
    |sed -ne '1,/To use vendored sources, add/!p' > .cargo/config

I've quickly hacked the existing script to run it twice, and it looks
like the second call generates the exact same output, so we should be
covered.

Finally, unrelated to your change: if the package already has a
.cargo/config.toml, then we irremediably override it. Is there something
in that file that would otherwise be required to do the build?

Can we simply append to the file rather than overwrite it, i.e.:
    .... >> .cargo/config.toml

Note that if we want to change that, this should be a different patch,
of course.

Regards,
Yann E. MORIN.

> -[source.vendored-sources]
> -directory = "VENDOR"
> -EOF
>  popd > /dev/null
>  
>  post_process_repack "$(pwd)" "${base_name}" "${output}"
> -- 
> 2.38.0
> 

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
