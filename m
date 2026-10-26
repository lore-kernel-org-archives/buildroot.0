Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF7606A323
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jcwl2rAK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90F14055A;
	Mon, 26 Oct 2026 18:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnEagPT5TBMK; Mon, 26 Oct 2026 18:29:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE35240563
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793039346;
	b=p9n/NYd/9fDvfZrnoZ3AJDP5O8iRlUcI7+JpawJeRqxt2ecG/IIJGIGKWGuxcmxJ3dNa
	 imbUC0CT3I39FEh2FVsiu2CmHgPQtKakxr8qmvA3I2jgoSEAoSx9/jJEt8vbKF6yrf5te
	 ns0UANqhKhe4AjFxLV6sce5lPE8I8jSPJ6aTC4RfibiF/gzPffoIIhvjcgaEM7lG0tWJW
	 mJ9IESnARgbO5AN+37LPsP7NKlOFu3FrRGRYwjzi46E2QXstmjLC/wbvaH8uBx5A/KxlZ
	 CkYEyUM2NgM5lOTlbQ50uSmyVqr2OeUxhdFiT8mtYXIm1xjkG9IR5NLLkUpA+Fqd3TQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793039346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Forwarded-Encrypted:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=FQfnuuuaipTLWHJeHNawS6LNW1I8nEXu7gQQKaOTDmI=;
	b=E/dh1ErQs3mBX0c3uS/E0F9xnULLW4LO+fFzdFTh0EBti30sGEuvIAB0dv2C4Ixw5igj
	 60X1x9LRx3mKwy30wUBt+ABqKr7Fat+JZJZ+GbaeORdAoXNVW1SFbVfIqMLCoMj1hy5Vw
	 yvvGDMoOEBW0g+niG3ofY7ZMP+Jzx7UZZvcEOEtAx/O+k3vrokJjnxrSpOgNLhMzsryV4
	 uPYXWX0Kjac4PuwOhSgXeIXJXfmcTqflqtatAxfNOn9+mEtoalTaJ37izNiwkfKyTSBvX
	 D9ZsUI70ln5YyABvPCEtPCnWSuSTUCE/hVTnbzYl/2OLqfWDfJumMiiEfOB0xvW8xSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793039346;
	bh=FQfnuuuaipTLWHJeHNawS6LNW1I8nEXu7gQQKaOTDmI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcwl2rAKdRDkC9TwfDU4laf7ak6yNJ2un4iLX/m1b0CvsfeGdlixxHS5ENk7Nwplr
	 UJdrQfg/L4a1BjGbIW4AssecK5YrRfZEeL0M8NFRqLgTX/t/unXHQwyyzjaq7PBrH7
	 JbJZcLPWPEi58w5+joLPTG9pFbxuKw2PUSqQvjLeSHeM6LtGPutc2bZOQ3K76LHT4S
	 MYanhcI7DMq6TDlK/KVviUtJJkbbZPaur1eN8NCPUs9ZWII+Ah6Uy5A3JK75Qrg8em
	 TDxPn14JfoLCbbLGPjL6GdBCBOte39NVLpRraxZ0ouhm1cg7kzIWTWoAhw0LMkqXcP
	 NNENFR21kp7GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE35240563;
	Mon, 26 Oct 2026 18:29:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B040935F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F494006F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8N8i3tuJpdF for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 18:29:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 973CF40062
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793039343;
 b=bWtLdN1czsmqmlG1m7q+p4WwE5boTKkG82LUWGVJqOyX4Xuxg7ewkdIJU4ednYYSuxpA
 a5uVn4MhCsUV+Ub7eoJ0PsMqMLwB4YLr5B0t/jFsaY8s1eamPT6W3UFdqMeG1CJWjXPx5
 hAK4/YxUcXdjcadkbSGHVhcOZSgIR42x00GSwAGI0/POPXg60UJJWWSS8VNdrTWoG4EAN
 oEPa2aH47sPjq01kAzQ5h4uw72xa2DtaoBwQevSD0nc6vDUNckPAdesXAPeJwE7NG02l2
 NJ19/H7wYLgD9jWLCvkvNYP2Qv983of0HX/CkK0KF9rAyjphbAJo6Dr+F/YTf4vgq4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793039343;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
 Subject:To:Cc:Content-Type;
 bh=HeqKxkFwe/RhLQHGkBSC6ZWr0JaWLUlIZYTqvw3FXo4=;
 b=OuurCyOpEDRXS6L8tFuNdzKVO2msmYk9SWP++unLqTq3XN5VbvYsDJkeqzCREOPG6PXn
 KUp7MEUncriDCxUGCf/qUgPl3Fpt7fCWaXFrCfv52AJujFhxP7bstn6JiXEKL5kK+Uhl5
 Xexzba3hHzrJLQQjVe9h6KV943zRtHIyBvstCqBIHmUncn68WFSF2xANz90+ngCRyqKzf
 isJOaS4xKGH2I9JC2Ezd4R0puBd1Qe9EPMScKlioJ5vHgUDTNUNebL6rFo2aKLzn9Xhfy
 EgXck5UjeythJre1JQybijjz/mcj9CQpPeYztfJcoyKN0DJslT4WBkDGPkFgcuoaPfA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.219.50
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.50;
 helo=mail-qv1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 973CF40062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:29:03 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-91c11468b5fso35591256d6.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793039342; x=1793644142;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HeqKxkFwe/RhLQHGkBSC6ZWr0JaWLUlIZYTqvw3FXo4=;
 b=wNiEFRzjwQE9JijCOBA3Z3dycckN3Pt64aow3B0dWEkWYB2ZC/JZSDEfD3CKUcEZsY
 yd6ML8EHeQEDytIu/80a+2Epxr2IiQKEOZPJLhKcDdizjaGLpmQdANZVEO+UeIPF9mMR
 myhDJc5n3jDQ5UQzGq2Ab28L/vj/MAbEK8igeKIgOMTmxHcta5E7vhU7KeM96yDaQsNU
 jgwr0CKjwb8FTe+utPNoim8j6ZMRWlUZ0C43hKpGTVPNzENKlRhGvOeLpZT9QpM//qK5
 igFvUOJ6W+ZIw1Nmw8WV8dLPzTnjEn8/wjNJs7526H3uAJEE+ealLOpQ59JgHiawIqpd
 waSw==
