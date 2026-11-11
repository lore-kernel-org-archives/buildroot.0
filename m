Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6347606A324
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VfwiBDOS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUgNqNtx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91CAF608C0;
	Wed, 11 Nov 2026 18:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIY-aBbCBD1A; Wed, 11 Nov 2026 18:50:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 63A5660DD1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794423052;
	b=bzcq0UIUcmyB7OCK4O+oiHdJ4uHo1SfXPSbpeJT+3b5MRt5+8pOH2P1YKgLIB8ulr0br
	 /YPF95WPjbdMj0RztjXysbTyERSpp9InAKKi1ry+nEpitC6LydFDS8rGaZWKjNpBm/Suy
	 Jj2XoSFdWyJKgeA8IhZWpIe+pjvqOpLstyyZgvPmKJhXFtC9oIKmjbVjib3q4TIy1wkMq
	 eXEIkzVdKjKVNCPn6bvYpAPwgRfJypxEKkiNhICsdo+JcxejKuUfjTvW8LJqCW2duab/x
	 b5YaFNpi1a2j8F6mv2X0QFpbghNnHWKUCEVXuVJ3+2ryvkOIMAtZAJMX3UFvwsVFjEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794423052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=3sROtWE702RaZ5UjypykFnk5mWIkkToD6Xp/iirXUpw=;
	b=lofTtCf8bsHmMiqzdVCiKopGKxBpUpchM4pDe6Gf8BNKylFcf6DblBKTiT5jLLkgP55Y
	 w3XIq0rAvoNV5Ni3mOeBmKwlyj+LWp+/5m7ATBUotgJqTvzT3vZIi7NHxaDLpKy7Us+Es
	 13UkWutWXJolXNE2dn6pszR6cS8RxKfdl214B6uU1ZqMldQL8KDOFjtLBzdamtkAjMB6+
	 nkLC8eadwic2fDsKJTemg2HeP+KU2aVxd36u5Xu3Z+7u3r6rUkyeGq613jjRjtX90tqpK
	 uWLzfpyKVRg4qDawnNonexxqLlneBHW++0YiUTNYiuTMCXnVN75Ptl6nzzUNVG4N6CA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794423052;
	bh=3sROtWE702RaZ5UjypykFnk5mWIkkToD6Xp/iirXUpw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VfwiBDOSa9gw9lYvaepZ9OMukgeDyXFTKZ7gdEkH3Yxb+5YsOlRG22AWlSi1p9L8Y
	 VEM+ZHCqAtG7QdixdxFweZ8ZNj6mPSu13l5KZNpQuGN5GZJOgyT09EVMfgHT6/0SgW
	 1Tx9WiMOu0+nmvOk5K4sc0a5ytxEGD6CQcsjUfUlQJKwCaYDwmtzKl9gZBoTCs0WIT
	 aEUV6cC3mfOjcRRBQHTrnThpmVGWxKehSlZIWJX4eVQHCNaGe9d0zSV9U/j2fN7fcl
	 qulm+5PS9yGHTyrMtl3y1ekVKdAegc4OJGJV39rwij4D8TgSKl/q0DnaGU8WGImd/4
	 TUCecmNofyt9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A5660DD1;
	Wed, 11 Nov 2026 18:50:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 452D270B
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2295C81F0D
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alhuc9m4omnV for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:50:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DECCA819F6
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=oUgNqNtx
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DECCA819F6
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:50:48 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-53aa0802881so1559726b6e.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794423047; x=1795027847; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HwmYs10YPG3yg5n3WYUEGT/jwws0/JNZze8i1aYINO4=;
 b=oUgNqNtxtiBdP7PdT0QbtVU25d2WsWMzClioFpcc8qemaTWK02r+gzo/yBEsAwSnPT
 iKqlI3PQNMKW17MTZdKSZlyrHRmaxz2O4e5YXvcYbEHsnTH8NbouZdKkWIGHthYlMgae
 OcldnK/i7rQyk+NcdE5J+WoOs5vn2FdGVXkt6niiKrvg9pCDBByRZTOZQt/RIY7Mm7Yw
 GXX9vg6pEAa/a1/w97DUtjVANb51359vcNCyUWRxORdqqk0T1tdgAzsKvzl1yhBvhkSD
 9jRqUr9izncscAQlRcHrdcTYebHaRlnTP20myuUyL3rRdJJIJychDkWxa8UY9egEB75y
 JQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794423047; x=1795027847;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HwmYs10YPG3yg5n3WYUEGT/jwws0/JNZze8i1aYINO4=;
 b=GtBPNG4rxQmKF+jugPHDyrl9FNb2ypLfSc7H34sD2cRliWai+3setcLsMp2jmMDrPy
 D6Bh1fp2JnHm8kjKcZ4qzmGzX9gU8ynxBKomHgiI/agx0uNAWZhCdr4v+KdIULPp4f9X
 cH9fWRYiuZMDIrSEK2gaFG7pRwzCCqiKn8ruPJfT5zVr1z5dATdBJumYYcY/jsRYFLnf
 0qN9kvFbNY3XUpDItosQIVzcXSHmR1MIfJSEEoDyFWCEyxGxmC2IUq5tYN2YNwAflmP7
 h2Frx+7ixjhH1uMgAp9KVrO2zzeL15zMPwCZdVnzr3IEmMwr7w1npkX2vFlA0h1XOH+/
 QK+w==
