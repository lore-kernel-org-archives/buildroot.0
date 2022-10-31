Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4FFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6942360758;
	Mon, 31 Oct 2022 09:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6942360758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SP8qIZWLx7YE; Mon, 31 Oct 2022 09:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9476A605AE;
	Mon, 31 Oct 2022 09:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9476A605AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 381521BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1252980BB0
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1252980BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4NTftZmWHOH for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:08:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3BAB80B99
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3BAB80B99
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:08:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EC205B0053E;
 Mon, 31 Oct 2022 10:08:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:08:31 +0100
Date: Mon, 31 Oct 2022 10:08:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Simon Richter <simon.richter@ptwdosimetry.com>
Message-ID: <20221031090831.GL1058960@scaer>
References: <20221025100200.78438-1-simon.richter@ptwdosimetry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221025100200.78438-1-simon.richter@ptwdosimetry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667207314;
 bh=LPmS/olKnbg84QqFMOs1YJAV/V3UXbyJwF1q+g6zzVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JATAxYr+tN/p8DuMfEbR1ZFTTIRmEXlwFN4pFh4uR9edJhHKGJUEibAXQAseefQth
 Pw/55WbtUbnaccxaz0dI31MjOeLBxz9BuIHDC3x+/rcNNXsKhbPKLLv1BUhKBsHlZ1
 iOGbokItoGh1q2aNVysjA5K080hykHtmcOF0i++kjQ61q/IkYC/SR1HH3N1QXIlcuE
 XslnUWnTXDK2+OZ/0wN9F8jtJmGygi2Q/R4IVLDO2nd2IwyGmj6vKnz5Zb+AHVODML
 Xj3IDeqzka8lH8rkP9U+7/9S8TmDxNsaGx4SayU7gbePzCRx5TgTMxAZzVLSt8KMD1
 A9w2/kbLPdl8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JATAxYr+
Subject: Re: [Buildroot] [PATCH v2] support/download/cargo-post-process:
 cargo output for vendor config
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

On 2022-10-25 12:02 +0200, Simon Richter spake thusly:
> Use the output of `cargo vendor` to generate the vendor configuration.
> 
> Fixes the need to patch the generated configuration if there are
> non-crates.io dependencies.
> 
> Note:
>   `cargo vendor` currently prints a newline before it prints the
>   needed configuration.
> 
>   This is fixed in +nightly, will end up in +stable soon and must
>   be considered when updating cargo.
>   See: https://github.com/rust-lang/cargo/pull/11273

This is going to need care when we bump, so I added a little comment in
rust-bin.mk and rust.mk tocheck that a version bump still generates the
same archives.

>   Until then it is needed to remove this first line to make sure
>   that the contents of .cargo/config will be the same as they were
>   generated with the earlier version of the script. Thus, the
>   hashes of the packages that use this script remain the same.
> 
> Signed-off-by: Simon Richter <simon.richter@ptwdosimetry.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/download/cargo-post-process | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index a4a4718a2a..186e9eb69b 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -1,6 +1,7 @@
>  #!/usr/bin/env bash
>  
>  set -e
> +set -o pipefail
>  
>  . "${0%/*}/helpers"
>  
> @@ -22,17 +23,28 @@ post_process_unpack "${base_name}" "${output}"
>  
>  # Do the Cargo vendoring
>  pushd "${base_name}" > /dev/null
> -cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
>  
>  # Create the local .cargo/config with vendor info
> +#
> +# The first line of the output to stdout is empty.
> +# So skip it to have the file start with the vendoring
> +# configuration (`tail --lines=+2`).
> +#
> +# NOTE:
> +#   There is  a patch for cargo to remove the first empty line:
> +#   See: https://github.com/rust-lang/cargo/pull/11273
> +#
> +#   The patch already landed in +nightly and will end up
> +#   in +stable soon.
> +#
> +# ->  When updating rust/cargo, the call to `tail` must be removed.
> +#
>  mkdir -p .cargo/
> -cat <<EOF >.cargo/config
> -[source.crates-io]
> -replace-with = "vendored-sources"
> +cargo vendor \
> +    --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
> +    --locked VENDOR \
> +    | tail --lines=+2 | tee .cargo/config
>  
> -[source.vendored-sources]
> -directory = "VENDOR"
> -EOF
>  popd > /dev/null
>  
>  post_process_repack "$(pwd)" "${base_name}" "${output}"
> -- 
> 2.38.1
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
