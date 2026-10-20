Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6243A606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CSRi/7Ku;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pu8FnR4M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9BD60758;
	Tue, 20 Oct 2026 18:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7KfyB6R0oXU; Tue, 20 Oct 2026 18:03:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 053AB6075D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792519404;
	b=HKZan58jLGma4K90csUoq60RCpDosC8CGKt1TJ0Dz9haAy8eZ8lfWhlbm2Kz0MkuY4wS
	 cABHCDTxZ6g0+FV7G8D1qOAI4hpAXAMLeu90WnEg8ni00Rd3Ifg49TRPuV9wOurQSEGYJ
	 2mQ60zRxsUsF8DmXeTjWHKJEBv+tLiK5f5mtSOTLkUgFXsT/HssdPDe4XmJy1kWSjHtY9
	 h7hNDtrzTz7dCScEkI8m7vaKCmwjpRMJTvXQjgjdEk804xmYxxLL+yEnRuGRF8wW5HHUl
	 oRqbCxdDp+kNomKnyCwyeInRJB4X4Cbrb3Lcae/cjvKMddAvNDWoP2qDmLfmIduXtRA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792519404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Errors-To:Sender;
	bh=gUsePKleQ0y0IPxOFPWJhkwVlelOn2SCib2+zDm40ME=;
	b=NQAXbdw82ovAVLHI6ND1YWowrFHuSBCWBtXlYQSIRELiheQboZCFCfGBuBUTmKP7CYAp
	 rq4MmucwFfTq/55q3vJpOGOKG/yJd926oznKdplNHBcIe+S7keglLa456tmKXeYJlHrIe
	 ypnFCMX3q/8Xm3rk5pugO0mOGTIHmE3zX8z46vA86idDVK/47LAHq2TFtK/KZJVSCy1B/
	 M5UGhFJXezOqas11t3Y3doJteGzaP78Dj5LxEnwcf9Hlw+O7qS+OOsNNHUpHq4GUlEnma
	 VsimGpuKTJodBvS9x19HEcmHD/ysfLFaXBzVXTCb1XBtjcjjrHyJU2At2//r60FKqUg==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792519404;
	bh=gUsePKleQ0y0IPxOFPWJhkwVlelOn2SCib2+zDm40ME=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CSRi/7KuqQspZEoNRLBn0kWQv3ySi2vnqHok+zsQGRIxev/HOxc5RnRsoRZ6EQxOK
	 mNFcp5LqIXX+GV37PuSdz/vXXAVK+LKL6U9/tLTOjCs4exlmeg+OFi8nzgGb0uDhzS
	 u30we45r0ZIs5tO7LuPf9VXEHoEnCkQD2zSwiuchfM8GYh/IjAf8IaacEmGOEacFQo
	 fWSadlH7iGkZgnydvMHZRw/fu/kkwCiE2fYXRgOeQpX4u2PAtIX7SPVkFTdAAkBZ0E
	 Dd0QvciuaZij/uEO+SoCAerNpMojDXJJotvIlxbgKo/nAoUOE3MqZEX5yKwFJU+kxc
	 wGtOzeQhVompA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053AB6075D;
	Tue, 20 Oct 2026 18:03:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8FF92E0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EF138109A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-tSqriG4dLV for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84F7981068
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::e2c"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792519401;
 b=C7QkdCK4ic4L9AnMKuorlJpY1G6FST1JsZ5q5Fy1PnhK819rmjD9ElbugTbkxSYejXUf
 Vk2h87dlWgLTLQq6GkXIdrziedP1BfSuZdEeh/3XlMH1rJS7bFj12rR/ZIRhZBL2NvY50
 A9GFijhVFU8ZFwgXjPgoj9rPS2Bf8p7JO9aSV2pvqv+hmOzY5mTCVtbbjCZ2hS7gPtEvE
 WLgDpr0bbryKd42UdbbvpFbX5N+paIA0jxZCjTDQI5ohCox7oOVhnh3rdI7UqNRzI92Mc
 sK3J+/ymDgQ29Fh7ABKKFbWlvrw7kd0i4W6QWgAOA7lD6ja2EJl2A07gzcOtBPZ8Peg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792519401;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=3NDtx/dvDoyvGLKXd87ZjkPd+vNd+o5eF4Glf+qVSDw=;
 b=UpJA0pDR5C4mFchhyadNLhwBuMw7iFR6wCOAxoaBn9sF52AzF9F8eZv+YOrC/xof+cxS
 cPy8r4dEWj8r1yhR8koKbFGxNodopNrEQIvgiOMIUH88Z0Ct7Goz8M5qHGxl1ZWb8V4of
 3OqJJZfBADUmTHzA2Sx5dJXP5bCg/C4w/sLhj5P39HJ/Glvw3pIGipEd4I9FrEss7R6TY
 ME+iQV9Xucw1Hpm1H4wBVE+/Dn7pO3lFYrLCOLspbdG+AMM74SGQKtXxcc1XeZbsBorrI
 NkQ0n3EDftrDqewKpbcmIdmPfb61O/sZWMXkUTABA2c7z4+MrhSoLHWHQpwHylaNQLQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Pu8FnR4M; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::e2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Pu8FnR4M
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84F7981068
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:03:20 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-7c03744ef27so1037041137.1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 11:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519400; cv=none;
 d=google.com; s=arc-20260327;
 b=EIlyTr0OtiaXYrCESs74GO3uI+DuIjUZR58kvoB6/m6b71AZTp2+j6RAXfIMH23DQM
 8DGh/QKU9YNFj/byJE9/V3CFaHiuhSCTe4kuWgaDXxnWzECSIaQdvoWQDOvsmCF4Ua2a
 xzyby67mtEsUlb35VQ0DIPMqQUyNKxvfDyjLZC6OfoXgcrQcDvsImxl3tRwvoxH3BF3j
 k9/GpBMkn39HgHDUQs6DUsXbw444B8CBKIsctCoWlHxNNwC9zSKzJTmvlzstU8Ng/Q59
 P77hgi4fpZRC5W7qkSdjqgymzsf3FYPtATzEmaQBW+F+jpaN2mN9r4zau/7d/9YcJfP2
 pLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3NDtx/dvDoyvGLKXd87ZjkPd+vNd+o5eF4Glf+qVSDw=;
 fh=HhdFtkJvh5DlaAiyVoq2e2d/VSrwTIJbNRYt1AsKpJY=;
 b=W6nktw/gT9c7i0Sy+JOvXqJez9YW0j1mK7lQ+yz6EbgDfSRW242eyix2A8Z3LoOEg1
 1jLlY8Okce+YVwc4+2N7AaP0yM19DNzLf7QyUt/1oZvnROl9hyfZrUiLMYASl97OeALO
 i3rA48OSRc8z2+1X1GG3nWvawxS3FzBg+iPoK+YSdk/W9BDXbKN79vfI4bLiSIlBoaFo
 2+nnDt7PbFntcxj0r1SmJOLfDRu04kjkNoZhqeDzzvO/Ywvo+5GdDYM18RzuxBbWTPXT
 Ru5ogptfxj2yVFhpZUGmeTfwwfUSImyo2LRpTHbdpUvzJdT0WFtW2mbpzNcIsDdjTDKo
 iBXw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792519400; x=1793124200; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3NDtx/dvDoyvGLKXd87ZjkPd+vNd+o5eF4Glf+qVSDw=;
 b=Pu8FnR4M+Zn3hl6MPuzWT+BSi67sRyCqEX1d94eOrUSVNZy2Xzwuto1A868LRQK5Hr
 QYApKIdt5h+lVms2I/aRn9KdtgDNZUp4iwamcBnohAhj4zITaveZDwf1TlYkHUWNrd3+
 mIgS/m7Svuo/uXtMxhJ6+zbP2+cavxushp2q7taksTX/ANQnRKYv1aU8p+9LLlq2kq0K
 OQlFNXpppxYLB0+Ulwzlt9vWYjJWiDm9hXzh1V+cA+bfID8G5OhdWRh2UkFaIQfz/tvK
 Tg4ea6wTC8gUNimyxL5Cbydphhle4UYfWjUYnyltGJ3B6oeon5w5aTLlMX/1Bh9H0Qkc
 DmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792519400; x=1793124200;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3NDtx/dvDoyvGLKXd87ZjkPd+vNd+o5eF4Glf+qVSDw=;
 b=I2c8jrqHLNk/TfpHCMHXtLEh2GPsx/ZdAS6h/NQDgdz5UlFsCI1ixoUDY927OHvAjk
 Yf+A42t1qREUAFIsLT3xzs7a8gGQPyp/axeVGmZkyqoTuxJBt+ij+6+iDCbuZByK4fLh
 PbrOydWS7NDHayJ1fnK7vQQ6n/9Lj87lMfOcJviIfsXQIXTgQnRg8HWYWHwONJSVhhBh
 nn/t/p5hQwZNkV/SGrd3VkayXweRljoniu28sVjcS42NKkcUSlEAXwdqvcbi3BhEaYIk
 Qzl4CS7GFhYCcTQGbr9EJu+qsliQurk+rnGRXJ5cqe0GThlk3XrlBmBNmI3SRVzVAx73
 PV+w==
