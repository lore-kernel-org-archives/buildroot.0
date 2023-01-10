Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71987C46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 17:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BD240306;
	Tue, 10 Jan 2023 17:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BD240306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9G7gku38on8; Tue, 10 Jan 2023 17:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88210403D8;
	Tue, 10 Jan 2023 17:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88210403D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 471B21BF5DE
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 17:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F91C81F19
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 17:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F91C81F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OURX9UHCTQy4 for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 17:00:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FD7B81F18
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FD7B81F18
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 17:00:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 57C765FFA9;
 Tue, 10 Jan 2023 18:00:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Jan 2023 18:00:47 +0100
Date: Tue, 10 Jan 2023 18:00:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230110170047.GN151997@scaer>
References: <20230109163017.1260911-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109163017.1260911-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673370052;
 bh=pT6ryQj4rqKJhlu8KoK1MNk8zQ+c8b4I0dYvr5s3ldw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQTAfjdmRlxxUctIICa4Gr3+saH7aYzzORUC5BnFuPGemS9Ogixa9yYz40cQwhwET
 4kOE+jstjD8RdZweVSmCzWyUDPa+7APzJFwpyUOQ2bKNLO1a6rsNPn8vThYAvpBKDl
 wQHfbkUQrru9qsQ75U1aub0wadftJccaYKiplK+lahPxQ1UwUjEYzWHu+rkvODD/Q9
 63RPRzqRcNf4HYhKC2by8jN0/h5nzchcXRJzyOddTcHZ9St5QWeiO4U2tshgIOlDuM
 TSaQS82Uq/++zwsbmFwkcmijuCfMP6XyKHc1fcq/ainR0T8nzFBbDP6F+THAkkMjqO
 18LsYeXdmBsRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vQTAfjdm
Subject: Re: [Buildroot] [PATCH] support/download: fix cargo vendoring
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Simon Richter <simon.richter@ptwdosimetry.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-01-09 17:30 +0100, Yann E. MORIN spake thusly:
> Commit de4cf253752d (package/{rust, rust-bin}: bump to version 1.66.0)
> forgot, despite the big comment above the version strings, to confirm
> that the vendoring was still working.
> 
> Previously, we were adding the vendoring equivalence manually, but in
> commit 04154a651729 (support/download/cargo-post-process: cargo output
> for vendor config), we switched to using the output of "vargo vendor"
> (on stdout) to support caxses were the vendoring equivalence would be
> more complex (e.g. when using crates not hosted on crates.io).
> 
> With rust until and including 1.65.0, "cargo vendor" would output (for
> crates.io crates) the same output as our manual fixups, except it was
> preceded by an empty line. So, to avoid recompting all our hashes, we
> added a tweak to strip away the leading empty line in 04154a651729.
> 
> But rust 1.66.0 includes [0] which changes the output (on stdout) of
> "cargo vendor", where the first empty line is no longer emitted.
> 
> This means that our tweak for rust 1.65.0 now strips out an important
> part of the cargo vendor output, which renders the archives invalid, and
> thus generates different archives, which fail to validate against our
> hashes.
> 
> Fix this by doing what the comment in the post-process helper states,
> and just keep the whole output of "cargo vendor", byt just removing the
> "tail --lines=+2". Since that comment is no longer meaningful, we drop
> it too.
> 
> Now, all our 6 cargo-based packages can be vendored again, without
> changing our hashes, but most importantly, with valid archives.
> 
> Still, we keep the comment above the versions strings, in the hope that
> a future bumper will notice and be more careful at validating the
> vendoring.
> 
> [0] https://github.com/rust-lang/cargo/pull/11273
> 
> Fixes:
>     http://autobuild.buildroot.org/results/bea/beac7674bbc9fd2f8777b5861f65afee9c485753/  (bat)
>     http://autobuild.buildroot.org/results/d1e/d1ec1ebbde115628a4b8b9099544347242a97c1c/  (dust)
>     http://autobuild.buildroot.org/results/f96/f968be895be9ca98b314fdd688ef8d3bdf4e5dfb/  (hyerfine)
>     http://autobuild.buildroot.org/results/a0c/a0cdb6cc9493f5248d98f98b13da854e12adc2be/  (ripgrep)
>     ... and so many others...
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Simon Richter <simon.richter@ptwdosimetry.com>

Applied to master, with all the typoes noticed by Romain fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/download/cargo-post-process | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index 186e9eb69b..21a6be8dbe 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -25,25 +25,11 @@ post_process_unpack "${base_name}" "${output}"
>  pushd "${base_name}" > /dev/null
>  
>  # Create the local .cargo/config with vendor info
> -#
> -# The first line of the output to stdout is empty.
> -# So skip it to have the file start with the vendoring
> -# configuration (`tail --lines=+2`).
> -#
> -# NOTE:
> -#   There is  a patch for cargo to remove the first empty line:
> -#   See: https://github.com/rust-lang/cargo/pull/11273
> -#
> -#   The patch already landed in +nightly and will end up
> -#   in +stable soon.
> -#
> -# ->  When updating rust/cargo, the call to `tail` must be removed.
> -#
>  mkdir -p .cargo/
>  cargo vendor \
>      --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
>      --locked VENDOR \
> -    | tail --lines=+2 | tee .cargo/config
> +    | tee .cargo/config
>  
>  popd > /dev/null
>  
> -- 
> 2.25.1
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
