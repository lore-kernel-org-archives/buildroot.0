Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3389CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 23:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A235F83EDF;
	Wed,  6 Apr 2022 23:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COe5qpxg5HP8; Wed,  6 Apr 2022 23:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA5DF83EC9;
	Wed,  6 Apr 2022 23:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFD871BF57C
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 23:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE20540198
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 23:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PdN0G4h2svP for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 23:02:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0BB240111
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 23:02:28 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id z33so6656342ybh.5
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 16:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vLUVLzxmhf9wcvLVGC94wJf52Q4Aczgb/eGUQswD1Os=;
 b=DO+P13w8M4QXBp6CnJ+gG89N6VSWHJt4BImeIftJgNsQr6liFyNCgLmWb6qV+kps+2
 Ll186F2NJAxVXNVLVATpEWd1VwLdAgTtYSRla87FBsyf6tBsDqnRjM/pvzLX0I/Yo3Aa
 u3ZGMREKmPm2O2E1XQtuu47xqKVFQ8R2lAGxr8xLHISfQtQvAqyY6/VUXgqassTbuyHd
 T6XgPIbTJAVtM5PUKlCCbjemaF37Lke2JP8awelcjIcRJ8jb9hP9x7S3X/4aQ/U0FEhr
 4CBuddYtYLo4FC879VPsRaS9nGL+HIWaW6FWEAR1YDnNbKBkkKLMVghCfLnCtJRdpTdX
 YUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLUVLzxmhf9wcvLVGC94wJf52Q4Aczgb/eGUQswD1Os=;
 b=XrqNCwLrZ/0iWkPGe7tOo5tDPVAy0Z1E0gSRa5Ke1xC2jPJLDTAHj1GsYXUvNd7ZWK
 sabKlhH+GcUP/0U5RMA/Wn/b0076YQvOqb90nInFBU9XkCh+0qu7BybwG7Z93MrtOcOI
 +6M03WCGx7q/o6qmma9dapDTagovJAAwzBqipRFU9IZA2QgR2CBD9jl/WRJtZoEtK33I
 D9ctqRnLx5w8sunjFg400EUO4TcWWdN4p2vrmt7rVBzwFkujwyTfD0Bmyli16x5wNIMy
 Pmkv0pBwV9SQwX5IUuqi4fow9lAn0YViNaXy4QTVyOi4CKWvkRoUKRfugZXS3x41zla5
 9N5A==
X-Gm-Message-State: AOAM530tZnc8DmoUIdsg+fW6CPeMzwNn1mgs3wZb0EOXuJaTEb23Nd+8
 c3ysvPBcMwSVGMY4CnIUsvrWe08TE7FI0OPQ+9b+mlK4jOw=
X-Google-Smtp-Source: ABdhPJyhdnIt1p00cDUyOB3Dth10+WQsg3Cy/o7/nPXfts7VEbSdQARznEl/C27PqotZUDmwJBachetJgclmrkTmqYs=
X-Received: by 2002:a25:adc8:0:b0:633:b79d:92ee with SMTP id
 d8-20020a25adc8000000b00633b79d92eemr7946399ybe.457.1649286147770; Wed, 06
 Apr 2022 16:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
 <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
 <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
 <CADvTj4p_qDCOB5PysR+rNKpp9Fo4PCCn9n4AzpJ4mRkZnqtk_g@mail.gmail.com>
In-Reply-To: <CADvTj4p_qDCOB5PysR+rNKpp9Fo4PCCn9n4AzpJ4mRkZnqtk_g@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 6 Apr 2022 20:02:16 -0300
Message-ID: <CAM70yxDMKEOTKfesTPp02oakyCCB4zM+BmigQ0fqMoaSfeHjnA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5482939091753093520=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5482939091753093520==
Content-Type: multipart/alternative; boundary="000000000000f88ca605dc045af8"

--000000000000f88ca605dc045af8
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 7:27 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> Why are you executing cmake in a post-build script?
>
> You should probably create a proper cmake package in your BR2_EXTERNAL:
>
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages
> https://buildroot.org/downloads/manual/manual.html#outside-br-custom
>

I should have clarified that the same CMake-based superbuild project is
used to compile desktop versions of the same app for development purposes.
All the (permissive-licenced) dependencies are statically linked to avoid
headaches where the desktop's dynamic libraries are used instead of the
ones intended for the app. As I'm sure you know, the edit/run/debug cycle
is much faster when it doesn't have to be uploaded and remotely debugged on
an embedded device.

Nonetheless, I'll consider your advice and will check if the CMake
superbuild of our app can be hooked into a BR2_EXTERNAL cmake package
instead of a post-build script. Thank you.

So create a separate buildroot package for those dependencies that your main
> package selects.
>
> Use the cmake package infrastructure instead of trying to use cmake to
> download
> the dependency.
>

Again, the same CMake superbuild is used for desktop builds and I don't
want to duplicate all that effort into equivalent buildroot cmake packages.
Sorry for not making clearer the dual purpose of our CMake superbuild.

--000000000000f88ca605dc045af8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Apr 6, 2022 at 7:27 PM James Hilliard &lt;<a href=3D"mailto:=
james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Why are you executing cmake in a post-build script?<br>
<br>
You should probably create a proper cmake package in your BR2_EXTERNAL:<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_infrastructu=
re_for_cmake_based_packages" rel=3D"noreferrer" target=3D"_blank">https://b=
uildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_p=
ackages</a><br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#outside-br-cu=
stom" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads/=
manual/manual.html#outside-br-custom</a><br>
</blockquote><div>=C2=A0</div><div>I should have clarified that the same CM=
ake-based superbuild project is used to compile desktop versions of the sam=
e app for development purposes. All the (permissive-licenced) dependencies =
are statically linked to avoid headaches where the desktop&#39;s dynamic li=
braries are used instead of the ones intended for the app. As I&#39;m sure =
you know, the edit/run/debug cycle is much faster when it doesn&#39;t have =
to be uploaded and remotely debugged on an embedded device.</div><div><br><=
/div><div>Nonetheless, I&#39;ll consider your advice and will check if the =
CMake superbuild of our app can be hooked into a BR2_EXTERNAL cmake package=
 instead of a post-build script. Thank you.<br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">So create a separate buildroot p=
ackage for those dependencies that your main<br>
package selects.<br>
<br>
Use the cmake package infrastructure instead of trying to use cmake to down=
load<br>
the dependency.<br></blockquote><div><br></div><div>Again, the same CMake s=
uperbuild is used for desktop builds and I don&#39;t want to duplicate all =
that effort into equivalent buildroot cmake packages. Sorry for not making =
clearer the dual purpose of our CMake superbuild.<br></div></div></div>

--000000000000f88ca605dc045af8--

--===============5482939091753093520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5482939091753093520==--