X-Forwarded-Encrypted: i=1;
 AKwUvByCYh5TIs4j1mikVrArx53fr3aEwSZhsPcX/4/CLeu1tsktp2rWUl+X1euBpTQDinnnTH6I1hC6NOw=@buildroot.org
X-Gm-Message-State: AFq9FYLGtRr+gaO46b/Al9TskXAZVCE2pQSqpv4iF5NV4Ap8fRr0ecWR
 NKKTwcHrPglLW37tS31Y/0wKJW0lD8royv14ZvIkJ2IvCtEEz2Vx5I5lojsnmj+O
X-Gm-Gg: AYBFou3skGT61GrU3A5J8rOx+HNwtni/+NBVoXOmzR86MDnlthZAs3nsAyhYaHoC2j8
 IhSjRg4r2OSXAc+DuLyZ/9KcpZsNlwTtoQEFk4nWywS6QUnO9Hx8WOagUDp/49bmh1XnOvJER6T
 9z/My3w1h9e8CNsxHY+dcU7+H6dgbHOLhkzKwkqpaZwsVD8uZuK8QEzdA8J47WFXKOmHGReo9uv
 NP1N3/+XnOFW6ajWfOrVX9gaAXhvKQ7gAGQWkN0tSYnTF517LCFDgfg6ZsZfgf8vPkyKPIf5PMw
 +GewzZJXgTOWjLn/JDxgFxXGakGpWC+uGC50L83bMDXpkS9BgStGMXUcB1WhVNRtBHe64oNuxZK
 +UOIYnxroycOriutcTboiM19nxVp8cMx90PwONVFGzJ0tNJ2P7aiChKAWKNXwHfRfqn6m2mkL6N
 pLMyBoj3eb9LjpHuuUkSQtNKIjQDD+jni3fs3gQhfof4e6SkydLuZj7/6XnECiIdaa1w1O56Ypt
 xtzbxySrl2QSi/qNjfjbrflOvELY8z7AhwyZHmFRq4z0Xzm9WAmvkmkoUjOALM8vThwm5jS85cK
 +mfGBcSIc21I1B6luk/8hlDpfV9NuJi3wOuzN0wJkFGs8694fGXvWFMNvDEPk9ZI8HgeFlabaA4
 KQV68v0roAThVXFIQCoAGSK8Fxz6PaYJ8Eg==
