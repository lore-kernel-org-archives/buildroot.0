Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4D606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pqqvB0Mg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuOULGW3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E6140802;
	Thu,  5 Nov 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-HMk1zGqNMT; Thu,  5 Nov 2026 21:04:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA144408D7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793912640;
	b=gsosifPFwW1F8t6vErKb6JbuBypcLwc0hO/yRYBSLz0oia7UCxrD7a6fxr0gTj73uLVJ
	 r2POytnxBnPj1FysXvgFKg/2SzJ7o0Sr7VzV1HdYvi412rZU+nUnN2YxddvyuZ6cJ7ht1
	 dLAwNouZSj9pdUteOFrR4Hvjr+rSYzllEaB787WgUa2+f2WIJfg/4skFOCV57DHpYd8+R
	 Rv/KkG0mLHC3fzVQtGNjLEhOm/2A6x97l9xV1lfx235p/vLe/FtDna9WySFVIjhKowfN6
	 w1rS9FeVyQz62Gm1DlwUYoonf0qtHNFNH2XUiv4+EyXhNDqUxPgBtioPyTPQPwMDP0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793912640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=OjbtmU53KTUq77D6sDryIXslQDGUfVGtuep0xHjT2hY=;
	b=eGQtPoXWOqLldS51VleolLZfz6UKBzR0e6++5/7CmHEbWnqAsAG9gEkvpZfXz6FpLMeI
	 VKKJq1wtPS1V/xf4Coo4alNO4j0+Ywj0QVT+bPVsDgoFxzxCr6RZzrkagTZZeWZu5Oohm
	 vwrqlPMffkDU/+WNyq0VA0cQB9GTbLRm+b2sgpzJEqQIo1FWJa79Vk4rYBrOi7pG8E216
	 Ntnaf+UVhC73O6k29nHeeCi4LZef40+W+WPxqWwAt3QvkbM/BMI080ZSRhw4hEpypIOG3
	 79z3aTF5sZ3j5DtvzCGD+SC1J1dwjxmyRZw6lCmxTXMWeml3TtBYYSqfsIumVYyON4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793912640;
	bh=OjbtmU53KTUq77D6sDryIXslQDGUfVGtuep0xHjT2hY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pqqvB0MgVJvB6uq4iCJeFL1RpY+FQS5xQqSQ1GXQLl2gYaEv5mWAM1nYApEj+UxOP
	 uEH5qaHgE4EUs8o0iBspRNJWqUsJFJ4J8Vl7X7KqLMU9uuWFTZThagzzl55/kpdR5A
	 szWiy4W94HCGpH+roOcOAFylAIwrjYxvG7Mn+Pk7atcFnrB9xJXbZ0lMlG37mssnSE
	 JbVgjpbfuwZcBGNJQiWAt22KzofW/onJi0z6PH5olHG8F5VYLO8TOMG0RZ4SGOvSrA
	 WtZPob7JZDJaYbk+tGnjHas9XgQQ7LFbOgpNOXa6vRkQ0hHI/zkcC7Hq9LYvMypsVm
	 7O/3Oxhd47ktQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA144408D7;
	Thu,  5 Nov 2026 21:04:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE2FF07
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33D7E60833
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCvHWX6Fv1PD for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:03:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECB2F607F7
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::236"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=iuOULGW3
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECB2F607F7
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:03:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-3ab27e45e7cso17132861fa.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 13:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793912635; x=1794517435; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8M5dF7hFLtQMHQ++TNX5BtEsp7UnkaBFfPsQNHJenWA=;
 b=iuOULGW3WOs0zdLvtyvwz9MeTstcd6CQF8S62Ei7PjMtJOSOhIT0K25nhdO1kfujAV
 6cqeNhK6GOu3yB2DxkWTX0W0tv6NuozDKN4fkhMxrxom3Wzjgm28a4Yv7zCeBgy3dXTm
 cG03OZ9DtHIFXnUPCfzsWDxGYhgrR6kzAZE20/aTPXYg2E6U0uVMymOqzpt88HVWgYyZ
 j1ORf8rNWNNLwL/DyWmdRtJj2r0ndQD13GNBug/2tKzrkaNhzXmQ8NOJkzKvF9xvUGa+
 TP4iR2ITrexMx8iCvfVz6gIPDVwK1uU6/4snINhTHky7KVjnsXukR6d1RG1i1adwtSDA
 p1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793912635; x=1794517435;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8M5dF7hFLtQMHQ++TNX5BtEsp7UnkaBFfPsQNHJenWA=;
 b=VKppu/p6mNSajtR/N7kR9ixyYB36bfVPBXwBdWqNAYMnAcdvZWSGV0j0Nxltx466Uq
 mbaiEo43lKnCtK7W6DWysuCRKzCfsPHRxY0CKCdrpdCPr/FcizycZ5ttgm1MkOuzNOpt
 9QVO6WLTw37qrUiF6d5OOBUlOhgRxnCcnQYZmIzsvhiaYM9Gvsk/bPXJW8zmuslZAo5P
 iNi1ss/mQ8kTPV9sQ3oASD+NGM+WH/LdXvzaLsWJW/jqAXeTARfhe+9RvabSyd+d1v26
 LWNZ/Y/kIP64KYaHt+32LYJzs6lGafUO363VSxq2us8B0dthqwBU561aSF7vSkTJy6Ip
 UNCg==