X-Gm-Message-State: APuU4Z9uM4AtcqX6upX5YXTVweF/FSvSYLK6vDbrKmHpvFeZ3WIGZKDu
 e9P3UnDTlxJJcr+vFDwtW1oUJY2Vj+C4LRsoncbS1AzGcXdfeV5IXVf2XAKQf7SC3moX+AW2jSK
 nfa4F0HmLLH4CjYpOv9MkBxWpa3JyH9M=
X-Gm-Gg: AYBFou3E/3vyZwa4ZSRlJIVn0KBEqosqTIahMyA8xvSVagjPx9NNzmY5OxcYaN491gM
 9CzGzMLucNp2FLFHj+NBzn1eCTiD1I8jHUxTEsF6WPyVRJCxTTs2O/uaTZne6CYI4FyuD75S9x0
 x8o4aWrVEDunNJRJ4kS0cinPYxVa+g8Bz1SmkjIkn7yHJqAjU3AlWLdsLu7rz3CpwzbO6pno4LV
 yUbGjd5SnHcUnUSoh5tJchyNZ1cunwsgPsTYVKKhY3R0lpdlV4uyGO9HVa+1ZEn16tN4nlOTSHU
 qDjZC20CxZqxIh1Rda+EHBKWylgAGidEfqBGN8cB6h5+5xp7/IcbQS6wsyrKQ39wk4MXTqdP7uq
 1kxVrjrlPHGpalnZI16fPr29hJ4aJTi28KIplDw==
X-Received: by 2002:a05:6808:14c5:b0:53b:87e5:8c9a with SMTP id
 5614622812f47-56b96ad379emr2956754b6e.17.1794423046662; Wed, 11 Nov 2026
 10:50:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-5-angelo.compagnucci@gmail.com>
 <46b07dbb-29c3-4663-a7e9-343bcede2416@grenoble.cnrs.fr>
In-Reply-To: <46b07dbb-29c3-4663-a7e9-343bcede2416@grenoble.cnrs.fr>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:50:10 +0100
X-Gm-Features: AclHuK_94gCD4JJswIh-y3PpyKigSsC2DbWu0f8VHzLZj1F8E8HUFcMiOeFpxJc
Message-ID: <CA+TH9V=+K0WWZH_xXnikquuks6Yc_monTvEx0vr2qBzmu=xjtQ@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org, Biagio Montaruli <biagio.hkr@gmail.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 5/6] boot/at91bootstrap3: find the
 memory@ node of Linux device trees
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0720952251447034152=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0720952251447034152==
Content-Type: multipart/alternative; boundary="00000000000045ee7b066004ac5f"

--00000000000045ee7b066004ac5f
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 11 nov 2026 alle ore 19:13 Edgar Bonet <bonet@grenoble.cnrs.fr>
ha scritto:

