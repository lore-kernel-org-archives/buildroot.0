Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F878606FAC1
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JcXT0cRo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcCUwRih
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475934084E;
	Wed,  4 Nov 2026 20:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcHB2aW1dGQ7; Wed,  4 Nov 2026 20:04:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4FAE740886
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793822698;
	b=agPT5NQ81dZDGGfsj6bxSX8csFDUobaL++XHA0/fnGspKxScC2ebfeju6YWv7MqW/tHR
	 g+5Xh8otKyr6aiSTkKluk9Vrm3PzZcKdEaOMm+b0UvvZ/sr0XhThty5jwu80zmjW47rcI
	 EsbzPS/DCL+7zW0Reh7Z8hnodLc4Zei2w+I8mcS0sahTSU9T1I3NhXcp5bQVAw3NAZkmP
	 pVyy6nRXFMWVvslhbooPnr9PErSZJfuMXXmQ/bLRsvxHn8laANZqA7pPGJgXfXToyPEEL
	 KC0nuE22y62dwtxnjzPdKdjIZJBujwhwKekaWpfwE89ncSU4Rgpym27bU8ev0VKeJXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793822698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=L9h8CCe0d+lxPvyycIT+H7QLJHLc8ud49u+DFlWEQmo=;
	b=sD1Sdx97bYjvgnAbHMzDPiPzFW9buvyqwn/8TWHtizXmm1CMa9kfqB/00IrID/PV0cHD
	 NPdRcxSGBHrflMahFoZtBWK6NS/GxHnt8AkzQDY9nR6UqLR5B4cmVA4t4CBHr/ZhxbJ6a
	 dS1ee7S5Tf8CIH16oMI5xvAvg8pzX9Xdc+xSElG8I9ayKaP9eg/e0MRLE+FM/gw1X2B6m
	 dRHeeEDlbVW5if2z0cpHy8kZe0QPnq5MpMOc3B1GuMlBU8TpBkPtRVrWC8IuBNrepRe+1
	 OFv+Pz9mMeSXtBjpatvGb3AMc4FJmvffno727twOlJUthyIHJWkNiczYqH+NF5zC+Hg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793822698;
	bh=L9h8CCe0d+lxPvyycIT+H7QLJHLc8ud49u+DFlWEQmo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JcXT0cRoqrgcq1jhTdcQUO7jTZXDeFAwk6VFVMN+L64lhmvEbmlWcTd8oZwVEEvd/
	 sPC591a1Oocq8jiKeWf8USek8PUwlbRcFAsXIIf76NofK1U5wCI9KHh9cC99yaRRlS
	 VJxzbEpkgpL0wOiGcbhm+7oXxjBvW/Pa9ols241STeJvEJdcBiagv8ozib4sDvay7e
	 sRj15tEDh8y0cd3f/OMBpxcNUahUVvpLyeN8XbypDMXgbpErO7ViTJ8AhDThd+Lk5z
	 YUc9l1gk4PwuieEOzlHt8XX2SsZdvFmvoxK5RU5UFeO6rX3nqGYPDdR/xKSHqzxu/S
	 JvYpIrXObuCng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAE740886;
	Wed,  4 Nov 2026 20:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64D381779
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4298840083
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPGJ-JqJ0ptD for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:04:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4B1F240062
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=WcCUwRih
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B1F240062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:04:54 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4b28d7c729fso747271b6e.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 12:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793822694; x=1794427494; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wEXwjhqRpkKmF9lBFqVrRoQ89sn/GHvylU047PDfkZ8=;
 b=WcCUwRih7JhppovGrfA/cG87e+DoXocw0xnwjoEi2NL+mPU7jM3kbU5vGuoeUgC70S
 zFkDg6oa3wbS/6T+ep28VjLUK2inQOhO2iVFT/DpL4yR+DU7mcfo3/WOJ0lKX73x3Fav
 8SDkJ3AGe7whUKS9q0wMzZnWDv1Poc+EkcNtjLJpwYGNq2K8ZG2S0nk+leGKdK0rbsXw
 IK07tCocWJ2rG0nDQvvqq3LL9baEEKFxqO9kvOlwxNxga5aOkzpSfYBiVk8zk553k9dv
 fIkW4Z1cgGX2rbcrHZ2OoEGKQNrkqTnOPYJ7xwDsQo7JHyJebZZrnsKWyQ30A/CZQP2M
 +RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793822694; x=1794427494;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wEXwjhqRpkKmF9lBFqVrRoQ89sn/GHvylU047PDfkZ8=;
 b=njuE//AhglM0jlKL0iVUF0F+tZ4ZxkpPeB4sJpIthIkQLPxn4HjsdohMUApJiejIgc
 ujiCuJvPl3yNzuOw2HfsPaXtmcxCRzBw8gNjJ7GKzYlUR/jZXSJjyHgoOlnzesxEML+g
 y4nVimry9z7xm7xd52gAdB+xZtEp5ciJYbhdFCEk7b7lNOcOVgOtOqtwLM/MKGi5dUAP
 NG1Ouac7BQOvhVMxas4JFBVYvfTjcpL8JfDpti0N2ztywv4WF/tBEBbYwMkvy1N36G98
 Sh29qTFncRt22K7ZLGE95iLZetIPMLKF9ilZBP526oIUDVbj8rQdrADtyqBOtvodLCvP
 uPTA==