X-Gm-Message-State: APuU4Z8yWLQY8UY4M8cX5oDeAecOP9+0XWrwLhC9+Ictcpt+oHuNczaZ
 qP+4++mi1nHo6daMkpnq+bN00ToZSGgZEi0fmARjHeoTJjhdBZ4tJjqAIty4JyGLrcQPporl6mf
 V6l0DhH3IlE2ApDF0uVV1p1ZGOFBq6B8=
X-Gm-Gg: AYBFou1AET550gKsJBo1smzQ8yUaGqP+c1l6a0nzOIVMiORnnmwjafT9rqh5Y2chRbn
 IY5Xg+41d9SPnRaiUoKRMAWycFb6TDhc6ghfXSI8ZXrKms3FWRdd753+QaMvqKpJvkbjujVWpGs
 ytQUrJs3yh88Rt2E2ztOSkH2mIH975HwSCsTCQhPF7xz3H7ytJ1BlBM1EfWEVru06fXGKizLIZo
 PfwlFUBwkENpdsf9mO0V/BV3VAqMiNp5widuDtUgEtr562zeasVjMM5HuIb6Bbr5VUc/dbjvY3W
 Yf9FgOjlLS6C5f/tBE5v6zegajuoF9CnFUWu4Nj91SR/93oa3fUK5b2dwjnBK4X9I0gLKM4oKv6
 zgtDHQ/NVmSWJpYmH5z9IVTKXBmJv+JypqbDM+FklNVKo8ZhCc/lWTNztNe+Txp3fbwxzfI3NH2
 mXOA4GkBFaPfu0y58ViabpgodP
X-Received: by 2002:a2e:bd14:0:b0:3ac:c6e7:f5f with SMTP id
 38308e7fff4ca-3acf3b3071amr872781fa.14.1793912634861; Thu, 05 Nov 2026
 13:03:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <auIW8EW-9Qo0NFXv@skbuf>
 <auyijJkgbV87YT38@leo-ThinkPad-P16s-Gen-4-AMD>
 <auzuNoPUXTFUidwJ@skbuf>
In-Reply-To: <auzuNoPUXTFUidwJ@skbuf>
From: =?UTF-8?B?TMOpbyBERU5JRVVM?= <leo.denieul.yoshino@gmail.com>
Date: Thu, 5 Nov 2026 22:03:43 +0100
X-Gm-Features: AclHuK9vOo0_4T2ASlkwoKHe7udgEEC2vL-BUWkB-wA8TkCMx-JsKoPy4HsxBn0
Message-ID: <CANMZqkfDKZv6n9FFKSf_XxSHk1pfTm8EM+f6EACb6SncVjH-BA@mail.gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>
Subject: Re: [Buildroot] [PATCH v8 1/2] board/lx2160ardb: new platform
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3057926969823704587=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3057926969823704587==
Content-Type: multipart/alternative; boundary="0000000000005bee68065f8dd560"