> Hello!
>
> On 2026-11-11, Angelo Compagnucci wrote:
> > Before booting Linux, at91bootstrap 3.x sets the memory node of its
> > device tree, which it looks for by the name "memory": the Linux device
> > trees name it memory@<address> (e.g. memory@20000000 in
> > at91-ariettag25.dts), and at91bootstrap stops before booting:
> >
> >   DT: doesn't support add node (memory)
> >   SD/MMC: Failed to load image
> >
> > Backport the fix of the 4.x series.
> >
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - new patch
> > ---
> >  ...w-name-of-memory-node-in-device-tree.patch | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644
> boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> >
> > diff --git
> a/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> > new file mode 100644
> > index 0000000000..ef6f5e14b3
> > --- /dev/null
> > +++
> b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch
> > @@ -0,0 +1,31 @@
> > +From 72da9d23ed07bbfc793d767dc5a4044cc0a95706 Mon Sep 17 00:00:00 2001
> > +From: Xing Chen <xing.chen@microchip.com>
> > +Date: Fri, 24 Sep 2021 10:47:35 +0800
> > +Subject: [PATCH] lib: fdt: adapt new name of memory node in device tree
> file
> > +
> > +The name of memory node was changed from 'memory' to 'memory@address'
> > +in device tree files in Linux. For example, 'memory@20000000' .
> > +This commit checks if the memory node is named 'memory' or it has a
> trailing
> > +'@' .
> > +
> > +Signed-off-by: Xing Chen <xing.chen@microchip.com>
> > +Upstream:
> https://github.com/linux4sam/at91bootstrap/commit/72da9d23ed07bbfc793d767dc5a4044cc0a95706
> > +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > +---
> > + lib/fdt.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/lib/fdt.c b/lib/fdt.c
> > +index 8d1fdfdc5..aa20426c9 100644
> > +--- a/lib/fdt.c
> > ++++ b/lib/fdt.c
> > +@@ -254,7 +254,8 @@ static int of_get_node_offset(void *blob, const
> char *name, int *offset)
> > +
> > +             nodename = (char *)of_dt_struct_offset(blob,(nodeoffset +
> 4));
> > +             if ((memcmp(nodename, name, namelen) == 0)
> > +-                    && (nodename[namelen] == '\0'))
> > ++                    && ((nodename[namelen] == '\0')
> > ++                            || (nodename[namelen] == '@')))
> > +                     break;
> > +
> > +             start_offset = nextoffset;
>
> Doing a test build, I got this:
>
>     >>> at91bootstrap3 v3.10.4 Patching
>
>     Applying
> 0001-include-types.h-conditionally-define-bool-false-and-.patch using
> patch:
>     patching file include/types.h
>
>     Applying
> 0002-lib-fdt-adapt-new-name-of-memory-node-in-device-tree.patch using
> patch:
>     patching file lib/fdt.c
>     Hunk #1 succeeded at 277 (offset 23 lines).
>
> It appears the line numbers mentioned in the patch are incorrect: they
> match the code in the 4.x branch. It's not a big deal, as patch manages
> to find the hunk, but maybe the line numbers should have been updated
> when backporting the fix?
>

Yeah, sorry, my bad. Just sent an updated version.

Thanks for taking the time to test!


