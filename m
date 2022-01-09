Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3CDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD6381B71;
	Sun,  9 Jan 2022 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjSccyRUCT7K; Sun,  9 Jan 2022 20:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 859B981BC6;
	Sun,  9 Jan 2022 20:08:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE1761BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C408C40359
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zladHRqCpSrJ for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92668402C3
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:08:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 819425FF33;
 Sun,  9 Jan 2022 21:08:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641758889;
 bh=j6IiPLxKLSf9BY5wb0I1CSXI0tni77yDmd1Ep9J0eZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pXFMbELQiUVFyHOkEQrkKlNXEh1X8ZOXMyeZKaI8K0Log/ueMjRv4dPemL6LVHYxf
 YtzZhE1ZfGHnPP0LId4qTVFE95LDOUHwkj8t2CeVPXhk+CCug0AypKfVkfk8wcqpen
 Nmr0PHzs1vJty0Q1WS99h0I6k2bjiEDjddPCcPlguvRFU5DAdey3Ri8eSKn+o+qH1T
 VAmp/G9CWHNWKZbHe433VaSw1DThGzCoqnWyWl1/Ri0ZJqzRrwfZcuMbVFMJcmeD1C
 pPmh8NQKOzMze6tL9U+SUy0UjIsf3HgUtaugjlWykHLnzOiAOmaEgd9tUwiSu7mKtD
 ABBGRvF60aIfw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 21:08:06 +0100
Date: Sun, 9 Jan 2022 21:08:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220109200806.GD1477939@scaer>
References: <20220109151414.1908259-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109151414.1908259-1-romain.naour@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCHv2 1/2] package/pkg-golang.mk: set GOPROXY to
 proxy.golang.org
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

Romain, All,

On 2022-01-09 16:14 +0100, Romain Naour spake thusly:
> While packaging telegraf [1] the download step failed due to a checksum
> mismatch:
> 
>     go: downloading collectd.org v0.5.0
>     get "collectd.org": found meta tag vcs.metaImport{Prefix:"collectd.org", VCS:"git", RepoRoot:"https://github.com/collectd/go-collectd"} at //collectd.org/?go-get=1
>     verifying collectd.org@v0.5.0: checksum mismatch
>         downloaded: h1:mRTLdljvxJNXPMMO9RSxf0PANDAqu/Tz+I6Dt6OjB28=
>         go.sum:     h1:y4uFSAuOmeVhG3GCRa3/oH+ysePfO/+eGJNfd0Qa3d8=
> 
>     SECURITY ERROR
>     This download does NOT match an earlier download recorded in go.sum.
>     The bits may have been replaced on the origin server, or an attacker may
>     have intercepted the download attempt.
> 
>     For more information, see 'go help module-auth'.
> 
> go-collectd was bumped in telegraf since several releases (since v1.19.0) without
> any changes regarding the go-collectd hash.
> 
> Some users reported an issue [3] when using "GOPROXY=direct" and used
> "GOPROXY=proxy.golang.org" as a workaround.

I'll put down what we discussed on IRC:

Unfortunately, there are cases the other way around: using a proxy broke
the vendoring, while a direct connection solved it. So we won't be able
to satisfy both cases.

Furthermore, relying on a proxy having a cached archive risks breaking
in the future anyway, as that archived may get eventually get evicted
out of the cache of the proxy. Or the proxy may disapear in the future,
or whatever.

In any case, a bad hash is most probably due to one of the following
issues:

  - upstream messed up when adding the dependency and incorrectly copied
    the hash (but that should not happen as adding a dependency is
    supposed to be done with go tools already),

  - the upstream of the dependency changed their release (i.e. they
    re-tagged a release)

  - the go proxy is caching an incorrect archive (e.g. a partial
    download, or an older archive, or is malicious, or whatever).

In any case, we can't do anything about it, and the upstream of the
project has to fix the mess.

So, from my point of view, this is a NACK on this patch.

Regards,
Yann E. MORIN.

> [1] https://github.com/influxdata/telegraf/
> [2] https://github.com/influxdata/telegraf/commit/d4b051edc247a13d7fbdaa49d95fe6e93505d14e
> [3] https://github.com/google/flatbuffers/issues/6466#issuecomment-781954742
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-golang.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 35bcb1673b..e23778d96a 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -85,7 +85,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>  $(2)_DOWNLOAD_POST_PROCESS = go
>  $(2)_DL_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
> -	GOPROXY=direct \
> +	GOPROXY=proxy.golang.org \
>  	BR_GOMOD=$$($(2)_GOMOD)
>  
>  # Due to vendoring, it is pretty likely that not all licenses are
> -- 
> 2.31.1
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
