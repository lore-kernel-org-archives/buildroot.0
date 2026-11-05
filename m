Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EED606A32C
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=otsyF3no;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkeeHiQu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15BB981144;
	Thu,  5 Nov 2026 11:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8dmDs8LVntU; Thu,  5 Nov 2026 11:38:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31DFD80D02
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793878734;
	b=dKt3/TSj1ZbHEgk9tgOiF4qG1LTK17XfawTYczVgMBvKnh46hdGinMQrkfUwdBGIxxu2
	 1o/xkUuzWamvTi96PsUkRctKWj31Gv4DRJnHIydWNREFOVOXuYovqKnssheTu6ZIoB3Pt
	 ErLzMk++7lvZ7+RxOkRmYkFADYsq68slAgTVNRjmnuagJttiKXpmUGWKXKh8/9vY0Elo3
	 tKMeOARu5bOAL/TN152ZASnqvFAQhWdg34B9WsfVb/nZcKviDa2ozA+9H6skcBWIqAiu0
	 NZXzeIkH/oM6DevyqSESVS36Q+rnZJGO8lxSc8HM5tvYCY3KkVQArSc5r6thMy9lWhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793878734;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=XqD1xgEaaMq8oX0aJn5OZ+ROUNA+bKLoXU9VCAULzzA=;
	b=GVuO5xY0jtY6Ea9Ed8goBznyiRvHvVp6/tG/Y4aoBw7o856JNAtCmNwPNoMnHr1Awu+J
	 wUAeA+UlFTwKYZ29VxPXpwQ85pafBu20/uaZbtx+DZDukxHJZaDAH+BSyNIDXfdKkkLxK
	 m6+a/8JDVA592Yg2F6onT/xQPbOPKmB8Ntl18omyNNqF28aQnTphWGH4TYCqwPqkDr5Bv
	 7XsHxgUCP6PKbPL8Te+F0lfj6hwsR3EISbBkmMEoTEEINp/wHXPNaL4s9xC9ZucZ7IaQV
	 cZz7vE1Tmbr9+Fmhr7ACiNxbn1Et5RBuh0+h/2B70SGtVEhh9aZSCcHPxt8Sa4xGacw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkeeHiQu;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793878734;
	bh=XqD1xgEaaMq8oX0aJn5OZ+ROUNA+bKLoXU9VCAULzzA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otsyF3no7A5MVMPVzaxQJ6TixPfHqFHE66Y1zCd7GAbKRicwib4xIUSU/fPW6Uvav
	 L4vvY+XMay/ylrTSkJn/A7RoJFGWvID0hnHYy7gMAHEmsxqU9xc5pxBDWrMOVW7kFI
	 emUJ7cXnZSJ4mJL71Suon7+15ETWw8EwaFkRmmxUfo7V/RrMchRhz3ipaoIpnHL9o5
	 VKVyMGeheQGsgD5IT2GHJvCm2Kkn932tndeIs5SkMf2EbXzpfAS5Yi68h+M2w9/wVE
	 ie2O0Hh3aYbiv6/bEUMCyXFYZbv2yOQnZ7A+oRuH4Yesqo+q2LHBF0lUbTf1Ti+Nqg
	 SVzPk2d58D1kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31DFD80D02;
	Thu,  5 Nov 2026 11:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A01FF31F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88EE380D02
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxTVv5InHzIR for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 11:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8047D81135
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::22f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=LkeeHiQu
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8047D81135
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:38:50 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-567cb8f983bso164233b6e.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 03:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793878730; x=1794483530; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TffssACL3I9m3azzp/qK/OJulEZkTFXLP7zgdGGaVkE=;
 b=LkeeHiQuk8Mgo/N+wtMmS47zyxGxuTjQHwTQUBgqWt4BRt6LGyErlsOBlwrDVcUo0b
 UkaUhvXDIBm5I4NvkcPu2xQHwycnvQpM0qXLT1Z8T/g7a82afJ+8PhChna/EH/G6PBej
 Humu3by3iyXjFf+0lg7sP6crxe4YExrm7igJNBHCZx1Nt95Cp6aFkDNANpRUEz5u9QFO
 ZPzrRXgEpq/ZU3DXyACQL109zPbUcs/03KFE+x+hFRJyxmnJwSmu/8lPj90zYadGVVdS
 B33K/TTG1D71MRtK0Linz8oxPC984cvWjxXzIf1G8Dpk+D/Ma7918lJ7wSfZVFBWqvyQ
 tzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793878730; x=1794483530;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TffssACL3I9m3azzp/qK/OJulEZkTFXLP7zgdGGaVkE=;
 b=u3XVlm46rvVdLNsA9fhK4vtK4EWfcOoXvO0v5SiujoRqKvhgL8U79cWDMyh4cy0+xj
 9vY0htCkiEc0dY5lrRTbxMaMhzKYZFXNzdIptzOj0+g60+sN2p3gI9J0lEVViXhjdY38
 KkkZ0C05/BXLgfVVYK4Y5EYWxzUtJSGNgTgzEBZuUpmuJ1tZs0MbIqWbfvwDtZxIZLQI
 p7ow6cUXtO8j1AbSh6G5n1OuW77VUn79QUKyh+uisSFTV/cOKh3rDA7Hv9srimP85llt
 vmGZe6Hsl+bkbtvt7HCqekJC+qURPhA8OHcslNaD6Xs/UmGtgPCJaRvTcP27TScjB9J7
 1nUw==