X-Gm-Message-State: APuU4Z/aeJ10OvfYqO0vvJrGq8r/c5JE6SKGAyx9FJK77Hgvg2pWoFsi
 5v3dVbRlyHIC6lvI/BRtWhXhM6Fj3iX8WuGzdQuEnf/X5DDvTHfV9bz519mc66t7L15PjArmNZS
 fF21ResR3ZVEtabMvv/+Ga532AvR17f8+IQ==
X-Gm-Gg: AYBFou21HeKzwQPh8kE/J0nJbw7VXoij59gjEiuHUygi/JAJ/Uj/h/JOEhqY7eIepPt
 SFR5/1Vp4wfpHXd/e8wS+/STuq6riMDpPFYgqujKP877sjPU5WHO5Q9RH2DfHjaETK1x5Nv+yQJ
 I1w6eBrMGAWLEQU5JJHn1yxUPiDkRoTHIZUlk8bH4p0NyEWxWVSU2L1EcPgHTGPxNkZgWOUBaze
 iBiaDqclSWp3cHfaW3k7DTme7AkPhs/pQaiN6RG4oJzGbkF330urpgjel0AJOv9YcxeneVkEGkt
 ByEMtT9H6xF1br4yAYbmFCqG5F5jR56Bq8PCQ2fKL5PCFc4IZ3FBi3mOheOYZmLnVH6MsXuiRuV
 i1pGzZ9AZ1QJ9U4MQTaMXXAWMiRrnRvzGOYH1EooOpVNzD5D8b31o43LT2g==
X-Received: by 2002:a05:6808:1583:b0:55c:537:b42d with SMTP id
 5614622812f47-5640ddb8aa3mr12725430b6e.32.1793822693815; Wed, 04 Nov 2026
 12:04:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
 <auuOCbZkwELEQBXg@windsurf>
In-Reply-To: <auuOCbZkwELEQBXg@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 4 Nov 2026 21:04:41 +0100
X-Gm-Features: AclHuK_a_CfR7B3IsxA0mJjygmer3XPw8viPmSSmKYW7mQnuyY0-b83DSIUTiYI
Message-ID: <CA+TH9VnR7qeGo_NibuXt-gNBwoX4TjxS9npzu6wfcLBxn1Mejg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/9] website/lts: align page style with the
 rest of the website
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3397148840451872228=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3397148840451872228==
Content-Type: multipart/alternative; boundary="000000000000747a5c065f78e4fc"

--000000000000747a5c065f78e4fc
Content-Type: text/plain; charset="UTF-8"

Il mer 4 nov 2026, 20:57 Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha
scritto:

> On Thu, Oct 29, 2026 at 03:43:52PM +0100, Angelo Compagnucci wrote:
> > The LTS page used its own visual style (pixel and serif fonts, grid
> > backgrounds, offset shadows) which looked out of place compared to the
> > other pages of the website.
> >
> > Rework it to use the website style:
> > - use the #headerwrap blue header from the main page, keeping a big
> >   title
> > - use Bootstrap primary panels for the sections, as done in the
> >   support and sponsors pages
> > - replace the big numbers with round badges and use the website
> >   fonts for the item titles
> > - use the website blue, font and panel shadow in the charts, widen
> >   the labels column of the weekly chart and allow the charts to
> >   scroll horizontally on small screens instead of overlapping
> > - add a contact button to the sponsor section
> >
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Thanks a lot, entire series applied! It's really to see those
> improvements to the website, much appreciated!
>

Thanks for applying!

I just noticed a couple of nitpicks and I'm going to send some other
changes soon!


> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000747a5c065f78e4fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 4 nov 2026, 20:57 Thomas =
Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazz=
oni@bootlin.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Thu, Oct 29, 2026 at 03:43:52PM +0100, Angelo Compagnucci wrote:<br>
&gt; The LTS page used its own visual style (pixel and serif fonts, grid<br=
>
&gt; backgrounds, offset shadows) which looked out of place compared to the=
<br>
&gt; other pages of the website.<br>
&gt; <br>
&gt; Rework it to use the website style:<br>
&gt; - use the #headerwrap blue header from the main page, keeping a big<br=
>
&gt;=C2=A0 =C2=A0title<br>
&gt; - use Bootstrap primary panels for the sections, as done in the<br>
&gt;=C2=A0 =C2=A0support and sponsors pages<br>
&gt; - replace the big numbers with round badges and use the website<br>
&gt;=C2=A0 =C2=A0fonts for the item titles<br>
&gt; - use the website blue, font and panel shadow in the charts, widen<br>
&gt;=C2=A0 =C2=A0the labels column of the weekly chart and allow the charts=
 to<br>
&gt;=C2=A0 =C2=A0scroll horizontally on small screens instead of overlappin=
g<br>
&gt; - add a contact button to the sponsor section<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagn=
ucci@gmail.com" target=3D"_blank" rel=3D"noreferrer">angelo.compagnucci@gma=
il.com</a>&gt;<br>
<br>
Thanks a lot, entire series applied! It&#39;s really to see those<br>
improvements to the website, much appreciated!<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for applying!</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I just noticed a couple of nitpi=
cks and I&#39;m going to send some other changes soon!</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_contai=
ner"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas Petazzoni<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000747a5c065f78e4fc--

--===============3397148840451872228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3397148840451872228==--