>
> Regards,
>
> Edgar.
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--00000000000045ee7b066004ac5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 1=
1 nov 2026 alle ore 19:13 Edgar Bonet &lt;<a href=3D"mailto:bonet@grenoble.=
cnrs.fr">bonet@grenoble.cnrs.fr</a>&gt; ha scritto:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hello!<br>
<br>
On 2026-11-11, Angelo Compagnucci wrote:<br>
&gt; Before booting Linux, at91bootstrap 3.x sets the memory node of its<br=
>
&gt; device tree, which it looks for by the name &quot;memory&quot;: the Li=
nux device<br>
&gt; trees name it memory@&lt;address&gt; (e.g. memory@20000000 in<br>
&gt; at91-ariettag25.dts), and at91bootstrap stops before booting:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0DT: doesn&#39;t support add node (memory)<br>
&gt;=C2=A0 =C2=A0SD/MMC: Failed to load image<br>
&gt; <br>
&gt; Backport the fix of the 4.x series.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagn=
ucci@gmail.com" target=3D"_blank">angelo.compagnucci@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- new patch<br>
&gt; ---<br>
&gt;=C2=A0 ...w-name-of-memory-node-in-device-tree.patch | 31 +++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 31 insertions(+)<br>
&gt;=C2=A0 create mode 100644 boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adap=
t-new-name-of-memory-node-in-device-tree.patch<br>
&gt; <br>
&gt; diff --git a/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-o=
f-memory-node-in-device-tree.patch b/boot/at91bootstrap3/v3.10.4/0002-lib-f=
dt-adapt-new-name-of-memory-node-in-device-tree.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ef6f5e14b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/boot/at91bootstrap3/v3.10.4/0002-lib-fdt-adapt-new-name-of-memor=
y-node-in-device-tree.patch<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +From 72da9d23ed07bbfc793d767dc5a4044cc0a95706 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Xing Chen &lt;<a href=3D"mailto:xing.chen@microchip.com" target=
=3D"_blank">xing.chen@microchip.com</a>&gt;<br>
&gt; +Date: Fri, 24 Sep 2021 10:47:35 +0800<br>
&gt; +Subject: [PATCH] lib: fdt: adapt new name of memory node in device tr=
ee file<br>
&gt; +<br>
&gt; +The name of memory node was changed from &#39;memory&#39; to &#39;mem=
ory@address&#39;<br>
&gt; +in device tree files in Linux. For example, &#39;memory@20000000&#39;=
 .<br>
&gt; +This commit checks if the memory node is named &#39;memory&#39; or it=
 has a trailing<br>
&gt; +&#39;@&#39; .<br>
&gt; +<br>
&gt; +Signed-off-by: Xing Chen &lt;<a href=3D"mailto:xing.chen@microchip.co=
m" target=3D"_blank">xing.chen@microchip.com</a>&gt;<br>
&gt; +Upstream: <a href=3D"https://github.com/linux4sam/at91bootstrap/commi=
t/72da9d23ed07bbfc793d767dc5a4044cc0a95706" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/linux4sam/at91bootstrap/commit/72da9d23ed07bbfc793=
d767dc5a4044cc0a95706</a><br>
&gt; +Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compag=
nucci@gmail.com" target=3D"_blank">angelo.compagnucci@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/fdt.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/fdt.c b/lib/fdt.c<br>
&gt; +index 8d1fdfdc5..aa20426c9 100644<br>
&gt; +--- a/lib/fdt.c<br>
&gt; ++++ b/lib/fdt.c<br>
&gt; +@@ -254,7 +254,8 @@ static int of_get_node_offset(void *blob, const c=
har *name, int *offset)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nodename =3D (char *)=
of_dt_struct_offset(blob,(nodeoffset + 4));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((memcmp(nodename,=
 name, namelen) =3D=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;&amp; (nodename[namelen] =3D=3D &#39;\0&#39;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;&amp; ((nodename[namelen] =3D=3D &#39;\0&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (nodename[namelen] =3D=3D &#39;@&#39;)))=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start_offset =3D next=
offset;<br>
<br>
Doing a test build, I got this:<br>
<br>
=C2=A0 =C2=A0 &gt;&gt;&gt; at91bootstrap3 v3.10.4 Patching<br>
<br>
=C2=A0 =C2=A0 Applying 0001-include-types.h-conditionally-define-bool-false=
-and-.patch using patch: <br>
=C2=A0 =C2=A0 patching file include/types.h<br>
<br>
=C2=A0 =C2=A0 Applying 0002-lib-fdt-adapt-new-name-of-memory-node-in-device=
-tree.patch using patch: <br>
=C2=A0 =C2=A0 patching file lib/fdt.c<br>
=C2=A0 =C2=A0 Hunk #1 succeeded at 277 (offset 23 lines).<br>
<br>
It appears the line numbers mentioned in the patch are incorrect: they<br>
match the code in the 4.x branch. It&#39;s not a big deal, as patch manages=
<br>
to find the hunk, but maybe the line numbers should have been updated<br>
when backporting the fix?<br></blockquote><div><br></div><div>Yeah, sorry, =
my bad. Just sent an updated version.</div><div><br></div><div>Thanks for t=
aking the time to test!</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Regards,<br>
<br>
Edgar.<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>

--00000000000045ee7b066004ac5f--

--===============0720952251447034152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0720952251447034152==--
