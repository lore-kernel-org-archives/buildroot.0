Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD184C3ABA9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6717340D3E;
	Wed, 30 Apr 2025 17:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSZBYA-ajGZJ; Wed, 30 Apr 2025 17:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9300640D61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9300640D61;
	Wed, 30 Apr 2025 17:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C346236
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 17:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E95182013
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 17:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhjihvL6NqIY for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 17:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8490D81F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8490D81F8B
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8490D81F8B
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 17:21:32 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-703f3830906so63207b3.3
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 10:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746033691; x=1746638491;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5XRqFGwS5d0y0Aj1fWOY8XFttT9DPJoX6rtuh5YLKKI=;
 b=fgpNQ0fLfflOIRAhfjy9Ok5knrwFQDdeETdClXvIec+rhlbmo04eroJE60iq30QlHV
 F/ex5e6ShRwzzlpcsmckT/8F9RNkJYeJFp/l64OtbhhhpRRzjHlYmkHYW5Pbtaw0D7aW
 EyIncSq3H9hjn34FzvOx9EPEr7tNlsAs8gFBqra17AB30nO315vEOO8SHS7E52YPm9MW
 AApp3PuLKo3X9cLc6I+I8W1d0QTlog9vNFA5VIUHIjTQepkS3wByVb6Dp4wLuw006RRJ
 EI6EQc0Ran2f0Nhc6lZs/r0OXQuDXBxcKf6+DeLLx01J/G389DeJwh1IzJGks45pnEii
 +IMw==
X-Gm-Message-State: AOJu0Yy88uy6j/7BsdgcHiaGxRzeeBKguEJcaFUxcYTiKr8sABcZxZAx
 80hSFcKvk6KMEJuy7rDCw9IyUM712a8w/wfe4DopYIlPKVzD1/Y8668SD+95jQ4Ydy2R6E9+5i3
 HtZIpZnM+9mKXjHo3ZC9LqVMf66A=
X-Gm-Gg: ASbGncuXVmcwsA6v11brADfDmoyHiDgndXtcla3dOYmHKxFDjOYhoCUuG6kyZkjw0tS
 QqaaFIsv4E4fhobhdaacbe6R99PYV+PwIEmVr+WjZIzltgBbhq9Fu/oTPzoyXF0zIdaBUQPSZfM
 PIpfQVeQuSQG6E79pvXgQ1
X-Google-Smtp-Source: AGHT+IFI1HwrxhFgP7yAArBzU5l2Jv21/8gVTcCp91yCLI0u/or4hPJQO4dJMfSq3pwCAVQKKqT125KVhKiOlqLfStM=
X-Received: by 2002:a05:690c:81:b0:700:a4e1:630e with SMTP id
 00721157ae682-708b7015005mr10206287b3.0.1746033690966; Wed, 30 Apr 2025
 10:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <778708a8-e1c9-4f09-8c93-4349f53d401c@bootlin.com>
In-Reply-To: <778708a8-e1c9-4f09-8c93-4349f53d401c@bootlin.com>
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Wed, 30 Apr 2025 20:21:18 +0300
X-Gm-Features: ATxdqUEA4pANcaK1JDGqUS_nLCqL-_uMh8Bc0y5XT2XOH3mb1FWiVzi_IkjA6mg
Message-ID: <CAPWx8vtMMacV-dMN86T=oi0+5nnjavWmktzn11sb6v+2CaVxTA@mail.gmail.com>
To: =?UTF-8?B?RnJhbsOnb2lzIEZvbHTDqnRl?= <francois.foltete@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746033691; x=1746638491; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5XRqFGwS5d0y0Aj1fWOY8XFttT9DPJoX6rtuh5YLKKI=;
 b=Kzm54OgDyIR5IvAhIkqiz4AnEEnHQxKShUZxrO6Lyz0AhwR5f2GzDvayM9BcPtbDku
 9pxNm8JMjB3nJ4mT/l/m2RCJmioG7AUBk82yc2785i7KMU4hKryOUihQLX24n+40L1Tt
 mVPWONp+5FddbCEzl6lEYyRc+yl67XZFmaY0G63OuCRRobLOJn8Te7g22O+TiYxS2hTr
 FeRRJMbVT2jOj9vcZ6D0qaWpe473nILr3gdYPW5QLrJQglE5y7qbJpWqhXigchxQBnpb
 7uvNOXuPG5tjRGqfD6GY9oBtQ3cJot04T/j9ZcZ+E1AanbotyV3Gx5TQNX4dYbyyXKWQ
 wAXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Kzm54OgD
Subject: Re: [Buildroot] [PATCH] package/m4: fix build failure with gcc 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0531896306697236651=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0531896306697236651==
Content-Type: multipart/alternative; boundary="000000000000ea87b70634022514"

--000000000000ea87b70634022514
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Glad it worked for you - Thanks for letting me know!

Joseph Zikusooka (ZIK)

On Wed, Apr 30, 2025, 6:00 PM Fran=C3=A7ois Folt=C3=AAte <francois.foltete@=
bootlin.com>
wrote:

> Hello Joseph,
>
> thanks for the patch, it worked for me.
>
> Tested-by: Francois Foltete <francois.foltete@bootlin.com>
>
> --
> Fran=C3=A7ois Folt=C3=AAte, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000ea87b70634022514
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Glad it worked for you - Thanks for letting me know!=
</div><div><br></div><div data-smartmail=3D"gmail_signature"><div dir=3D"lt=
r">Joseph Zikusooka (ZIK)</div></div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 30, =
2025, 6:00 PM Fran=C3=A7ois Folt=C3=AAte &lt;<a href=3D"mailto:francois.fol=
tete@bootlin.com">francois.foltete@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hello Joseph,<br>
<br>
thanks for the patch, it worked for me.<br>
<br>
Tested-by: Francois Foltete &lt;<a href=3D"mailto:francois.foltete@bootlin.=
com" target=3D"_blank" rel=3D"noreferrer">francois.foltete@bootlin.com</a>&=
gt;<br>
<br>
-- <br>
Fran=C3=A7ois Folt=C3=AAte, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--000000000000ea87b70634022514--

--===============0531896306697236651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0531896306697236651==--
