Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B6C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 03:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990F5813AB;
	Tue,  2 Aug 2022 03:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990F5813AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtG-JWuYf9jC; Tue,  2 Aug 2022 03:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC97D8132A;
	Tue,  2 Aug 2022 03:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC97D8132A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEF61BF293
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 03:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DF1B40867
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 03:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF1B40867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsXrnuc5JPUe for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 03:50:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CED4055D
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3CED4055D
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 03:50:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so14114073pjl.0
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 20:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tj7aPngbIHHqOPSM5pr1u0UQjF5q3I7C1JlB6BK82PI=;
 b=HYow8Azm1lpZg/80NraSztCdv/429RKSbhizCfULj/0YE7vtXyMEY4xVRT65ETEXs9
 diqjZ2E3xfRlLqlRLEibELUN0auodKYXIF+E9f3tVu5Ph7skq9aylG9DWWpQUX1j3QPp
 c+4xVq1yvswSKxii6FjlCJe6e/t05YRIl/ds3aMqqaQFPfT4Rm8bWDOiyY/n2+VPRiVv
 HF5cHuftpyZzFjJCJVdr6ta0MAuA8GGd3JsM0lQ14xuI8pqqA0Gu0AsNVTHKvZhKtWQS
 bF5HwZDWmwGVUVdzSOgqtUvHAwAdjGWCLRrfd/31/i/bcYulYpvfKatJ+CdzSbI6wsLk
 BKqQ==
X-Gm-Message-State: ACgBeo2s838v/93UH7fVzZvNaCLeLbq11LOyoN0x5l7L56lemBFDeYSd
 RHst8+aTfO/muxQchaTu8koBtLbFtMDPEgQAUMbQe55O6D4=
X-Google-Smtp-Source: AA6agR6PKmfiPlmGmHKtBjJBUF5ATR2NXFiO1vqhCD1dOnbLp5eCCEONEPmbUIbrRxzlUUq1f2KgD1di638V6dkmfuY=
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id
 q18-20020a17090311d200b001678a0f8d4bmr19300892plh.78.1659412247069; Mon, 01
 Aug 2022 20:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220511114508.3617270-1-tianyuanhao3@163.com>
In-Reply-To: <20220511114508.3617270-1-tianyuanhao3@163.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 2 Aug 2022 05:50:35 +0200
Message-ID: <CAB0FRstY6BfN+yj-hwuySdpUob1+rLZdc-9pikTjYWGRun7Rsw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/apk-tools: new package
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: multipart/mixed; boundary="===============3079636407550902624=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3079636407550902624==
Content-Type: multipart/alternative; boundary="00000000000085e3a905e53a05e5"

--00000000000085e3a905e53a05e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 11 mai 2022 =C3=A0 13:45, TIAN Yuanhao <tianyuanhao3@163.com> a =C3=
=A9crit :

> Alpine Package Keeper (apk) is a package manager developed for Alpine
> Linux.
>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>
> I did read [1] before I submitted this patch.
>
> I need a package manager in an embedded system and I found there are
> some Buildroot based projects having similar things like [2] and [3].
> Given the popularity of Alpine Linux in containers, I would like to
> choose apk as the package manager.
>
>
FYI, the package Busybox could be built with its own version of dpkg,
dpkg-deb, rpm, rpm2cpio (see section Archival Utilities).

Fran=C3=A7ois


> There is a performance comparison of package managers at [4].
>
> An interesting finding is that OpenWrt seems to be planning to switch
> from opkg to apk [5].
>
> In conclusion, I think Buildroot should have apk.
>
> [1]:
> http://patchwork.ozlabs.org/project/buildroot/patch/1426736888-29437-5-gi=
t-send-email-steven@uplinklabs.net/
> [2]:
> https://github.com/batocera-linux/batocera.linux/blob/5.27/package/batoce=
ra/utils/pacman/pacman.mk
> [3]:
> https://github.com/gportay/linux-distros-br2-external/blob/master/package=
/apk-tools/apk-tools.mk
> [4]:
> https://michael.stapelberg.ch/posts/2019-08-17-linux-package-managers-are=
-slow/#measurements
> [5]: https://github.com/openwrt/openwrt/pull/4294
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000085e3a905e53a05e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 11 mai 2022 =C3=A0=C2=A0=
13:45, TIAN Yuanhao &lt;<a href=3D"mailto:tianyuanhao3@163.com">tianyuanhao=
3@163.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Alpine Package Keeper (apk) is a package manager deve=
loped for Alpine<br>
Linux.<br>
<br>
Signed-off-by: TIAN Yuanhao &lt;<a href=3D"mailto:tianyuanhao3@163.com" tar=
get=3D"_blank">tianyuanhao3@163.com</a>&gt;<br>
---<br>
<br>
I did read [1] before I submitted this patch.<br>
<br>
I need a package manager in an embedded system and I found there are<br>
some Buildroot based projects having similar things like [2] and [3].<br>
Given the popularity of Alpine Linux in containers, I would like to<br>
choose apk as the package manager.<br>
<br></blockquote><div><br></div><div>FYI, the package Busybox could be buil=
t with its own version of dpkg, dpkg-deb, rpm, rpm2cpio (see section Archiv=
al Utilities).</div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
There is a performance comparison of package managers at [4].<br>
<br>
An interesting finding is that OpenWrt seems to be planning to switch<br>
from opkg to apk [5].<br>
<br>
In conclusion, I think Buildroot should have apk.<br>
<br>
[1]: <a href=3D"http://patchwork.ozlabs.org/project/buildroot/patch/1426736=
888-29437-5-git-send-email-steven@uplinklabs.net/" rel=3D"noreferrer" targe=
t=3D"_blank">http://patchwork.ozlabs.org/project/buildroot/patch/1426736888=
-29437-5-git-send-email-steven@uplinklabs.net/</a><br>
[2]: <a href=3D"https://github.com/batocera-linux/batocera.linux/blob/5.27/=
package/batocera/utils/pacman/pacman.mk" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/batocera-linux/batocera.linux/blob/5.27/package/batoc=
era/utils/pacman/pacman.mk</a><br>
[3]: <a href=3D"https://github.com/gportay/linux-distros-br2-external/blob/=
master/package/apk-tools/apk-tools.mk" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/gportay/linux-distros-br2-external/blob/master/package/=
apk-tools/apk-tools.mk</a><br>
[4]: <a href=3D"https://michael.stapelberg.ch/posts/2019-08-17-linux-packag=
e-managers-are-slow/#measurements" rel=3D"noreferrer" target=3D"_blank">htt=
ps://michael.stapelberg.ch/posts/2019-08-17-linux-package-managers-are-slow=
/#measurements</a><br>
[5]: <a href=3D"https://github.com/openwrt/openwrt/pull/4294" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/openwrt/openwrt/pull/4294</a><br=
><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000085e3a905e53a05e5--

--===============3079636407550902624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3079636407550902624==--
