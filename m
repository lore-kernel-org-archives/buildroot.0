Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CA1C6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 14:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460F481FC6;
	Thu, 16 Mar 2023 14:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460F481FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQMga2-2x7tn; Thu, 16 Mar 2023 14:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D19F81F7D;
	Thu, 16 Mar 2023 14:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D19F81F7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0B41BF36C
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DB9B41AF2
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 14:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB9B41AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1z8-SqIsV7U1 for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 14:15:57 +0000 (UTC)
X-Greylist: delayed 00:06:36 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB26E41AEE
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB26E41AEE
 for <buildroot@uclibc.org>; Thu, 16 Mar 2023 14:15:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 015203200944
 for <buildroot@uclibc.org>; Thu, 16 Mar 2023 10:09:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 Mar 2023 10:09:19 -0400
X-ME-Sender: <xms:DiMTZB22vJp-uQ766JxaR2ZzSAdFq6-I98WLrUc0MO4iqMcXVu4f_w>
 <xme:DiMTZIG0qb4-_tT_lWBmrBrgQ0AsPr0Kuy6flCjKsnfz0GzYT0loXGxgENRmdydLC
 G6xxLoOa6s7fZIbupU>
X-ME-Received: <xmr:DiMTZB4ZuuI4Wd1ncMIvcOswBJ9YbDY1TUEiRzFudmxAs-A04HvNKs97L0UaWpz2DfVMk2R01FrBbi98nQiijKBvTDFOFHqfX0PePy0zE-TDTkjxKyPeV53W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffuvffkjghfofggtgesrgdtre
 erredtvdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
 uggvvheqnecuggftrfgrthhtvghrnhepgfelvedtvdfgffeuudduudffvedvgfdtgeeule
 ehveeigeegheehudffteelgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:DiMTZO0RWSxHbe1murCoocAaOKpwZ7n31q2vMxGhjosXj5EWcd0yOg>
 <xmx:DiMTZEFUxzCwhr2grZMkbPcdsmY8untL86SVLLyFKBup9ewOUQuh9A>
 <xmx:DiMTZP_hY2X7wuhBBQv2yp5ML4_Z2Rdw8zKuI3-PuOpnG0plynMASQ>
 <xmx:DiMTZITn8AhJAeS8rEtrUa_PA7wHrZGyTviml5KvsL7P7xxS-NQJpA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@uclibc.org>; Thu, 16 Mar 2023 10:09:17 -0400 (EDT)
Date: Thu, 16 Mar 2023 15:09:07 +0100
From: Luke Jones <luke@ljones.dev>
To: buildroot@uclibc.org
Message-Id: <7Z9MRR.G1RB4LA3WEYR3@ljones.dev>
In-Reply-To: <20230315085103.1671888-2-luke@ljones.dev>
References: <20230315085103.1671888-1-luke@ljones.dev>
 <20230315085103.1671888-2-luke@ljones.dev>
X-Mailer: geary/43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ljones.dev; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1678975758; x=1679062158; bh=MG
 CsP/7zYeXh44L07QpOG/HohD2rAyRuyNS86nkqxTg=; b=ejT65ms5FbjcEJCsKV
 qFpSwFrjFJtGPiSsAYOmRKiTxxY1Vs8JpMdvzZkuVmHFnzWJ9xRhzCv2Aay6McbA
 HgWWBOXf+yQYcd226BqRORscck8/S9nzfc2ozdpJIlQWceR9Y5j93a0NrGX5mtoZ
 b1Q0MaIl9Ci3OfIVJjHZvW+bO67mmGwVFbpjOkptJnMwQo9xaEJTS2N1C4RoD2QV
 bfq3L1UdzsJHgXhyNGQ1PtxovoBDXsN/DVuiHA2GRIaJk0klLmOasgL2d7Siago2
 rnK0Lk26tAxaj8bd5g+XL5TM03/WSqIl71bSAKHJ4UilmCpOYuwbcVvdqpAea6FS
 Y8RA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1678975758; x=1679062158; bh=MGCsP/7zYeXh4
 4L07QpOG/HohD2rAyRuyNS86nkqxTg=; b=dVeYbhmx+NC97NjJBqPOtHFVWjvL9
 lLIvzu7ppg9vPLb8Lrb+5N5pCf8inNxjNGZ2pBPZUuTMX85k6/qJI0SJk1O7pKWo
 xZVA2/gjq9Zjy0jq5jrSTbkcz5FBlIxkhH1PLGHu22WRGc2W1PBo3QQDkis8OaOX
 Ww/ewZtuI1J/SKM0l10ush2sXN4OoE317pjpIVqslIuja/4pNOU+qJdqK0ZbeMsv
 RGBw1FZ3/HkUEqyA4mdVTR14zUuIhZjPdC+wRwinemhBYWyLuFHmivpgwpGKj4Bi
 dnBBSf7MFLqBDkGPTm1wnhZHr4/Ig2lLRfkaobF0oodwDbBWqpIg761uQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ljones.dev header.i=@ljones.dev
 header.a=rsa-sha256 header.s=fm3 header.b=ejT65ms5; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=dVeYbhmx
Subject: Re: [Buildroot] [PATCH] package/sdl2: Add config for wayland,
 vivante, pulseaudio
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
Content-Type: multipart/mixed; boundary="===============4183523267969404035=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4183523267969404035==
Content-Type: multipart/alternative; boundary="=-f9cM+C65dbLwyHowHaae"

--=-f9cM+C65dbLwyHowHaae
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 15 2023 at 09:51:03 +0100, Luke D. Jones <luke@ljones.dev> 
wrote:
> --enable-video-vivante

I made a mistake with -+SDL2_DEPENDENCIES += libdrm_etnaviv, this 
should have been +SDL2_DEPENDENCIES += libdrm

I will submit a revised patch later


--=-f9cM+C65dbLwyHowHaae
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 15 2023 at 09:51:03 +0100, Luke D. Jones &lt;luke@ljones.dev&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">--enable-video-vivante</div></blockquote><div><br></div><div>I made a mistake with&nbsp;<span style="white-space: break-spaces;">-</span><span style="white-space: break-spaces;">+SDL2_DEPENDENCIES += libdrm_etnaviv</span><span style="white-space: break-spaces;">, this should have been </span><span style="white-space: break-spaces;">+SDL2_DEPENDENCIES += libdrm</span></div><div><span style="white-space: break-spaces;"><br></span></div><div><span style="white-space: break-spaces;">I will submit a revised patch later</span></div></div>
--=-f9cM+C65dbLwyHowHaae--


--===============4183523267969404035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4183523267969404035==--

