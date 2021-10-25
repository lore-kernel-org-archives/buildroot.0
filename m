Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6524FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:27:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C6E6115C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5C6E6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B5040288;
	Mon, 25 Oct 2021 19:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CszpBCRr3B4; Mon, 25 Oct 2021 19:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC6F9403C6;
	Mon, 25 Oct 2021 19:27:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDE851BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA29F80DAF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpMWdeimMMHm for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:27:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAA7680D9B
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635190046;
 bh=UmNrLFlFa1vjKWxem69uCZsrmaga6USma/89tsRjdIQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jJcNqG9QkcE0I7T1Nnr8DJSblXFAFr/5dI5L0p/7CCWXx8qwo2AHUBFY0pVHpK0gl
 9HyuC6i7pFKk8WkBMLd0oCrSg/X7o5NfEYRZh2dyqvElcDiQEuONhENbBN16K6qu+4
 u81TxtHYL9lNM0UHaV0mcUHpYaUSki8CZXMAzg78=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1n9De23lnH-00eZEv; Mon, 25
 Oct 2021 21:27:26 +0200
Date: Mon, 25 Oct 2021 21:27:25 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211025212725.0dcf0968@gmx.net>
In-Reply-To: <20211025075659.3845637-1-james.hilliard1@gmail.com>
References: <20211025075659.3845637-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:8nP/LqtBHubcAyUM8OaIvMBBGEG46HbFHnqM53qDZi/NM0OaSOu
 p2vDtGD99gb73piR/FjWO2L6/SCZmBoNP9GOz8zRt4lRWvn3k4GnG05b0qYacgBkciAMsZa
 1sWz6swYgFcMCrfbHSBjrjrup9GGADzx3FXx0cLKlX4iwSSw2K+WKk5tKr93ZOP/Eg88Ef0
 XQigozDSInglZTB+b+2xw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oecurpqOktg=:MsLU+Q/XVZA2juZ+lIUUvM
 yZ6ifZ6HiO9OvXZppW6lNRkgsYOAR4mDHtDCQBNImzKEpsLIThuY4KzsYe4PaYpUfhAtGpCdO
 02jLkP4DAJudY1iwW6Ka7iztvoFG0AGfusfKvmJUIsC7at5pz0fciBTK93infv3Y9COyrjh5c
 avtjlkHzJ9Yf5h9BarfQCHSD8abwTYNvBsVehDNdAAoWN1G1EU6CRfGI7Ngs4b3dH18a2Hnas
 qyMyqODrABTPaDs94Td4gzrAiKZTAA6PANvpPVCTm+RkAAn7V8tPtP7/wKVl/FtasKQZUI4jq
 ZXGrHTE+UZCpKv4lxz6upc46LuhUdsyGD5xXuIqEUpyTiZRucjqXagizXf+yZkw7tJ9VpvruF
 EcHzK1vNPTt4rbJ3kTRZ7MOPz2rwAEC1rK5fkuLhc284fH3/LqR9IpoZUJ1GsAFUJGE/ZozC2
 79THkTJYlvDHaF6Wi6tOTQ0zkIUiYnTBoULrHveXI6drwOVIPm35YqJZ580njIPQ8D8xbyp8C
 ik/OxLe+sAKueHaq2/GaHgtqEMaIE9XLqcQ+0v9LlQhhGiAMzV1lNyU3Qnq0nF9EVCrqELt5o
 xOS7mbUww89/QBBKcHsP6AW2bAZJJBAbLJuSp8Qx0Ug+BZrf1iJ07cDBqwdVJoQ/bfQY0vchZ
 X+lpQEMGsLGIMBLDTvuLPhUeNKITKaGUKOlUYsgGOerXxLWobdkcxjtWZTFZHseCLUCjJeLG7
 CNz7DEVZwOkjvhO6k3iiqFBHNlrQWHAjjk2d+WclaRXuis4TvZXOCdS2uNXkGPBQFEv/QTla/
 FC1cG+vvGK9iWxnntklKagToL2gpQ5IuaoSxbskD8QybIHessWGy80EkDh3q9vy9iwC8uB8ub
 6K0D5JNuL0geoFleTRPMO4nqmz8PscGdfGMUwmLlbD0usJCWVVwAKKUxyGnHBOOE9/z7iQQ4o
 eeVL8muQ0YNwUYsGgeo3xzHBMYaNG0fRThSGyBUe1RK7RQMclfM4KiVgxB7NqmVAdt0SSQ8OR
 cfg8Msbi9sD2895LPaRvYQXvkdJaBIzGGAIqw6QDGsWHUbnhpmj5DL7jWel4WVPMqMpPeeYjv
 Pd2vbMCV/H/iC8=
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix meson options
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

Hello James,

On Mon, 25 Oct 2021 01:56:59 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Fix teletextdec name and remove vdpau which is no longer available.
>
> Fixes:
> output/build/gst1-plugins-bad-1.18.5/meson.build:1:0: ERROR: Unknown options: "teletextdec, vdpau"

Mentioning that the meson bump to 0.60.0 propagated the

	WARNING: Unknown options: "teletextdec, vdpau"

to

	ERROR: Unknown options: "teletextdec, vdpau"

and aborts would be fine (and put it into a patch-series, best with
the meson version bump last for buildroot bisect support)...

Otherwise (and thanks for fixing):

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regars,
Peter

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index d8b2e2a5d3..d3f089bfed 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -59,12 +59,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>  	-Dofa=disabled \
>  	-Dopenexr=disabled \
>  	-Dopenni2=disabled \
> -	-Dteletextdec=disabled \
> +	-Dteletext=disabled \
>  	-Dwildmidi=disabled \
>  	-Dsmoothstreaming=disabled \
>  	-Dsoundtouch=disabled \
>  	-Dgme=disabled \
> -	-Dvdpau=disabled \
>  	-Dspandsp=disabled \
>  	-Dsvthevcenc=disabled \
>  	-Dtranscode=disabled \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