--0000000000005bee68065f8dd560
Content-Type: text/plain; charset="UTF-8"

Thank you, I've written to Thomas that there was an error

On Thu 5 Nov 2026 at 22:00, Vladimir Oltean <olteanv@gmail.com> wrote:

> On Thu, Nov 05, 2026 at 04:36:44PM +0100, Vladimir Oltean wrote:
> > Add Buildroot support for the NXP LX2160A-RDB (reference design board).
> > This is configured here to boot from the SD card. To my surprise, NXP
> > RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
> > boot, so until one is available, include the RCW through board files.
> >
> > The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
> > Management Complex firmware is loaded from the filesystem during U-Boot
> > board init. EFI boot support is disabled since we use extlinux.
> >
> > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> > Reviewed-by: Vincent Jardin <vjardin@free.fr>
> > Tested-by: Maxime Leroy <maxime@leroys.fr>
> > Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> > Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> > Tested-by: Vladimir Oltean <olteanv@gmail.com>
> > Signed-off-by: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
> > ---
>
> Please fix your email client, it is still sending emails as "From:
> Vladimir Oltean <leo.denieul.yoshino@gmail.com>".
>

--0000000000005bee68065f8dd560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you, I&#39;ve written to Thomas that there was an e=
rror</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu 5 Nov 2026 at 22:00, Vladimir Oltean =
&lt;<a href=3D"mailto:olteanv@gmail.com">olteanv@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Nov 05, 2=
026 at 04:36:44PM +0100, Vladimir Oltean wrote:<br>
&gt; Add Buildroot support for the NXP LX2160A-RDB (reference design board)=
.<br>
&gt; This is configured here to boot from the SD card. To my surprise, NXP<=
br>
&gt; RCWs for LX2160A rev2 silicon don&#39;t have a pre-existing example fo=
r SD<br>
&gt; boot, so until one is available, include the RCW through board files.<=
br>
&gt; <br>
&gt; The boot uses U-Boot&#39;s bootstd framework with extlinux.conf. The D=
PAA2<br>
&gt; Management Complex firmware is loaded from the filesystem during U-Boo=
t<br>
&gt; board init. EFI boot support is disabled since we use extlinux.<br>
&gt; <br>
&gt; Signed-off-by: Vladimir Oltean &lt;<a href=3D"mailto:olteanv@gmail.com=
" target=3D"_blank">olteanv@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Vincent Jardin &lt;<a href=3D"mailto:vjardin@free.fr" tar=
get=3D"_blank">vjardin@free.fr</a>&gt;<br>
&gt; Tested-by: Maxime Leroy &lt;<a href=3D"mailto:maxime@leroys.fr" target=
=3D"_blank">maxime@leroys.fr</a>&gt;<br>
&gt; Signed-off-by: Maxime Leroy &lt;<a href=3D"mailto:maxime@leroys.fr" ta=
rget=3D"_blank">maxime@leroys.fr</a>&gt;<br>
&gt; Reviewed-by: Vladimir Oltean &lt;<a href=3D"mailto:olteanv@gmail.com" =
target=3D"_blank">olteanv@gmail.com</a>&gt;<br>
&gt; Tested-by: Vladimir Oltean &lt;<a href=3D"mailto:olteanv@gmail.com" ta=
rget=3D"_blank">olteanv@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Leo DENIEUL &lt;<a href=3D"mailto:leo.denieul.yoshino@g=
mail.com" target=3D"_blank">leo.denieul.yoshino@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Please fix your email client, it is still sending emails as &quot;From:<br>
Vladimir Oltean &lt;<a href=3D"mailto:leo.denieul.yoshino@gmail.com" target=
=3D"_blank">leo.denieul.yoshino@gmail.com</a>&gt;&quot;.<br>
</blockquote></div></div>

--0000000000005bee68065f8dd560--

--===============3057926969823704587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3057926969823704587==--
