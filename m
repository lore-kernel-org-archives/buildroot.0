Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31CBC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 01:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083BB607F0;
	Mon,  9 Jan 2023 01:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083BB607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEsV8UUefqAf; Mon,  9 Jan 2023 01:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EFA607BC;
	Mon,  9 Jan 2023 01:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EFA607BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 974BB1BF4E7
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 01:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D0EC4094D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 01:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D0EC4094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHLthqNQWaFc for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 01:58:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186A04094C
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 186A04094C
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 01:58:55 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15027746720so7319792fac.13
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 17:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8bNdSr7W7J+mJGyeFxHgb+P0zd1rGv74Pj8GtckULtg=;
 b=X/pp+ejrUR1Hp02NCEOO/Gv1MynmpS6tmHYRRasxjasRwre5O2BQNKjrJbOGnHCANm
 Wg2DKGiSISIITaPuw3hmrB2PdA+EbdQJJxpnBr8yvpKglZXaEuh0n0617DnUI5rQVoKb
 akt3YkIEy3WE4Sqfhkq4w6EZSjdKbUQRbzONHo+KusFxQrFaWRJIihtpEhEEXQdgsQBy
 UqPhQ77bYKyxjilm6npyyvKemFdE+eA6e522p3j9jklYZFjC8sRlam2IK5T3C/3uz/h9
 GbIcTFaVu6nev8PZPkUpEczrZuiFYG0TfvxqpQiI7zYyXD0AgTQ5d0z9kPlWxZuYJMHj
 Gcew==
X-Gm-Message-State: AFqh2kqx6r16fWoyqPwNoTMCDZjSkfzwigzhukD4WsPZW2gBTrXfisJH
 E0Drx3d4EinUxOQAVz+CCet/32L4oSBwtuHG5OJj5xr6YhoRLA==
X-Google-Smtp-Source: AMrXdXs3Ro9EiqFTHLsaaVQMA8A1YKRWn4aMMvd99iIqnZykZ0/6/XaxLZPtL/KL17Jc/Mf8jo7uTuJ7G3zR7Bb6dE8=
X-Received: by 2002:a05:6870:8304:b0:144:9744:2be3 with SMTP id
 p4-20020a056870830400b0014497442be3mr3028972oae.93.1673229534945; Sun, 08 Jan
 2023 17:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20230109004748.1372-1-ckhardin@gmail.com>
In-Reply-To: <20230109004748.1372-1-ckhardin@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Jan 2023 18:58:43 -0700
Message-ID: <CADvTj4rTjzyLAYRe0dO+=9=ZmX1odPjDFjs6mN_fwd62Z8ac8w@mail.gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8bNdSr7W7J+mJGyeFxHgb+P0zd1rGv74Pj8GtckULtg=;
 b=C1zBwjNCOevtW1Fqh4B+meHMj3dqdZO6YsFdKP9WC+YiL3qmrWHwGn2NHlHuBmqLWw
 2ERX/0kq4DPDwFfIiXVoFFQbPDHcR5L9LUewLgVCLhkK6VOfygpBvdNFv3ZgcbchigOh
 ccrCEanzbGfVxHucTCOvAVSG4TMhu6CCg+gHfn4obWuE0EDwUG1ZROcSM33l9LnnzSQB
 YLSRdXrNkIJWoYfmL42nBQaxD5IndeUD0ZTGrW5PFPDbzDFKquZMoJ26UKVdxhGL/51x
 I6t0uE8TNdIEQyhK6m+j73XruAS/nuPYV6fzNOIB0MPgl2PwcC1jF8Z4uKR4VHpf5DVa
 v3zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C1zBwjNC
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic: additional
 dependencies for rebuild/reconfigure
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 8, 2023 at 5:48 PM Charles Hardin <ckhardin@gmail.com> wrote:
>
> While testing incremental changes for a kernel build using the
> LINUX_OVERRIDE_SRCDIR, the following behavior was observed.
>
> - edit a file in the kernel tree and save
> - make linux-rebuild for buildroot to pickup the changes
> - rsync occurrs and then the install target is run (no build)
> - run make linux-rebuild a second time and the build is compiled and run
>
> To get the changes in on the first invocation of the rebuild requires
> a dependency on the build target to re-evaluate the stamp dependencies
> after the remove. This is a function of make dependency order evaluation
> so that the install steps will see the missing the install stamp but
> that evaluation doesn't require the rebuild because of the file being
> removed internally on the evaluation.
>
> Explicit $(1)-build and $(1)-configure deps are added that will evaluate
> after the cleans remove the stamps and cause them to be re-invoked.

This isn't correct from my understanding as you aren't actually specifying
the above described execution order.

I think this should more correctly fix the issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20221018034605.800593-1-james.hilliard1@gmail.com/

>
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>  package/pkg-generic.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f2bea01d7d..da99d9622a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1062,12 +1062,12 @@ $(1)-reinstall:         $(1)-clean-for-reinstall $(1)
>  $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
>                         rm -f $$($(2)_TARGET_BUILD)
>
> -$(1)-rebuild:          $(1)-clean-for-rebuild $(1)
> +$(1)-rebuild:          $(1)-clean-for-rebuild $(1)-build $(1)

You aren't actually specifying that $(1)-clean-for-rebuild runs before
$(1)-build but rather are specifying that the $(1)-build target can be
executed in parallel to the $(1)-clean-for-rebuild and $(1) targets.

Parallel targets can effectively be executed in any arbitrary order and/or
at the same time.

>
>  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
>                         rm -f $$($(2)_TARGET_CONFIGURE)
>
> -$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)
> +$(1)-reconfigure:      $(1)-clean-for-reconfigure $(1)-configure $(1)-build $(1)
>
>  # define the PKG variable for all targets, containing the
>  # uppercase package variable prefix
> --
> 2.24.3 (Apple Git-128)
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