X-Gm-Message-State: AFq9FYIQzRo77x96heW5SehOSJ6dngEugIZO/7pthmd11k3KbJFLI4uX
 i/JAkr5b7wefVcFxC1hwr36Fg9JjTRlKorh+O62ZfUTzVGxeSvcHp3lPMqCfajw32hRRJhNSviI
 avohTZ3j9+CcwntgyrNhWYlprDU2jcifE8XKC
X-Gm-Gg: AYBFou19gJc9sFYhv0HmLaara/3wA7e1d5WjZo49QUe0vpsZqaCsiWyXAgIA7JQHrGI
 3TXKvQnL3pKCY2lJV2Ht1jlZE5tnjTqWmYZ+sU1FSt+C+DlP6N9KUgrKPgQj172NjmWpg1XanT8
 Pyb3tjn3VIjUUkQJm6i12Y6KUFmhwrHWN3JnOXnH5jqQQOrwCPqepHOtyO6rZPAAnNzX2j8TOod
 OTwtsfBtCCUdB1FXPr3HI1Aq3z66AVb1hlywqZNr0zfA4J2+r1NNfW0GOpoqkOKgPdKQPyn7Hqh
 DFnsPMM3aSQuIccpJzUt+++M+n94xJi/craRsRTxQpyAQCoGhtbZMRC9oS2dRpdCIOsonhKS/Q3
 rp9Cpn6PSyoUePtMx+esfZD5YUUHn
