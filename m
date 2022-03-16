Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D715C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 19:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1959740018;
	Wed, 16 Mar 2022 19:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlT3mIx7Crar; Wed, 16 Mar 2022 19:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 515B640204;
	Wed, 16 Mar 2022 19:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A213D1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9663684147
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJpZNVsffhRZ for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 19:52:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 418C684145
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 19:52:01 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q5so4503980ljb.11
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJDeSXmZZeXKjEWpzOzLnu1zcpQJk1muw18DfLyGemI=;
 b=iF2FwPGyOPFBicQeagcANVkmcPCiCtt+aubmT8ewRqYOeoM+RZy1UutcwIUisx/+Ki
 EyBqobszcZTQaMDVJS7j7mg4VmNhnnluioLYur4JMpTgkX7IVUAL/9FbPIZBpODc+QUE
 +69YN2XtAto/L5xD0yoHKiRm+tnrpQSOwPhwjnqXDc5dk0q/miCVDQtFjcNJec+yjOoe
 63TvvvC99IAUUUCwuFSj5/IMOyokf1IU/rxYE9+67JEYPKArAROM3sOKKVMhNckJaQX0
 SwIr8TT+IntI4RZICD1o3PXsIrQhwJBXTDvoZxW7hrTDd6hXZNNk1y2+wFE0Lj8BCDpe
 BhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJDeSXmZZeXKjEWpzOzLnu1zcpQJk1muw18DfLyGemI=;
 b=WR3Hi8e37O38W5y36+T9K1zfsE+8sqO4lMNAJBsN26cnQ2wrWp0gUJxS7dUup2Frfq
 uPSHK1yPdvt5KFCAqhlQPS9TmeM8tceE2610wU4IAm5IEU/QAWcRWy1W1PkwdsN2fhoD
 NRdyI8Z40hYHmR9GoZ4Hb+hfv1yabjw5Jc2hQJxxDzvsrccpbR2yLGkaaXtEkhYPpE5W
 UxlIXkT8sm7jLgUGp+Sf4Vj7uj8DqfCS5HynDbJ6QSMi3k6jOAoLvfXX8Y5wg4Jb+cCK
 udQUaOBiSBqmzlzMdUU6M1H9bPKyINulOolEx2tLe15a244fwQeKh3qqB4MGLAMl8pqM
 R76w==
X-Gm-Message-State: AOAM533u9Fq3uru1IORTOiHPJKatOW5oNrTrLW2dBaowdhG9SNuVFK78
 9vibAvy3RVlJU6NoMTnH1IwrEPCi+TVMHLHvFkE=
X-Google-Smtp-Source: ABdhPJwbk0RMBw3a6QQquw3yAZXO92fTqW3k5Hg8sv9K/g3XqkEnqgKlsJLSaraHMKJLw/v8iE4MsIdUjjOFMNWMyoo=
X-Received: by 2002:a05:651c:2dc:b0:247:e451:48ae with SMTP id
 f28-20020a05651c02dc00b00247e45148aemr765038ljo.248.1647460318917; Wed, 16
 Mar 2022 12:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHYcJGqtHhDF7zKDak-+V2w_=PmbL5T7iB7P7ZV-paMbkWBBVA@mail.gmail.com>
 <CAHYcJGq5iFY-nLz5YYvcGZPgJ1HoYRVF-xdM8OHcrnWvu__u7g@mail.gmail.com>
 <20220316193558.11caac5b@gmx.net>
 <CAHYcJGqRkrG9mCSMydrOojaz8Cp8GSZW557DZNK8Rgscn=nj7A@mail.gmail.com>
 <20220316204922.47f51090@gmx.net>
In-Reply-To: <20220316204922.47f51090@gmx.net>
From: Avijit Das <avijitnsec@gmail.com>
Date: Wed, 16 Mar 2022 13:51:48 -0600
Message-ID: <CAHYcJGoF5x7HQV1NRsyi0EDnD0khi9CMzLkZz0oR=ofcyBr-9w@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] Not able to enable GUI library on Buildroot
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============3131827650369938683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3131827650369938683==
Content-Type: multipart/alternative; boundary="0000000000001737bd05da5b3f93"

--0000000000001737bd05da5b3f93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

Yes, I have tried X11 and Wayland both. Thanks for trying out. I'll keep
trying. Will keep you posted.

Thanks,
Avijit