X-Gm-Message-State: APuU4Z8WZTzbhkL+VF4XUpyLNoN18zt2q2VBWnZfTudbDAvu3aLk+UUV
 S5nqBTpCHPw5MORPxeEaAgAekpA5AjbAS7YuZ0J+wOncHKGxn4McHPl2AeXC5XCr9LAMPvmBvGt
 DcDJX3JrFIlM0oyI1KfjSI+fbfHA8Uymyew==
X-Gm-Gg: AYBFou2lZjRbJGds23OPdOOj9Ml5glPmzFPJ2+5CZRuJIpU74Y+GRgGPdWJEzN5i3rt
 pvsBZIHxv/YXrlvoKLBDVVvR7Et401JIL/57epmLiCV6deDGlY06oEjHKn8D+0yWnpXM1BtZMic
 wJxx6ao+SyeL3NCy4kxkpwiP9iOpKKfuE1CBAfMHd6YBnzkENlxF5sI4s15tf1llL0bBoWhAjXp
 Z8eEn+/6YY6+Jz4skqQ28o+ytELTwR36rPQFFLctwZL/ib//qWRtz7tjEVVKGyCsuNnERIbNsVD
 a3eMqPND/V0NXC0+R016AZ/VrDsltkCalt2G1hObkbgEPfUI0sQP4NS/qMJ/WWsrsRvGFS/OxQW
 BvXbott1+uVe5r5EO6op7r4V+CFitgxkWZmkd
X-Received: by 2002:a05:6808:15a4:b0:4d6:9153:295c with SMTP id
 5614622812f47-5640de3809bmr13578885b6e.45.1793878729934; Thu, 05 Nov 2026
 03:38:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
 <20261105102458.1795886-2-angelo.compagnucci@gmail.com>
 <auxbF07TUc6JFvPf@windsurf>
In-Reply-To: <auxbF07TUc6JFvPf@windsurf>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 5 Nov 2026 12:38:13 +0100
X-Gm-Features: AclHuK_OiWbfHdgOpTklcO5V00rMBNnAj84FO8TzN8equIu4D7ev_7f2rj3CU8g
Message-ID: <CA+TH9VkZeqdSR8x+yUCVc+z_AOkPoueBJa9emqN0TgfovYS5_Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH v2 2/3] website: add a showcase page
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4812856938866474578=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4812856938866474578==
Content-Type: multipart/alternative; boundary="00000000000077cc70065f85f0e4"

--00000000000077cc70065f85f0e4
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 5 nov 2026 alle ore 11:32 Thomas Petazzoni <
thomas.petazzoni@bootlin.com> ha scritto:

> Hello,
>
> On Thu, Nov 05, 2026 at 11:24:57AM +0100, Angelo Compagnucci wrote:
> > Add a page listing products and projects whose operating system is
> > built with Buildroot, each one with a link to a public source:
>
> Very good idea!
>
> > - well known products: Tesla, Home Assistant OS, Google Fiber and
> >   GoPro;
>
> And several of these quite old? At least Tesla is old, Google Fiber is
> old, I'm not sure about GoPro. Do we have more up-to-date examples?
>
> Perhaps we could ask on the mailing list?
>

Doing a reality check, I strongly doubt companies will give us any updated
information. At least here we have something to show.

I added the bottom invite to let us know for this reason. I think that it
is better to have something now and update meanwhile.

We could hope that looking at the page, someone would like to add new
products or projects.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--00000000000077cc70065f85f0e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio 5=
 nov 2026 alle ore 11:32 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.peta=
zzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Thu, Nov 05, 2026 at 11:24:57AM +0100, Angelo Compagnucci wrote:<br>
&gt; Add a page listing products and projects whose operating system is<br>
&gt; built with Buildroot, each one with a link to a public source:<br>
<br>
Very good idea!<br>
<br>
&gt; - well known products: Tesla, Home Assistant OS, Google Fiber and<br>
&gt;=C2=A0 =C2=A0GoPro;<br>
<br>
And several of these quite old? At least Tesla is old, Google Fiber is<br>
old, I&#39;m not sure about GoPro. Do we have more up-to-date examples?<br>
<br>
Perhaps we could ask on the mailing list?<br></blockquote><div><br></div><d=
iv>Doing a reality check, I strongly doubt companies will give us any updat=
ed information. At least here we have something to show.</div><div><br></di=
v><div>I added the bottom invite to let us know for this reason. I think th=
at it is better=C2=A0to have something now and update meanwhile.</div><div>=
<br></div><div>We could hope that looking at the page, someone would like t=
o add new products or projects.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>

--00000000000077cc70065f85f0e4--

--===============4812856938866474578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4812856938866474578==--