X-Received: by 2002:a05:6102:5127:b0:7c0:1d48:b2a2 with SMTP id
 ada2fe7eead31-7cc36aed490mr2517043137.31.1792519399555; Tue, 20 Oct 2026
 11:03:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
 <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
 <87tsmg8gqi.fsf@dell.be.48ers.dk>
In-Reply-To: <87tsmg8gqi.fsf@dell.be.48ers.dk>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Tue, 20 Oct 2026 20:03:08 +0200
X-Gm-Features: AclHuK90bL6PyrQh4eDEY-DsEmE5c5zOSO2AtWMv3rS--PAiO6t9-GhehPL-oYM
Message-ID: <CAMTop89Wn3jhjVqGwGjkWd_7qWLq70GniPTkais1MfosLfacSQ@mail.gmail.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============3160758963457789145=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3160758963457789145==
Content-Type: multipart/alternative; boundary="000000000000104707065e497292"

--000000000000104707065e497292
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 oct. 2026 =C3=A0 18:43, Peter Korsgaard <peter@korsgaard.com> a
=C3=A9crit :

> >>>>> "Thomas" =3D=3D Thomas Petazzoni via buildroot <buildroot@buildroot=
.org>
> writes:
>
>  > By default, hare will store its cache directory in $(HOME)/.cache,
>  > which is a problem as we don't want a Buildroot build to write outside
>  > of its output directory (to the exception of DL_DIR, of course). The
>  > build of hare-package packages currently fails with:
>
>  > Error creating /home/br-user/.cache/hare: Permission denied
>  > make[2]: *** [Makefile:15: dbus-introspector] Error 255
>  > Error creating make[2]: *** Waiting for unfinished jobs....
>  > /home/br-user/.cache/hare: Permission denied
>  > make[2]: *** [Makefile:19: dbus-scanner] Error 255
>
>  > due to this issue.
>
>  > We fix this by passing XDG_CACHE_HOME when building hare-package
>  > packages.
>
> Do we have reasons to think that this environment variable will only
> ever be used by hare packages? If not, then we should perhaps rather do
> it globally / in pkg-generic.mk, similar to E.G. how we set GIT_DIR=3D. ?
>
>
in fact, `hare` has its own variable HARECACHE, see
https://manpages.ubuntu.com/manpages/stonking/man1/hare-build.1.html#enviro=
nment