X-Received: by 2002:a05:6214:6104:b0:91c:64ec:3b7c with SMTP id
 6a1803df08f44-91c64ec6ed9mr37208356d6.54.1793039340856; 
 Mon, 26 Oct 2026 11:29:00 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com.
 [209.85.219.47]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c129b2sm79193356d6.20.2026.10.26.11.29.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 11:29:00 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-91c60e30054so11669456d6.1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:29:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxb3EVTQX/d52ZSK1Z1yUckZi7NnaCWfsLPKwhqZ3FI8OwNiWlmyKfSvWd66vKSiageapB4B5oJ5NM=@buildroot.org
X-Received: by 2002:a05:6214:5788:b0:917:a4b9:32ad with SMTP id
 6a1803df08f44-91c48e0cfbemr132864656d6.12.1793039340161; Mon, 26 Oct 2026
 11:29:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024164906.3150226-1-thomas@devoogdt.com>
 <87y0blhs7h.fsf@dell.be.48ers.dk>
In-Reply-To: <87y0blhs7h.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 26 Oct 2026 19:28:48 +0100
X-Gmail-Original-Message-ID: <CACXRmJjJShS7_o5+NQFWaztXZBMeOyvApEVF6zoG=zQ3eZycSA@mail.gmail.com>
X-Gm-Features: AclHuK-5niESztXyrShPnMh79LDUCVK7dq6BpUyojqpz4N0jUxFcm0Qe8RlI9-8
Message-ID: <CACXRmJjJShS7_o5+NQFWaztXZBMeOyvApEVF6zoG=zQ3eZycSA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, 
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH v1] package/msgpack-c: bump to version 7.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2559546876111983874=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2559546876111983874==
Content-Type: multipart/alternative; boundary="000000000000f05194065ec28087"

--000000000000f05194065ec28087
Content-Type: text/plain; charset="UTF-8"

Hi Peter,


After some searching, yes this is a security fix.

See https://github.com/msgpack/msgpack-c/issues/1181#issuecomment-5365155306


Kr,

Thomas Devoogdt

Op ma 26 okt 2026, 07:49 schreef Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > Release notes since 6.1.0:
>  > - 7.0.0: raise the minimum CMake version (3.5-4.0 policy range).
>  > - 7.0.1: set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR.
>  > - 7.0.2: fix integer overflow in msgpack_unpacker_expand_buffer().
>
> So does this mean that it is a security bump and should be backported to
> the LTS series?
>
> --
> Bye, Peter Korsgaard
>
>

--000000000000f05194065ec28087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Peter,<div dir=3D"auto"><br><div dir=3D"auto"><br></di=
v><div dir=3D"auto">After some searching, yes this is a security fix.=C2=A0=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">See=C2=A0<a href=3D"htt=
ps://github.com/msgpack/msgpack-c/issues/1181#issuecomment-5365155306">http=
s://github.com/msgpack/msgpack-c/issues/1181#issuecomment-5365155306</a></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Kr,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thomas Devoogdt=C2=
=A0</div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">Op ma 26 okt 2026, 07:49 schreef Peter=
 Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;=
Thomas&quot; =3D=3D Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.c=
om" target=3D"_blank" rel=3D"noreferrer">thomas@devoogdt.com</a>&gt; writes=
:<br>
<br>
=C2=A0&gt; Release notes since 6.1.0:<br>
=C2=A0&gt; - 7.0.0: raise the minimum CMake version (3.5-4.0 policy range).=
<br>
=C2=A0&gt; - 7.0.1: set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR.<br>
=C2=A0&gt; - 7.0.2: fix integer overflow in msgpack_unpacker_expand_buffer(=
).<br>
<br>
So does this mean that it is a security bump and should be backported to<br=
>
the LTS series?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
<br>
</blockquote></div>

--000000000000f05194065ec28087--

--===============2559546876111983874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2559546876111983874==--
