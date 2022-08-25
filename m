Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB9ECAA24
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 17:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1366240AA8;
	Thu, 25 Aug 2022 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1366240AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyHEUiaYIWwE; Thu, 25 Aug 2022 17:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88EC840A8E;
	Thu, 25 Aug 2022 17:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88EC840A8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4DC81BF427
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 17:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCD9583E3B
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 17:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD9583E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7f0OakB3eUT9 for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 17:23:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F9B8138B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41F9B8138B
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 17:23:29 +0000 (UTC)
Received: from [IPV6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341] (unknown
 [IPv6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341])
 (Authenticated sender: thierry.guibert@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A1D0220058B;
 Thu, 25 Aug 2022 19:23:20 +0200 (CEST)
Message-ID: <c9a96eae-198c-7901-515e-74458c3fd8c9@free.fr>
Date: Thu, 25 Aug 2022 19:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: fr, en-US
To: Christian Stewart <christian@paral.in>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer>
 <f882f86c-31f2-55b4-e3f4-9a64e93bd0e9@theobroma-systems.com>
 <CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com>
From: Thierry GUIBERT <thierry.guibert@free.fr>
In-Reply-To: <CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661448203;
 bh=irXIaqW1lg4mi+ddr7HFe9u5getmuO0HKmhZI04hArM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=co2jQEH/YsL3j+rhetxKz063vtUAUGwtznS1a6+GF/ELvLxLK5EX4OAymJeUCDomy
 EzwHzvE8qFuv7iaCD+QJAKB+gl6Ug+11/CTD9n7rmWw8toxjNd0SA2Ggx9d6WavzOg
 p0Z2YdfUeUp3K2dqVhQXWGQ6PgCgBZos0NOBlwaTdgIqmfVaRWFen48keYGCEb5zMl
 rF2JlSSH0UsYgAtKF9ej/zJZuSga6v6nf2Fv1ET4b3/fdiYhvteYU6YlrNFf7HRExB
 rY1MAuIUFJtOBYARcfnVi+R7HEg7a/fuEROsrV+eWjhZXa1WUPHcTirbC5vegaEkjr
 iFS7Rfq38UgoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=co2jQEH/
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0277535735238590351=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============0277535735238590351==
Content-Type: multipart/alternative;
 boundary="------------aRyHLwbuKe4dPSop00XTomPt"
Content-Language: fr, en-US

This is a multi-part message in MIME format.
--------------aRyHLwbuKe4dPSop00XTomPt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I think the actual situation is the good one, except that external users 
can't pull images from the gitlab registry

But knowing that those containers are for development only, I have built 
my own for production firmware construction.

The question could be "what do we do with already published images" 
(especially the one tagged as "latest")

It may be described in the documentation, and maybe it already is.

Regards



On 25/08/2022 18:25, Christian Stewart wrote:
> I recommend using quay.io <http://quay.io> instead to avoid the rate 
> limit.
>
> Best,
> Christian Stewart
>
> On Wed, Aug 24, 2022, 9:20 AM Quentin Schulz 
> <quentin.schulz@theobroma-systems.com> wrote:
>
>     Hi Yann,
>
>     On 8/23/22 18:40, Yann E. MORIN wrote:
>     > Thierry, All,
>     >
>     > On 2022-08-23 15:13 +0200, Thierry GUIBERT spake thusly:
>     >> I'm using buildroot to build raspberry pi rootfs for the french
>     red cross.
>     >
>     > A noble endeavour, thank you!
>     >
>     >> Is there any reason for buildroot/base:20220206.1756 not to be
>     published in
>     >> the docker hub ?
>     >
>     > The rationale behind our docker image, is to be able to run our
>     own CI
>     > jobs, that runs in gitlab-CI. Since Docker hub now limits the
>     number of
>     > downloads permonth per image (on fre etier), the CI was very often
>
>     Could Buildroot fit the Docker Open Source Program criteria by any
>     chance? https://www.docker.com/community/open-source/application/
>
>     That would remove those limitations.
>
>     If that is not possible or not wanted by the project, I guess that
>     pushing to hub.docker.com <http://hub.docker.com> but have the
>     Overview page state that this is
>     pull-limited and recommend using the gitlab registry instead?
>     https://hub.docker.com/r/buildroot/base
>
>     Cheers,
>     Quentin
>     _______________________________________________
>     buildroot mailing list
>     buildroot@buildroot.org
>     https://lists.buildroot.org/mailman/listinfo/buildroot
>
--------------aRyHLwbuKe4dPSop00XTomPt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <p>I think the actual situation is the good one, except that
      external users can't pull images from the gitlab registry</p>
    <p>But knowing that those containers are for development only, I
      have built my own for production firmware construction.</p>
    <p>The question could be "what do we do with already published
      images" (especially the one tagged as "latest")</p>
    <p>It may be described in the documentation, and maybe it already
      is.<br>
    </p>
    <p>Regards<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25/08/2022 18:25, Christian Stewart
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">I recommend using <a href="http://quay.io"
          moz-do-not-send="true">quay.io</a> instead to avoid the rate
        limit. 
        <div dir="auto"><br>
        </div>
        <div dir="auto">Best,</div>
        <div dir="auto">Christian Stewart </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Aug 24, 2022, 9:20 AM
          Quentin Schulz &lt;<a
            href="mailto:quentin.schulz@theobroma-systems.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">quentin.schulz@theobroma-systems.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Yann,<br>
          <br>
          On 8/23/22 18:40, Yann E. MORIN wrote:<br>
          &gt; Thierry, All,<br>
          &gt; <br>
          &gt; On 2022-08-23 15:13 +0200, Thierry GUIBERT spake thusly:<br>
          &gt;&gt; I'm using buildroot to build raspberry pi rootfs for
          the french red cross.<br>
          &gt; <br>
          &gt; A noble endeavour, thank you!<br>
          &gt; <br>
          &gt;&gt; Is there any reason for buildroot/base:20220206.1756
          not to be published in<br>
          &gt;&gt; the docker hub ?<br>
          &gt; <br>
          &gt; The rationale behind our docker image, is to be able to
          run our own CI<br>
          &gt; jobs, that runs in gitlab-CI. Since Docker hub now limits
          the number of<br>
          &gt; downloads permonth per image (on fre etier), the CI was
          very often<br>
          <br>
          Could Buildroot fit the Docker Open Source Program criteria by
          any <br>
          chance? <a
            href="https://www.docker.com/community/open-source/application/"
            rel="noreferrer noreferrer" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://www.docker.com/community/open-source/application/</a><br>
          <br>
          That would remove those limitations.<br>
          <br>
          If that is not possible or not wanted by the project, I guess
          that <br>
          pushing to <a href="http://hub.docker.com" rel="noreferrer
            noreferrer" target="_blank" moz-do-not-send="true">hub.docker.com</a>
          but have the Overview page state that this is <br>
          pull-limited and recommend using the gitlab registry instead?
          <br>
          <a href="https://hub.docker.com/r/buildroot/base"
            rel="noreferrer noreferrer" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://hub.docker.com/r/buildroot/base</a><br>
          <br>
          Cheers,<br>
          Quentin<br>
          _______________________________________________<br>
          buildroot mailing list<br>
          <a href="mailto:buildroot@buildroot.org" target="_blank"
            rel="noreferrer" moz-do-not-send="true"
            class="moz-txt-link-freetext">buildroot@buildroot.org</a><br>
          <a
            href="https://lists.buildroot.org/mailman/listinfo/buildroot"
            rel="noreferrer noreferrer" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------aRyHLwbuKe4dPSop00XTomPt--

--===============0277535735238590351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0277535735238590351==--
