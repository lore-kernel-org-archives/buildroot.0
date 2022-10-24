Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C72C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 05:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D62B60AA5;
	Mon, 24 Oct 2022 05:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D62B60AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4PlHA3Yk1_z; Mon, 24 Oct 2022 05:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782F060A87;
	Mon, 24 Oct 2022 05:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782F060A87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42EF71BF35D
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 05:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB9681338
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 05:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DB9681338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvF3yBHf6G-A for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 05:47:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF80781334
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF80781334
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 05:47:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp15so14957606lfb.13
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 22:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AbEjjcoAL1s12hN3d3jvH+vBfFYo6Z/khRF3p6E33xU=;
 b=eKin3Lmwn5yukmRUa6rm2dTM0NWSuzJsf0eDyKIRd+9sbuv4gSvGBdnrShOXKBnXPe
 KKG2ptXSm9MLjktrrEvqVpDb/1PzTSKkI2AZKUJzudYYPuOhV6GnUcwuQUAkWg9GikgR
 SdmRr7/nFuzdRhnpSryxvHqHViCB8qVejO3Qk8kidNFfX0agC5VM4EYUZlfCoYwJeDEu
 jnIonNyUHa7xwrPgHkG/JqdCmZ3pbCbi+bhPDRHONljtFxhG85WFczpBbyvgGyYbhYn7
 8rqOxBHfAAvpbalgwvTndVucIn+5+rDSbrkfVsq1vf0689R25W0ooRS+OxHzPFSU8EnQ
 9AZQ==
X-Gm-Message-State: ACrzQf0AD09xJY+7qVIvb3U3p3pmLvF9sFna8kYD07B/nWn/buf1ZYP2
 mHRaWZUTxx4flrPFgO1jHHY9Cc3g56FiZ2g20E3ILyRS
X-Google-Smtp-Source: AMsMyM7SeNx98CSJ6rtxpI/QcrrT/7RlCYJARz8WpXhNijGv+L0tRRyEmSPjPCx5zyz0Zf94lkV4adzUYkcsmvaJXJc=
X-Received: by 2002:a19:c503:0:b0:4a2:b966:37ec with SMTP id
 w3-20020a19c503000000b004a2b96637ecmr12401595lfe.319.1666590444500; Sun, 23
 Oct 2022 22:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221011062647.741292-1-marcus.folkesson@gmail.com>
In-Reply-To: <20221011062647.741292-1-marcus.folkesson@gmail.com>
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 24 Oct 2022 07:47:40 +0200
Message-ID: <CAM8FrKKEeRzTmWP0kFDdTRdKtBfA4Y-5mB3CtVegzpwdiSwdVA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AbEjjcoAL1s12hN3d3jvH+vBfFYo6Z/khRF3p6E33xU=;
 b=LiW9+yj2cgbqWTe9Mtcsn9dYIrcn7HmHIXsGbz/LUjk3m7MC4e9ylqwKkQZsfmnmpU
 QX27DFMTF3hvXR24Coym/5E5LDhXZrha7JDtPVdfIuPPAg97jFYKG2JQprZKpTwF+1W/
 pSD0vqhOAMIUgBq483gAzS5fGU7UpnrmYtyBT8dPqanNDFQexUzjG2sMeAyWYtRfv7YP
 AlLSPrmqwGUTfZUF9nkM2GN71gL0EBQqPQaSGoilBYurGw7krBAVmuTeF+9yumZwLWwB
 LweneUetXkUqV+JhZw1fTzeCDKwqbszKmIHqUm6yf6t+S5d/3fmigPzuKG4PZ3CDyiDI
 Z68w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LiW9+yj2
Subject: Re: [Buildroot] [PATCH] package/libostree: select libarchive for
 s390x architecture
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
Content-Type: multipart/mixed; boundary="===============3052468957570459342=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3052468957570459342==
Content-Type: multipart/alternative; boundary="0000000000006e3c5805ebc153ba"

--0000000000006e3c5805ebc153ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bump

Med v=C3=A4nliga h=C3=A4lsningar / Best regards
Marcus Folkesson

Den tis 11 okt. 2022 kl 08:26 skrev Marcus Folkesson <
marcus.folkesson@gmail.com>:

> libarchive is needed when building for s390x.
>
> Introduced in this patch:
> c6a53ef6e8f9491633b0d494991f94c629791e1d s390x: use 'libarchive' to modif=
y
> initrd in SE case
>
> Fixes:
>
> http://autobuild.buildroot.net/results/14cc164ab3005be9b3efde57b4bd914414=
e3acf0/
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/libostree/Config.in b/package/libostree/Config.in
> index 14ae4da4c8..a36e12ddde 100644
> --- a/package/libostree/Config.in
> +++ b/package/libostree/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBOSTREE
>         # doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
>         depends on !BR2_TOOLCHAIN_USES_MUSL
>         select BR2_PACKAGE_E2FSPROGS
> +    select BR2_PACKAGE_LIBARCHIVE if BR2_s390x
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_LIBGPG_ERROR
>         select BR2_PACKAGE_LIBGPGME
> --
> 2.37.1
>
>

--0000000000006e3c5805ebc153ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bump<br><br>Med v=C3=A4nliga h=C3=A4lsningar / Best regard=
s<br>Marcus Folkesson</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Den tis 11 okt. 2022 kl 08:26 skrev Marcus Folkesson &=
lt;<a href=3D"mailto:marcus.folkesson@gmail.com">marcus.folkesson@gmail.com=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">libarc=
hive is needed when building for s390x.<br>
<br>
Introduced in this patch:<br>
c6a53ef6e8f9491633b0d494991f94c629791e1d s390x: use &#39;libarchive&#39; to=
 modify initrd in SE case<br>
<br>
Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/14cc164ab3005be9b3efde57b=
4bd914414e3acf0/" rel=3D"noreferrer" target=3D"_blank">http://autobuild.bui=
ldroot.net/results/14cc164ab3005be9b3efde57b4bd914414e3acf0/</a><br>
<br>
Signed-off-by: Marcus Folkesson &lt;<a href=3D"mailto:marcus.folkesson@gmai=
l.com" target=3D"_blank">marcus.folkesson@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libostree/Config.in | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/libostree/Config.in b/package/libostree/Config.in<br>
index 14ae4da4c8..a36e12ddde 100644<br>
--- a/package/libostree/Config.in<br>
+++ b/package/libostree/Config.in<br>
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBOSTREE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # doesn&#39;t build with musl due to lack of TE=
MP_FAILURE_RETRY()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_USES_MUSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_E2FSPROGS<br>
+=C2=A0 =C2=A0 select BR2_PACKAGE_LIBARCHIVE if BR2_s390x<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBGLIB2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBGPG_ERROR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_LIBGPGME<br>
-- <br>
2.37.1<br>
<br>
</blockquote></div>

--0000000000006e3c5805ebc153ba--

--===============3052468957570459342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3052468957570459342==--
