Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902AFC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA0141712;
	Wed,  5 Jun 2024 21:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_JMXLxl2wNr; Wed,  5 Jun 2024 21:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1FD413A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F1FD413A8;
	Wed,  5 Jun 2024 21:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDAAD1BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6E5741866
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRIIwnYhufQ0 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C0D6417F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0D6417F5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C0D6417F5
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:57:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4215ac379fdso3703715e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717624626; x=1718229426;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S1+8ZRwP5lMQGJB7UxVAli1UUfvbfNUvyPu9HCpHRB0=;
 b=l9igWLlxFAy5DGPeeX/AqLxNGJ1wa/bbf3IXvqDokvNuLfA+QPnEGlj8L/FyGAKhjC
 PgoCBJhNiSb5bAuuI1X5bCNSVQ4wbQWG9a63IDYd4z50d1KjXe5VEHMj2nhsiXvjRbFR
 tfsQUKmtU2/gEmcRrCyUkugvPhhq/Ex7d0dOTHFmA9WaeSNMDWma96nwfK8iofDEzCON
 BagvtOOPgCkADhiNZHOsJs4Ll1e6ACs4S6ozRiWZgxDTKBaYdGvA67Tdo3uVoW4Zw6V/
 zExSNjh2pTEWtUmR+5Ufg38T3FDLk/gRon977wBR1eD/3G4f8Yj65dgdkkHw086BO+2B
 cMxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVct9ub6WjAXQXcUgdWBpZDkDqk+UHV4RAfxgPMtfuNIFF43ZkEpDNg5rl8OvJIjSHau/j3wCXWJZt6wTVPMuz5Ri+DK1G+Qg==
X-Gm-Message-State: AOJu0Yz4xTaZuutd9g+Mh74o5bYCTCZyqYkbiXPwzZQyZEkOQLcFj60K
 9PeyaGa4CxzG4G/L61P8sGH/MNfQA7tLI9DP/X6Byce6b5Dah0EVOp48fmz1LGHJACq/Z+8gt3D
 P
X-Google-Smtp-Source: AGHT+IG21/MvnD+dNqp8FKCdB80lFQiX/ZLDkLnaR3adXd8tX0Nb9QPKszCHBX42lNAldBbeDQzG4g==
X-Received: by 2002:a05:600c:8519:b0:418:969a:b316 with SMTP id
 5b1f17b1804b1-421562c7fc2mr27768935e9.1.1717624625866; 
 Wed, 05 Jun 2024 14:57:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158148f66sm36546105e9.32.2024.06.05.14.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:57:05 -0700 (PDT)
Message-ID: <ee3e0fd3-7bde-49f8-9281-eca399295460@mind.be>
Date: Wed, 5 Jun 2024 23:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717624626; x=1718229426; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S1+8ZRwP5lMQGJB7UxVAli1UUfvbfNUvyPu9HCpHRB0=;
 b=SU7LKFSH9T1gDmh/GwYlVUQHoRFfQIt2y6YbPJlxKb1AqpVyE46FjoCHAWx7Vn6Bk2
 q/ATTGCzCAqTf1nwPu8cY/h/k0EeNZw1IfZI91Zuorr3jrMH7AGSI1rfTWmDXk7+Oo28
 PHFX1TU3I9V01r5k9U5DqHP20cLKgdlhG3ly07oIC0a8kKm0lH/DITnAV6Ln7fYqQbyx
 5YTfRcXdUp5G+zEpiNmH2sXtF/eHB9IKaqMdGhbjkeG3AqHBd7xNH1lGud8jz69y769d
 u5BWQyvhRf/1+QG7ih/w5OaKvp5DdBQNQ+9LVY7oOnDW5AGat3Z0zNzHhzhnSiEXkUsj
 Gn1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SU7LKFSH
Subject: Re: [Buildroot] [PATCH 00/10 v2] everywhere: use $(TAR) not tar
 (branch yem/tarTAR)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, "Maier,
 Brandon L Collins" <Brandon.Maier@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 19:53, Yann E. MORIN wrote:
> Hello All!
> 
> To allow for reproducible archives, and to ensure we can extract all
> archives, we require that we use tar 1.35 or above.
> 
> There are then two cases:
>   1. the system has a suitable tar: we use that;
>   2. the system has no suitable tar: we build our own host-tar, and use
>      that (it ends up in HOST_DIR/bin so is in the PATH).
> 
> However, to avoid building host-tar again and again, people can set the
> TAR environment variable, to point to a tar version they believe is
> suitable (if it is not, we fallback to case 2, above). If the user
> provides a suitable tar, then we do not build our own host-tar and use
> the one provided by the user.
> 
> However, there are a few places where we do hard-code calls to 'tar'
> without considering the one provided by the user. This breaks cases
> where an unsuitable tar is available on the system, as that unsuitable
> tar is then used to create and extract tarballs. This breaks generatign
> tarballs from VCS (git, svn) or from vendoring (cargo, go).
> 
> Fix all those cases.
> 
> How to find calls to tar:
> 
>      $ git grep -E '\<tar '
> 
> There are a lot of false positive:
>    - CHANGES
>    - comments
>    - docs
>    - patches
>    - misc (e.g. a script with a $tar variable)
> 
> After this series, we still have a very few locations which directly
> call to a plain tar:
>    - Makefile: the 'release' target
>    - scripts not called as part of the build
>    - boards readmes
>    - patches
> 
> The first will be addressed in a separate patch, as it is not critical
> (users do not nromally cut Buildroot releases!). The others can't be
> changed, as they execute outside Buildroot's control.

  In case it wasn't obvious: series applied to master, except for the last one 
which went to next.

  Regards,
  Arnout

> 
> Changes v1 -> v2:
>    - fix apply-pathes  (Brandon)
>    - drop useless tarball-patch for liblockfile
> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (10):
>        package/liblockfile: drop empty patch tarball
>        fs/tar: use appropriate TAR
>        package/cvs: use appropriate TAR
>        package/flutter-engine: use appropriate TAR
>        package/pkg-download: export TAR for download backends
>        support/download/helpers: use appropriate TAR
>        support/download/cvs: fix shellcheck
>        support/download/cvs: use appropriate TAR
>        support/scripts/apply-patches: use appropriate TAR
>        package/sunxi-mali-utgard-driver: handle patching the Buildroot way
> 
>   .checkpackageignore                                |  1 -
>   fs/tar/tar.mk                                      |  2 +-
>   package/Makefile.in                                |  2 +-
>   package/cvs/cvs.mk                                 |  2 +-
>   package/flutter-engine/flutter-engine.mk           |  1 +
>   package/flutter-engine/gen-tarball                 |  2 +-
>   package/liblockfile/liblockfile.mk                 |  1 -
>   package/pkg-download.mk                            |  4 ++-
>   .../0001-build.sh-do-not-apply-patches.patch       | 39 ++++++++++++++++++++++
>   .../sunxi-mali-utgard-driver.mk                    |  3 +-
>   support/download/cvs                               |  5 +--
>   support/download/helpers                           |  4 +--
>   support/scripts/apply-patches.sh                   |  2 +-
>   13 files changed, 54 insertions(+), 14 deletions(-)
>   create mode 100644 package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