On Wed, Mar 16, 2022 at 1:49 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Avijit,
>
> please keep buildroot@busybox.net in CC
>
> On Wed, 16 Mar 2022 12:39:04 -0600, Avijit Das <avijitnsec@gmail.com>
> wrote:
>
> > Hi Peter,
> >
> > I have compiled the X11 library when I got this error.
> >
> > make xlib_libX11 && make
>
> So the gtk3 compile/test was from another defconfig?
>
> Did you start the X11 server before running the gtk3-demo?
>
> But not much run-time help/advice from my side as I have no suitable
> hardware
> for testing myself...
>
> Regards,
> Peter
>
>
> >
> > Thanks,
> > Avijit
> >
> > On Wed, Mar 16, 2022 at 12:36 PM Peter Seiderer <ps.report@gmx.net>
> wrote:
> >
> > > Hello Avijit,
> > >
> > > On Tue, 15 Mar 2022 19:04:02 -0600, Avijit Das <avijitnsec@gmail.com>
> > > wrote:
> > >
> > > > Hi,
> > > >
> > > > I am building Buildroot for an imx8mm board. The HDMI display is up=
.
> I
> > > > validated the display using the fb-test. I am trying to enable a
> graphics
> > > > library, either gtk3 or qt5.
> > > >
> > > > *gtk3 *
> > > > When I am enabling the gtk3 library, if I run the demo application,
> I am
> > > > getting the following error.
> > > >
> > > > # /usr/bin/gtk3-demo
> > > >
> > > > (gtk3-demo:350): Gtk-WARNING **: 01:21:03.518: cannot open display:
> > > > #
> > > >
> > > > I have tried setting the display to localhost:0.0, did not work.
> > > >
> > > > *QT5*
> > > > The widget library is not building. There is a compilation error:
> > > >
> > > > qkeyeventtransition.o .obj/qmouseeventtransition.o
> > > > .obj/qbasickeyeventtransition.o .obj/qbasicmouseeventtransition.o
> > > > .obj/qgraphicseffect.o .obj/qpixmapfilter.o .obj/qrc_qstyle.o
> > > > .obj/qrc_qmessagebox.o .obj/moc_qwidgetrepaintmanager_p.o
> > > > .obj/moc_qwidget_p.o .obj/moc_qpixmapstyle_p.o  -latomic
> > > >
> > >
> /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f37=
78f293adefe/lib/libQt5Gui.so
>
> > > >
> > >
> /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f37=
78f293adefe/lib/libQt5Core.so
>
> > > > -lpthread  -lrt -lpthread -ldl
> > > > ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so
> > > > ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5
> > > > ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5.15
> > > > rm -f ../../lib/libQt5Widgets.so.5.15.8
> > > > mv -f libQt5Widgets.so.5.15.8 ../../lib/libQt5Widgets.so.5.15.8
> > > > rm -f ../../lib/libQt5Widgets.so
> > > > rm -f ../../lib/libQt5Widgets.so.5
> > > > rm -f ../../lib/libQt5Widgets.so.5.15
> > > > mv -f libQt5Widgets.so ../../lib/libQt5Widgets.so
> > > > mv -f libQt5Widgets.so.5 ../../lib/libQt5Widgets.so.5
> > > > mv -f libQt5Widgets.so.5.15 ../../lib/libQt5Widgets.so.5.15
> > > > make[2]: *** [Makefile:51: sub-src-make_first] Error 2
> > > > make[1]: *** [package/pkg-generic.mk:292:
> > > >
> > >
> /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f37=
78f293adefe/.stamp_built]
>
> > > > Error 2
> > > > make: *** [Makefile:84: _all] Error 2
> > > >
> > > > I have attached the config file. Can you please suggest?
> > >
> > > With your defconfig I get the following error (a lot of lines above i=
n
> the
> > > log):
> > >
> > >   qeglconvenience.cpp: In function =E2=80=98bool q_hasEglExtension(EG=
LDisplay,
> > > const char*)=E2=80=99:
> > >   qeglconvenience.cpp:418:23: error: variable =E2=80=98QList<QByteArr=
ay>
> > > extensions=E2=80=99 has initializer but incomplete type
> > >     418 |     QList<QByteArray> extensions =3D
> > >         |                       ^~~~~~~~~~
> > >   qeglconvenience.cpp:420:65: error: invalid use of incomplete type
> =E2=80=98class
> > > QList<QByteArray>=E2=80=99
> > >     420 |             (eglQueryString(display,
> EGL_EXTENSIONS))).split('
> > > ');
> > >         |
> > >
> > >
> > > This can be (compile) fixed by this (buildroot) patch:
> > >
> > >
> > >
> https://patchwork.ozlabs.org/project/buildroot/patch/20220316182440.17393=
-1-ps.report@gmx.net/
> > >
> > >
> > > Despite of this error I get (with your provided defconfig):
> > >
> > >   [4/5] Compiling C object src/libepoxy.so.0.0.0.p/dispatch_common.c.=
o
> > >   FAILED: src/libepoxy.so.0.0.0.p/dispatch_common.c.o
> > >   .../host/bin/aarch64-buildroot-linux-gnu-gcc
> -Isrc/libepoxy.so.0.0.0.p
> > > -Isrc -I../src -Iinclude -I../include -Iinclude/epoxy
> > > -fdiagnostics-color=3Dalways -Wall -Winvalid-pch -std=3Dgnu99 -O3
> > > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -O=
s
> -g0
> > > -fPIC -Wpointer-arith -Wmissing-declarations -Wformat=3D2
> -Wstrict-prototypes
> > > -Wmissing-prototypes -Wnested-externs -Wbad-function-cast
> > > -Wold-style-definition -Wdeclaration-after-statement -Wunused
> > > -Wuninitialized -Wshadow -Wmissing-noreturn -Wmissing-format-attribut=
e
> > > -Wredundant-decls -Wlogical-op -Werror=3Dimplicit -Werror=3Dnonnull
> > > -Werror=3Dinit-self -Werror=3Dmain -Werror=3Dmissing-braces
> > > -Werror=3Dsequence-point -Werror=3Dreturn-type -Werror=3Dtrigraphs
> > > -Werror=3Darray-bounds -Werror=3Dwrite-strings -Werror=3Daddress
> > > -Werror=3Dint-to-pointer-cast -Werror=3Dpointer-to-int-cast
> > > -fno-strict-aliasing -Wno-int-conversion -fvisibility=3Dhidden -MD -M=
Q
> > > src/libepoxy.so.0.0.0.p/dispatch_common.c.o -MF
> > > src/libepoxy.so.0.0.0.p/dispatch_common.c.o.d -o
> > > src/libepoxy.so.0.0.0.p/dispatch_common.c.o -c ../src/dispatch_common=
.c
> > >   In file included from include/epoxy/egl_generated.h:11,
> > >                    from ../include/epoxy/egl.h:46,
> > >                    from ../src/dispatch_common.h:59,
> > >                    from ../src/dispatch_common.c:174:
> > >
> > >
> .../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.=
h:145:10:
> > > fatal error: X11/Xlib.h: No such file or directory
> > >     145 | #include <X11/Xlib.h>
> > >         |          ^~~~~~~~~~~~
> > >   compilation terminated.
> > >   ninja: build stopped: subcommand failed.
> > >   make[1]: *** [package/pkg-generic.mk:292:
> > >
> /home/seiderer/Work/Buildroot/build_imx8mmevk_qt5_001/build/libepoxy-1.5.=
9/.stamp_built]
> > > Error 1
> > >   make: *** [Makefile:23: _all] Error 2
> > >
> > > Regards,
> > > Peter
> > >
> > > >
> > > > Thanks,
> > > > Avijit
> > >
> > >
>
>

--0000000000001737bd05da5b3f93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello=C2=A0Peter,</div><div><br></div>Yes, I have tri=
ed X11 and Wayland both. Thanks for trying out. I&#39;ll keep trying. Will =
keep you posted.<div><br></div><div>Thanks,</div><div>Avijit</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, M=
ar 16, 2022 at 1:49 PM Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.n=
et">ps.report@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hello Avijit,<br>
<br>
please keep <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buil=
droot@busybox.net</a> in CC<br>
<br>
On Wed, 16 Mar 2022 12:39:04 -0600, Avijit Das &lt;<a href=3D"mailto:avijit=
nsec@gmail.com" target=3D"_blank">avijitnsec@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Peter,<br>
&gt; <br>
&gt; I have compiled the X11 library when I got this error.<br>
&gt; <br>
&gt; make xlib_libX11 &amp;&amp; make<br>
<br>
So the gtk3 compile/test was from another defconfig?<br>
<br>
Did you start the X11 server before running the gtk3-demo?<br>
<br>
But not much run-time help/advice from my side as I have no suitable hardwa=
re<br>
for testing myself...<br>
<br>
Regards,<br>
Peter<br>
<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Avijit<br>
&gt; <br>
&gt; On Wed, Mar 16, 2022 at 12:36 PM Peter Seiderer &lt;<a href=3D"mailto:=
ps.report@gmx.net" target=3D"_blank">ps.report@gmx.net</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hello Avijit,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 15 Mar 2022 19:04:02 -0600, Avijit Das &lt;<a href=3D"mai=
lto:avijitnsec@gmail.com" target=3D"_blank">avijitnsec@gmail.com</a>&gt;<br=
>
&gt; &gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I am building Buildroot for an imx8mm board. The HDMI displa=
y is up. I<br>
&gt; &gt; &gt; validated the display using the fb-test. I am trying to enab=
le a graphics<br>
&gt; &gt; &gt; library, either gtk3 or qt5.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; *gtk3 *<br>
&gt; &gt; &gt; When I am enabling the gtk3 library, if I run the demo appli=
cation, I am<br>
&gt; &gt; &gt; getting the following error.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; # /usr/bin/gtk3-demo<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; (gtk3-demo:350): Gtk-WARNING **: 01:21:03.518: cannot open d=
isplay:<br>
&gt; &gt; &gt; #<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have tried setting the display to localhost:0.0, did not w=
ork.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; *QT5*<br>
&gt; &gt; &gt; The widget library is not building. There is a compilation e=
rror:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; qkeyeventtransition.o .obj/qmouseeventtransition.o<br>
&gt; &gt; &gt; .obj/qbasickeyeventtransition.o .obj/qbasicmouseeventtransit=
ion.o<br>
&gt; &gt; &gt; .obj/qgraphicseffect.o .obj/qpixmapfilter.o .obj/qrc_qstyle.=
o<br>
&gt; &gt; &gt; .obj/qrc_qmessagebox.o .obj/moc_qwidgetrepaintmanager_p.o<br=
>
&gt; &gt; &gt; .obj/moc_qwidget_p.o .obj/moc_qpixmapstyle_p.o=C2=A0 -latomi=
c<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dc=
a73e6f3778f293adefe/lib/libQt5Gui.so=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dc=
a73e6f3778f293adefe/lib/libQt5Core.so=C2=A0 <br>
&gt; &gt; &gt; -lpthread=C2=A0 -lrt -lpthread -ldl<br>
&gt; &gt; &gt; ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so<br>
&gt; &gt; &gt; ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5<br>
&gt; &gt; &gt; ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5.15<br>
&gt; &gt; &gt; rm -f ../../lib/libQt5Widgets.so.5.15.8<br>
&gt; &gt; &gt; mv -f libQt5Widgets.so.5.15.8 ../../lib/libQt5Widgets.so.5.1=
5.8<br>
&gt; &gt; &gt; rm -f ../../lib/libQt5Widgets.so<br>
&gt; &gt; &gt; rm -f ../../lib/libQt5Widgets.so.5<br>
&gt; &gt; &gt; rm -f ../../lib/libQt5Widgets.so.5.15<br>
&gt; &gt; &gt; mv -f libQt5Widgets.so ../../lib/libQt5Widgets.so<br>
&gt; &gt; &gt; mv -f libQt5Widgets.so.5 ../../lib/libQt5Widgets.so.5<br>
&gt; &gt; &gt; mv -f libQt5Widgets.so.5.15 ../../lib/libQt5Widgets.so.5.15<=
br>
&gt; &gt; &gt; make[2]: *** [Makefile:51: sub-src-make_first] Error 2<br>
&gt; &gt; &gt; make[1]: *** [package/<a href=3D"http://pkg-generic.mk:292" =
rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk:292</a>:<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dc=
a73e6f3778f293adefe/.stamp_built]=C2=A0 <br>
&gt; &gt; &gt; Error 2<br>
&gt; &gt; &gt; make: *** [Makefile:84: _all] Error 2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have attached the config file. Can you please suggest?=C2=
=A0 <br>
&gt; &gt;<br>
&gt; &gt; With your defconfig I get the following error (a lot of lines abo=
ve in the<br>
&gt; &gt; log):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0qeglconvenience.cpp: In function =E2=80=98bool q_hasE=
glExtension(EGLDisplay,<br>
&gt; &gt; const char*)=E2=80=99:<br>
&gt; &gt;=C2=A0 =C2=A0qeglconvenience.cpp:418:23: error: variable =E2=80=98=
QList&lt;QByteArray&gt;<br>
&gt; &gt; extensions=E2=80=99 has initializer but incomplete type<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0418 |=C2=A0 =C2=A0 =C2=A0QList&lt;QByteArray&g=
t; extensions =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br>
&gt; &gt;=C2=A0 =C2=A0qeglconvenience.cpp:420:65: error: invalid use of inc=
omplete type =E2=80=98class<br>
&gt; &gt; QList&lt;QByteArray&gt;=E2=80=99<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0420 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(eglQueryString(display, EGL_EXTENSIONS))).split(&#39;<br>
&gt; &gt; &#39;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This can be (compile) fixed by this (buildroot) patch:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2=
0220316182440.17393-1-ps.report@gmx.net/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchwork.ozlabs.org/project/buildroot/patch/20220316182440.173=
93-1-ps.report@gmx.net/</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Despite of this error I get (with your provided defconfig):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0[4/5] Compiling C object src/libepoxy.so.0.0.0.p/disp=
atch_common.c.o<br>
&gt; &gt;=C2=A0 =C2=A0FAILED: src/libepoxy.so.0.0.0.p/dispatch_common.c.o<b=
r>
&gt; &gt;=C2=A0 =C2=A0.../host/bin/aarch64-buildroot-linux-gnu-gcc -Isrc/li=
bepoxy.so.0.0.0.p<br>
&gt; &gt; -Isrc -I../src -Iinclude -I../include -Iinclude/epoxy<br>
&gt; &gt; -fdiagnostics-color=3Dalways -Wall -Winvalid-pch -std=3Dgnu99 -O3=
<br>
&gt; &gt; -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 -Os -g0<br>
&gt; &gt; -fPIC -Wpointer-arith -Wmissing-declarations -Wformat=3D2 -Wstric=
t-prototypes<br>
&gt; &gt; -Wmissing-prototypes -Wnested-externs -Wbad-function-cast<br>
&gt; &gt; -Wold-style-definition -Wdeclaration-after-statement -Wunused<br>
&gt; &gt; -Wuninitialized -Wshadow -Wmissing-noreturn -Wmissing-format-attr=
ibute<br>
&gt; &gt; -Wredundant-decls -Wlogical-op -Werror=3Dimplicit -Werror=3Dnonnu=
ll<br>
&gt; &gt; -Werror=3Dinit-self -Werror=3Dmain -Werror=3Dmissing-braces<br>
&gt; &gt; -Werror=3Dsequence-point -Werror=3Dreturn-type -Werror=3Dtrigraph=
s<br>
&gt; &gt; -Werror=3Darray-bounds -Werror=3Dwrite-strings -Werror=3Daddress<=
br>
&gt; &gt; -Werror=3Dint-to-pointer-cast -Werror=3Dpointer-to-int-cast<br>
&gt; &gt; -fno-strict-aliasing -Wno-int-conversion -fvisibility=3Dhidden -M=
D -MQ<br>
&gt; &gt; src/libepoxy.so.0.0.0.p/dispatch_common.c.o -MF<br>
&gt; &gt; src/libepoxy.so.0.0.0.p/dispatch_common.c.o.d -o<br>
&gt; &gt; src/libepoxy.so.0.0.0.p/dispatch_common.c.o -c ../src/dispatch_co=
mmon.c<br>
&gt; &gt;=C2=A0 =C2=A0In file included from include/epoxy/egl_generated.h:1=
1,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 from ../include/epoxy/egl.h:46,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 from ../src/dispatch_common.h:59,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 from ../src/dispatch_common.c:174:<br>
&gt; &gt;<br>
&gt; &gt; .../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglp=
latform.h:145:10:<br>
&gt; &gt; fatal error: X11/Xlib.h: No such file or directory<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0145 | #include &lt;X11/Xlib.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~<br>
&gt; &gt;=C2=A0 =C2=A0compilation terminated.<br>
&gt; &gt;=C2=A0 =C2=A0ninja: build stopped: subcommand failed.<br>
&gt; &gt;=C2=A0 =C2=A0make[1]: *** [package/<a href=3D"http://pkg-generic.m=
k:292" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk:292</a>:<br>
&gt; &gt; /home/seiderer/Work/Buildroot/build_imx8mmevk_qt5_001/build/libep=
oxy-1.5.9/.stamp_built]<br>
&gt; &gt; Error 1<br>
&gt; &gt;=C2=A0 =C2=A0make: *** [Makefile:23: _all] Error 2<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Peter<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; Avijit=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 <br>
<br>
</blockquote></div>

--0000000000001737bd05da5b3f93--

--===============3131827650369938683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3131827650369938683==--
