Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90773C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 16:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042E4814C9;
	Tue, 15 Nov 2022 16:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042E4814C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CGa1PEe47A7; Tue, 15 Nov 2022 16:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DD2812C0;
	Tue, 15 Nov 2022 16:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20DD2812C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00D911BF681
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 16:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFA4F812C0
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 16:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA4F812C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAoWerOQEoeU for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 16:19:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0487E812B1
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0487E812B1
 for <buildroot@busybox.net>; Tue, 15 Nov 2022 16:19:13 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D428E440E8B;
 Tue, 15 Nov 2022 18:16:35 +0200 (IST)
References: <20221115160715.10975-1-mf@go-sys.de>
User-agent: mu4e 1.8.10; emacs 27.1
To: Michael Fischer <mf@go-sys.de>
Date: Tue, 15 Nov 2022 18:16:14 +0200
In-reply-to: <20221115160715.10975-1-mf@go-sys.de>
Message-ID: <87y1scqjgi.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1668528995;
 bh=ad5Ft4zaGuosjpK2hVDkTD+49QKlfsDAPBlxpMrltIg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Hx8gJJqEpqkFU435p1A6wQaE+xEE3fYgWNdy2WIaystQoBsV6gFxqrVKHiWa3brPt
 UZVpLrM6GGioDKLNx1ReJdcRUHKnsxWWU+NFsNaOhsMYJbzAUwknKwkdb6LK+ypqzE
 PS/8M7cVnNdT1zvvZ5bx11Yvut8zrBKp2GcMiXNClWL4TB5dHRHefTqpJxVRNZw7ld
 +eOqP/wIsw/U0FOIfHRncapG3V73rRJKn3pNdl2KaeaV9o+6337i7TNs//F4fjmWmc
 5WtoYdnPRtEi3LHUXt2LCqSz0yiAk9p5D92HMkXxaFqCG8kE0bOUzVyVeuzzfUJ3ll
 KZpPck9eOLiAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Hx8gJJqE
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump version to 2.3.8
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On Tue, Nov 15 2022, Michael Fischer wrote:
> Add a patch to fix undefined reference to `ks_ldap_free_state'
>
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/gnupg2/0001-ks_ldap_free_state.patch | 22 ++++++++++++++++++++
>  package/gnupg2/gnupg2.hash                   | 10 ++++-----
>  package/gnupg2/gnupg2.mk                     |  2 +-
>  3 files changed, 28 insertions(+), 6 deletions(-)
>  create mode 100644 package/gnupg2/0001-ks_ldap_free_state.patch
>
> diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
> new file mode 100644
> index 0000000000..03d27e94d5
> --- /dev/null
> +++ b/package/gnupg2/0001-ks_ldap_free_state.patch
> @@ -0,0 +1,22 @@
> +Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is
> +not installed
> +
> +https://www.linuxfromscratch.org/blfs/view/svn/postlfs/gnupg.html
> +
> +Signed-off-by: Michael Fischer <mf@go-sys.de>

I think it would be better to just backport upstream commit 7011286ce6e1
("dirmngr: Fix build with no LDAP support.").

Make sure to add your sign-off, and a reference to upstream commit.

baruch

> +
> +--- a/dirmngr/server.c	2022-10-07 15:23:50.000000000 +0200
> ++++ b/dirmngr/server.c	2022-11-15 16:34:08.390674457 +0100
> +@@ -3137,8 +3137,12 @@ start_command_handler (assuan_fd_t fd, u
> +                ctrl->refcount);
> +   else
> +     {
> ++#if USE_LDAP
> ++#if USE_LDAP
> +       ks_ldap_free_state (ctrl->ks_get_state);
> +       ctrl->ks_get_state = NULL;
> ++#endif
> ++#endif
> +       release_ctrl_ocsp_certs (ctrl);
> +       xfree (ctrl->server_local);
> +       dirmngr_deinit_default_ctrl (ctrl);
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index ec2654be7b..f9c071ad45 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,7 +1,7 @@
> -# From https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html
> -sha1  9255a70a984bfbfa5312a9a52a1cf47cb0d1fc84  gnupg-2.3.7.tar.bz2
> +# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
> +sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
>  # Calculated based on the hash above and signature
> -# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.7.tar.bz2.sig
> -# using key 02F38DFF731FF97CB039A1DA549E695E905BA208
> -sha256  ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669  gnupg-2.3.7.tar.bz2
> +# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
> +# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
> +sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 7d8424c136..9dc29ca99e 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.3.7
> +GNUPG2_VERSION = 2.3.8
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
