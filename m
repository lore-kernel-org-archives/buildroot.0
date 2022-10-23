Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B946ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 16:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B62D681494;
	Sun, 23 Oct 2022 16:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B62D681494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VYQddrsRYhA; Sun, 23 Oct 2022 16:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F2381491;
	Sun, 23 Oct 2022 16:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F2381491
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C75291BF4D5
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A02C2404B9
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A02C2404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-W8PMzEdlAC for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 16:44:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A181B403EC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A181B403EC
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 16:44:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2ae:5e11:f166:1b85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5752BB00535;
 Sun, 23 Oct 2022 18:44:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Oct 2022 18:44:44 +0200
Date: Sun, 23 Oct 2022 18:44:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Oguz Ozhan <oguz.ozhan@mind.be>
Message-ID: <20221023164444.GA1058960@scaer>
References: <20221021091531.2989489-1-oguz.ozhan@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021091531.2989489-1-oguz.ozhan@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666543489;
 bh=OtGiKM41r+eBJxLVxftwTAOyVJ93A4a9x2j5Q3aZ/iw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdcyFJ8OewmZNU5c0QX2T2pPyQBhNAtn9UnxYq90uhIuI7u1SiwJIRq+JHBDN9xdc
 mAxX4ovYHFq2HNs8PqO9lUt0/U4IMDl60msvwGvrvf/pQYtb9zodbGhSV0BziL9q7K
 isHwkyfpClv152vQj0i6rs8WLBUnZ/otyFpqkyAdrSSqBeGjGZZArbSeWgezZZvSdZ
 tG+ibI8Dg2ezxZFJQe1ng0RUCgYDM0wJDkS96fT6VrRyjKMrSiVacFKLaNI5DgZc+r
 m1/BiaSIGWseP8hStvcDbijsSHo7NiJJ1QfEewoNzSlh+2/vtZsDZSq9jOR7ZFjJIM
 WZo7sasYDInRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UdcyFJ8O
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: replace nose2 with
 pytest - Dockerfile
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
Cc: Oguz Ozhan <oguz.ozhan@mind.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oguz, All,

On 2022-10-21 11:15 +0200, Oguz Ozhan spake thusly:
> From: Oguz Ozhan <oguz.ozhan@mind.com>
> 
> - From web page of nose2:
> (https://docs.nose2.io/en/latest/)
> nose2 vs pytest:
>   - pytest is an excellent test framework and we encourage users to consider it for new projects.
>   - It has a bigger team of maintainers and a larger community of users.

This clearly states "for new projects", but we are not new! ;-)

Why do we need to switch to pytest, and what does that bring us? (see
below too)

> - pytest is more robust and has more ability compared to nose2

You provide robustness and more abilities to advocate for switching to
pytest, however, you do not explain what is currently broken that would
be fixed by the pytest robustness, or what new features from pytest we
could leverage, and how.

Note that I am not opposed to switching, but we need a good rationale
for switching.

This commit should also come after we actually did the switch, i.e. we
should first convert support/testing/ over to pytest, then modify the
dockerfile accordingly, which allows to write a better coomit log.

Also, please organise your commit logs as (first line is the title):

    support/docker: install pytest instead of nose2

    Now that the tuntime test infra has switched to using pytest instead
    of nose2, install the appropriate packages in the Dockerfile for our
    reference build environment.

    Note that pytest-parallel is not available i Debian Bullseye, so we
    install it (and its depenencies) from Pypi instead.

    Signed-off-by: You

See more below...

> Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
> ---
>  support/docker/Dockerfile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index f54c31b54a..fd1527b1f9 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -38,8 +38,8 @@ RUN apt-get install -y --no-install-recommends \
>          mercurial \
>          openssh-server \
>          python3 \
> +        python3-pip \
>          python3-flake8 \
> -        python3-nose2 \
>          python3-pexpect \
>          python3-pytest \
>          qemu-system-arm \
> @@ -53,6 +53,9 @@ RUN apt-get install -y --no-install-recommends \
>      apt-get -y autoremove && \
>      apt-get -y clean
>  
> +# To be able to run tests in parallel
> +RUN pip install pytest-parallel

Please, pin the version so that the image is reproducible.

Also, if pytest-parallel has dependencies, explicitly install those at
pinned versions too.

Also note in the commit log that pytest-parallel is not available in
bullseye, so we need to get it from Pypi instead (as in my suggestion).

Regards,
Yann E. MORIN.

>  # To be able to generate a toolchain with locales, enable one UTF-8 locale
>  RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
>      /usr/sbin/locale-gen
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
