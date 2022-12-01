Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D097C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2089610F7;
	Thu,  1 Dec 2022 20:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2089610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_GeWObDHA36; Thu,  1 Dec 2022 20:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C900060030;
	Thu,  1 Dec 2022 20:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C900060030
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EDCB1BF83C
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1850D8210A
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1850D8210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tx9bZKRplHxr for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:26:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22848820EB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22848820EB
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 20:26:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d7e:5704:aa80:b7b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E05DAB00548;
 Thu,  1 Dec 2022 21:25:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 01 Dec 2022 21:25:58 +0100
Date: Thu, 1 Dec 2022 21:25:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Pesce <luca.pesce@vimar.com>
Message-ID: <20221201202558.GB978091@scaer>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669926361;
 bh=5hVFsJXMoECK2S8oksvQFEzAjXadBAg0qvx9MnRgOx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3v2q8lvKicPtXaUZF0EZQNMddLK36bHz2wGvpUqRy+W2NQkIhOIyPzuYhM4r+peB
 NkPusBEKQTB83JiuNdbyWpGffUMjWzW8CcyB0cKsXFcf0jJZLfJOgKACUGclZDxNj3
 2UasGgtoJZa5t6NyorAWckqZHGWx3BwApA7BJiLoSOFU/5qm+2hgKQiXtyUnmHv/kU
 IPnq0B3rUEGOVC1lQ8HOowahu8kjXVCiXcWlWNL7CdTvEVUhG+GDAtqaH7roOi5j78
 MubwUvM0Pj/38I6/3rt40Co4bhEtT04YqRHspKAAZqAaNpv2mOUszprMCyFu326TvB
 rGmyo0JboFEzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j3v2q8lv
Subject: Re: [Buildroot] [PATCH] support/download/dl-wrapper: make the whole
 dl_dir writeable for the group
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

Luca, All,

On 2022-11-30 14:43 +0100, Luca Pesce via buildroot spake thusly:
> Root makefile imposes 'umask 0022', which means that every file/folder in
> the per-package download directories has no write permission for the group.
> These are writeable just for the owner - the user that issued the first build
> that populated the per-package dl dir for the first time (say user A).
> Thus, if a BR package changes its version (e.g. for buildroot update), and
> another user (say user B, in the same group of A) starts a build, BR fails the
> creation of package-xxx.tar.gz inside the dl dir, because user B has no write
> permissions on that path. Furthermore, in the case of the git backend, this
> makes the git cache not updatable by a different user.
> 
> So, to allow sharing of a rw BR2_DL_DIR location among users of the same group
> on a host machine (e.g. a build server used by many users, all belonging to a
> certain "developers" group), set group write permission to the whole package
> dl dir.
> 
> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
> ---
>  support/download/dl-wrapper | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 09a6ac1..b7a4319 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -190,6 +190,10 @@ main() {
>      new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))

This code was written before we enforced our umask, so it is now indeed
incorrect (at least, the comment above is misleading).

>      chmod ${new_mode} "${tmp_output}"
>  
> +    # Make the whole dl_dir writeable for the group, so other users within
> +    # the group can download new versions and update any vcs cache in it.
> +    chmod -f -R g+w "${dl_dir}"

But what if the user initially had umask 0022 to begin with? By forcing
the group authorization with the chmod, you are overriding the user's
umask settings, which is not good... I for one would not want to have
group-writable directories (or files) created when I would have not
expected it.

Instead, what about something like:

    diff --git a/Makefile b/Makefile
    index 827ab230ef..949f27f1eb 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -83,10 +83,15 @@ $(MAKECMDGOALS): _all
     _all:
     	@umask $(REQ_UMASK) && \
     		$(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
    +			BR_ORIG_UMASK=$(shell umask) \
     			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
     
     else # umask / $(CURDIR) / $(O)
     
    +# Save the user's original umask, as we may need it later on, like
    +# during the download dl-wrapper
    +export BR_ORIG_UMASK := $(or $(BR_ORIG_UMASK),$(shell umask))
    +
     # This is our default rule, so must come first
     all:
     .PHONY: all
    diff --git a/package/pkg-download.mk b/package/pkg-download.mk
    index 0718f21aad..e9dfec635d 100644
    --- a/package/pkg-download.mk
    +++ b/package/pkg-download.mk
    @@ -107,9 +107,11 @@ endif
     #
     ################################################################################
     
    +# Use user's original umask, in case they have provisions set to share
    +# the download directory with their group (or the whole world).
     define DOWNLOAD
    -$(Q)mkdir -p $($(2)_DL_DIR)
    -		$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
    +	$(Q)umask $(BR_ORIG_UMASK); mkdir -p $($(2)_DL_DIR)
    +	$(Q)umask $(BR_ORIG_UMASK); $(EXTRA_ENV) $($(2)_DL_ENV) \
     		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
     		-c '$($(2)_DL_VERSION)' \
     		-d '$($(2)_DL_DIR)' \

The comments are only mostly stubs and need being expanded a bit...

Regards,
Yann E. MORIN.

>      # We must *not* unlink tmp_output, otherwise there is a small window
>      # during which another download process may create the same tmp_output
>      # name (very, very unlikely; but not impossible.)
> -- 
> 2.7.4
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
