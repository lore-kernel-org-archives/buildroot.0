Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2B8C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 00:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22A5402A5;
	Thu, 10 Aug 2023 00:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22A5402A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-BvJbJqe--z; Thu, 10 Aug 2023 00:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0A5402C2;
	Thu, 10 Aug 2023 00:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B0A5402C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2AA41BF97F
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 00:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C1D660B74
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 00:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1D660B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8ztiy8ZjXxs for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 00:23:15 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9889D60AF6
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 00:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9889D60AF6
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe12baec61so2751025e9.2
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 17:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691626993; x=1692231793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YA4aak8ZJgme2d6WHWSEpPNG6BVEzDvfpu0dKEao/1w=;
 b=JX7J3+txfzwbmlGQyrtw2uCRZ7y1cgRMpMgV69t34ntYZ6IWmvtt+Py+wGGLSvEfcp
 Jk4WDBBMNp68tWpX1ay4dGNLl2K/Aql28v5b4hxlsq13GodqbTa3ml+bssiMjFFy7dbk
 34/KYkM+8brVAgmzl3wRkWe1khNw77r/B+dmeF192sRteGaY0J+zhICnthgyi0vkP5kD
 6EY14aMyWOvom2usbz+KAkCocKOdXUXFo9XaIm6RQIA1dElYW4+MVK2A2+tPb6sS7iK+
 geop4I0GqV5mGBmsZzuCGJdYOP5sSduoJIZ92fVKo300bt1Ma/u4AZBZ/BPNKgUP+b7q
 ZUjg==
X-Gm-Message-State: AOJu0YxS5C2dXPPzISLtzL2PMtxjwaTd5wwfVQylQoPp83+0lxkMrL51
 MFbVeWEVFT7fsU1GTL10niy5BORNl3AdEc6clzBK0wwRTeWVQaXfLIxA3bGX
X-Google-Smtp-Source: AGHT+IF7wIaDy6UVu3HrYHOay4PK5KEEuc0qmjLm2cGMRPu4+nDifuaZxlCjl8RNYOKR3LyVIyJzAA6FLO0Ihi1Kbyk=
X-Received: by 2002:a7b:c8c1:0:b0:3fd:2f8e:2c69 with SMTP id
 f1-20020a7bc8c1000000b003fd2f8e2c69mr528969wml.32.1691626993524; Wed, 09 Aug
 2023 17:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691616286.git.yann.morin.1998@free.fr>
 <c9a96063bdc257e07f5288c68d017c9a7d9ac14c.1691616286.git.yann.morin.1998@free.fr>
In-Reply-To: <c9a96063bdc257e07f5288c68d017c9a7d9ac14c.1691616286.git.yann.morin.1998@free.fr>
Date: Thu, 10 Aug 2023 08:23:00 +0800
Message-ID: <CAHRZCZVN4W6d_GEeMxjv36oyQ=Edp5dzoGhyojAxT0gGt9R8UA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691626993; x=1692231793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YA4aak8ZJgme2d6WHWSEpPNG6BVEzDvfpu0dKEao/1w=;
 b=Z1YsGmOo0NYLtUCWfkT+QXHGeOWN2ep6pY/l+mogZ6OoZcDjGv9XgPn3wpW1nEjRd2
 4Iidfp2xqxS5+RlbdMaeUMVi5fFiM101DcNoubAL4uzvrORH1y5AmO+slRE4/Q5B8Hbv
 xcoeB/bpVE9cklgOTOBFaPOCl4+83msUNP4sneK6SCdLye1X0vwIoU9Gb4KaR/4FAw7J
 00Ue0b5sNNj55pKH+PWyCHYhQVKBUFBuOp4fkxEttMQEo3vsPOPupOwinnfRawLQzIvu
 4D6zYz9XKYt/tYMQFKxG4DEOiI0sJ0dOojbVpJviLqDZT2a00Jhkbt2k6fos2hRa8d4K
 ANXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z1YsGmOo
Subject: Re: [Buildroot] [PATCH 3/5] utils/docker-run: bind mount
 .git/objects if needed
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
From: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Boichat <drinkcat@google.com>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9077976649557515628=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9077976649557515628==
Content-Type: multipart/alternative; boundary="0000000000000b0c7f0602869a70"