HARECACHE=3D"$$($(2)_SRCDIR).cache" works fine.

no needs to set a desktop XDG environment variable.

Fran=C3=A7ois


> --
> Bye, Peter Korsgaard
>

--000000000000104707065e497292
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20=
 oct. 2026 =C3=A0=C2=A018:43, Peter Korsgaard &lt;<a href=3D"mailto:peter@k=
orsgaard.com">peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Th=
omas&quot; =3D=3D Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buil=
droot@buildroot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt; writ=
es:<br>
<br>
=C2=A0&gt; By default, hare will store its cache directory in $(HOME)/.cach=
e,<br>
=C2=A0&gt; which is a problem as we don&#39;t want a Buildroot build to wri=
te outside<br>
=C2=A0&gt; of its output directory (to the exception of DL_DIR, of course).=
 The<br>
=C2=A0&gt; build of hare-package packages currently fails with:<br>
<br>
=C2=A0&gt; Error creating /home/br-user/.cache/hare: Permission denied<br>
=C2=A0&gt; make[2]: *** [Makefile:15: dbus-introspector] Error 255<br>
=C2=A0&gt; Error creating make[2]: *** Waiting for unfinished jobs....<br>
=C2=A0&gt; /home/br-user/.cache/hare: Permission denied<br>
=C2=A0&gt; make[2]: *** [Makefile:19: dbus-scanner] Error 255<br>
<br>
=C2=A0&gt; due to this issue.<br>
<br>
=C2=A0&gt; We fix this by passing XDG_CACHE_HOME when building hare-package=
<br>
=C2=A0&gt; packages.<br>
<br>
Do we have reasons to think that this environment variable will only<br>
ever be used by hare packages? If not, then we should perhaps rather do<br>
it globally / in <a href=3D"http://pkg-generic.mk" rel=3D"noreferrer" targe=
t=3D"_blank">pkg-generic.mk</a>, similar to E.G. how we set GIT_DIR=3D. ?<b=
r>
<br></blockquote><div><br></div><div>in fact, `hare` has its own variable H=
ARECACHE, see <a href=3D"https://manpages.ubuntu.com/manpages/stonking/man1=
/hare-build.1.html#environment">https://manpages.ubuntu.com/manpages/stonki=
ng/man1/hare-build.1.html#environment</a></div><div><br></div><div>	HARECAC=
HE=3D&quot;$$($(2)_SRCDIR).cache&quot;=C2=A0works fine.</div><div><br></div=
><div>no needs to set a desktop XDG environment variable.</div><div><br></d=
iv><div>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--000000000000104707065e497292--

--===============3160758963457789145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3160758963457789145==--