--0000000000000b0c7f0602869a70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 5:24=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> From: Nicolas Boichat <drinkcat@google.com>
>
> If buildroot is checked out as part of a 'repo' manifest, docker-run
> doesn't fully bind mount the .git directory, leading to commands such
> as `utils/docker-run make check-package` to fail.
>
> Signed-off-by: Nicolas Boichat <drinkcat@google.com>
> [yann.morin.1998@free.fr: use newly introduced mountpoints list]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  utils/docker-run | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 7b27a9b05c..ff903b96e9 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -33,6 +33,12 @@ if [ "${GIT_DIR}" ]; then
>      # path already (in a wordir), then that's a noop.
>      GIT_DIR=3D"$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
>      mountpoints+=3D( "${GIT_DIR}" )
> +
> +    # 'repo' stores .git/objects separately.
> +    if [ -L "${GIT_DIR}/objects" ]; then
> +        OBJECTS_DIR=3D"$(cd "${MAIN_DIR}"; readlink -e
> "${GIT_DIR}/objects")"
>

I intentionally removed `cd "${MAIN_DIR}"` in my patch, as ${GIT_DIR} has
already been made an absolute path, just above, so the cd operation is
unnecessary.


> +        mountpoints+=3D( "${OBJECTS_DIR}" )
>

Otherwise, that's a nice cleanup ,-)

Thanks!


> +    fi
>  fi
>
>  if [ "${BR2_DL_DIR}" ]; then
> --
> 2.25.1
>
>

--0000000000000b0c7f0602869a70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 10, 2023 at 5:24=E2=80=AF=
AM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.=
1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Nicolas Boichat &lt;<a href=3D"mailto:drinkcat@google.com=
" target=3D"_blank">drinkcat@google.com</a>&gt;<br>
<br>
If buildroot is checked out as part of a &#39;repo&#39; manifest, docker-ru=
n<br>
doesn&#39;t fully bind mount the .git directory, leading to commands such<b=
r>
as `utils/docker-run make check-package` to fail.<br>
<br>
Signed-off-by: Nicolas Boichat &lt;<a href=3D"mailto:drinkcat@google.com" t=
arget=3D"_blank">drinkcat@google.com</a>&gt;<br>
[<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.morin.19=
98@free.fr</a>: use newly introduced mountpoints list]<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
---<br>
=C2=A0utils/docker-run | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/utils/docker-run b/utils/docker-run<br>
index 7b27a9b05c..ff903b96e9 100755<br>
--- a/utils/docker-run<br>
+++ b/utils/docker-run<br>
@@ -33,6 +33,12 @@ if [ &quot;${GIT_DIR}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0# path already (in a wordir), then that&#39;s a noop.<b=
r>
=C2=A0 =C2=A0 =C2=A0GIT_DIR=3D&quot;$(cd &quot;${MAIN_DIR}&quot;; readlink =
-e &quot;${GIT_DIR}&quot;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0mountpoints+=3D( &quot;${GIT_DIR}&quot; )<br>
+<br>
+=C2=A0 =C2=A0 # &#39;repo&#39; stores .git/objects separately.<br>
+=C2=A0 =C2=A0 if [ -L &quot;${GIT_DIR}/objects&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECTS_DIR=3D&quot;$(cd &quot;${MAIN_DIR}&quo=
t;; readlink -e &quot;${GIT_DIR}/objects&quot;)&quot;<br></blockquote><div>=
<br></div><div>I intentionally removed `cd &quot;${MAIN_DIR}&quot;` in my p=
atch, as ${GIT_DIR} has already been made an absolute path, just above, so =
the cd operation is unnecessary.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mountpoints+=3D( &quot;${OBJECTS_DIR}&quot; )<=
br></blockquote><div><br></div><div>Otherwise, that&#39;s a nice cleanup ,-=
)</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 fi<br>
=C2=A0fi<br>
<br>
=C2=A0if [ &quot;${BR2_DL_DIR}&quot; ]; then<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000b0c7f0602869a70--

--===============9077976649557515628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9077976649557515628==--
