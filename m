Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B45860D88;
	Wed,  4 May 2022 20:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9qp52rhUkzI; Wed,  4 May 2022 20:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF4060B35;
	Wed,  4 May 2022 20:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82C0C1BF3D2
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF9583F47
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 20:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5CbnI7_MJuz for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 20:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C39D83F4C
 for <buildroot@buildroot.org>; Wed,  4 May 2022 20:40:36 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id j6so2014764pfe.13
 for <buildroot@buildroot.org>; Wed, 04 May 2022 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gvs8pduic9HhPNLHlFRuwiTLM2oM7zSdiGTEt30Evg=;
 b=I2yH8ZoZSwIo/lDVE2r5HJaxlcdSErtCW3x1kizR3dT0Y9aiDsjR8Nim+61GPo5y8t
 ozgHQk+G2E0Ncg7WaPP3ZUf2weeN2AYa/AtkdDmXDx8a2wM4pfa0wUnT+bcVnz8J5Npw
 5Kfk4J+cDctYN0mcvYFTxMx8wVX8ih4zeWdRFmWKKCedC1JRToXCdDXW1xMeq5JXKc97
 IQ81kVCjyv7B3nT1kkf0Cf2P8YDaXFPWTkFdcvDu3tGzNa3RJf89PyuWis5UEecb7p67
 dvt3MJ8nKKQlAVG/pwR7UWB5hexL1aVtKj95PA8S9MUV08AOrARGtp0gLf26OBe/kPhg
 iUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gvs8pduic9HhPNLHlFRuwiTLM2oM7zSdiGTEt30Evg=;
 b=NK7MIuFrpM/NTDQfR0oX/pLFi82wf1fEtzArM1PNVt0e0vI5cdZ5kYbqbHsZmeNJ6Y
 UxWy+b7dgKarYRRGEjtpa2ZdAZhrmlTpkHNUnLlWpD2s/w803At7orrZgT3tCe10ldSP
 uufgzkbFasQqHhZlzvRBGJD3O5AgI6CcFF+YwlXx8I/EF6n84s9OYecCuLewKi4ejq19
 Rw6r87Hmu+t+m5LGKwlpfI8B/Z0FiFst+UKtSVfvev33g094t57kaRTZa9kA1KQ0A0wA
 WFmp+OQYx9nVTuNIjaBcCGX6Q7sUx98aUDpw/tm6PABdNVUYXPzECGBzyqYX7P3FxO7o
 CeyA==
X-Gm-Message-State: AOAM533982ofS8oB27lMwzlCQRnbhLGzEByLBhKtzdSolQ7Wb4upGTAa
 h6WkbowkoFMMGuR8zSku4PYzIKR0WTrDSLwey/vTF2ug
X-Google-Smtp-Source: ABdhPJz73TQpMmklPYpB7pBGeVXX/RnQu409bg8fqlnlD6FkP3xxJ5Pv7AYwJBkGuBrnWzFqQd0TcjOhoml+H2N+6y4=
X-Received: by 2002:a65:4cce:0:b0:3c2:6d66:f141 with SMTP id
 n14-20020a654cce000000b003c26d66f141mr9131339pgt.173.1651696835845; Wed, 04
 May 2022 13:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220504164214.1095968-1-yannick.brosseau@gmail.com>
 <c9105461-815a-c212-2afc-4c175467b424@mind.be>
In-Reply-To: <c9105461-815a-c212-2afc-4c175467b424@mind.be>
From: "Brosseau, Yannick" <yannick.brosseau@gmail.com>
Date: Wed, 4 May 2022 16:40:24 -0400
Message-ID: <CAEzWAeLcsFN2t5e5BiDLVAUP9+R6Hefn-XnNdNO3icNxSQO-9Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/openocd: Fix segfault when using
 ST-Link driver
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7030696316599541539=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7030696316599541539==
Content-Type: multipart/alternative; boundary="0000000000002d647305de35a36b"

--0000000000002d647305de35a36b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2022 at 3:36 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 04/05/2022 18:42, Yannick Brosseau wrote:
> > Recent changes in libusb have exposed a bug in OpenOCD which now crash
> when trying
> > to use the ST-Link driver.
> >
> > Upstream has a fix as commit cff0e417da58adef1ceef9a63a99412c2cc87ff3.
> This add the commit
> > as a stand alone patch.
> >
> > Should be removed when OpenOCD is updated to a newer release than 0.11
>
> Add a Signed-off-by line for yourself.  This is a short way for you to
> assert that you are entitled to contribute the patch under buildroot's
> GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
> for more details.
>
>
I forgot about this one.


> > ---
> >   ...GV-with-libusb-v1.0.24-33-g32a2206-1.patch | 88 ++++++++++++++++++=
+
> >   1 file changed, 88 insertions(+)
> >   create mode 100644
> package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206-1=
.patch
> >
> > diff --git
> a/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206=
-1.patch
> b/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206=
-1.patch
> > new file mode 100644
> > index 0000000000..5de3c91fbe
> > --- /dev/null
> > +++
> b/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g32a2206=
-1.patch
> > @@ -0,0 +1,88 @@
> > +From cff0e417da58adef1ceef9a63a99412c2cc87ff3 Mon Sep 17 00:00:00 2001
> > +From: Antonio Borneo <borneo.antonio@gmail.com>
> > +Date: Wed, 23 Jun 2021 16:52:16 +0200
> > +Subject: [PATCH] stlink: fix SIGSEGV with libusb v1.0.24-33-g32a2206
> (11618)
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +The stlink driver incorrectly uses a NULL pointer for libusb's
> > +struct libusb_context.
> > +The correct value to be used is local in libusb_helper.c.
> > +
> > +Move in the helper file, in a wrapper function, the only call that
> > +requires the above value, and let stlink driver to use this
> > +wrapper.
> > +
> > +This issue has not triggered any visible problem until a code
> > +refactoring [1] in libusb has made OpenOCD crashing on Windows and
> > +on MacOS.
>
>   I guess not only Windows and MacOS but also Linux, otherwise you
> wouldn't have
> sent this, right?
>

Indeed, was also failing on Linux. I'll add a note to make it clear.


>
> > +
> > +Change-Id: Id1818c8af7cf0d4d17dfa1d22aad079da01ef740
> > +Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
> > +Fixes: https://sourceforge.net/p/openocd/tickets/308/
> > +Fixes: https://github.com/libusb/libusb/issues/928/
> > +Fixes: 42d8fa899c6a ("stlink_usb: Submit multiple USB URBs at once to
> improve performance")
> > +Link: [1] https://github.com/libusb/libusb/commit/32a22069428c
> > +Reported-by: Andrzej Sier=C5=BC=C4=99ga <asier70@gmail.com>
> > +Co-developed-by: Andrzej Sier=C5=BC=C4=99ga <asier70@gmail.com>
> > +Co-developed-by: Xiaofan Chen <xiaofanc@gmail.com>
> > +Reviewed-on: http://openocd.zylin.com/6331
> > +Tested-by: jenkins
> > +Reviewed-by: Marc Schink <dev@zapb.de>
> > +Reviewed-by: Xiaofan <xiaofanc@gmail.com>
> > +Reviewed-by: Andrzej Sier=C5=BC=C4=99ga <asier70@gmail.com>
> > +Reviewed-by: Oleksij Rempel <linux@rempel-privat.de>
> > +Reviewed-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
>
>   Here, you need to add your Signed-off-by as well. This is needed becaus=
e
> the
> package license may be different from Buildroot's, and the patch takes th=
e
> package's license.
>
>
But did not know about that one. Interesting.

Will update and resend.

Yannick



>   Regards,
>   Arnout
>
> > +---
> > + src/jtag/drivers/libusb_helper.c | 5 +++++
> > + src/jtag/drivers/libusb_helper.h | 1 +
> > + src/jtag/drivers/stlink_usb.c    | 7 +------
> > + 3 files changed, 7 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/src/jtag/drivers/libusb_helper.c
> b/src/jtag/drivers/libusb_helper.c
> > +index f0122d534..18fe4bad4 100644
> > +--- a/src/jtag/drivers/libusb_helper.c
> > ++++ b/src/jtag/drivers/libusb_helper.c
> > +@@ -363,3 +363,8 @@ int jtag_libusb_get_pid(struct libusb_device *dev,
> uint16_t *pid)
> > +
> > +     return ERROR_FAIL;
> > + }
> > ++
> > ++int jtag_libusb_handle_events_completed(int *completed)
> > ++{
> > ++    return libusb_handle_events_completed(jtag_libusb_context,
> completed);
> > ++}
> > +diff --git a/src/jtag/drivers/libusb_helper.h
> b/src/jtag/drivers/libusb_helper.h
> > +index fa7d06e28..3e77865d6 100644
> > +--- a/src/jtag/drivers/libusb_helper.h
> > ++++ b/src/jtag/drivers/libusb_helper.h
> > +@@ -60,5 +60,6 @@ int jtag_libusb_choose_interface(struct
> libusb_device_handle *devh,
> > +             unsigned int *usb_write_ep,
> > +             int bclass, int subclass, int protocol, int trans_type);
> > + int jtag_libusb_get_pid(struct libusb_device *dev, uint16_t *pid);
> > ++int jtag_libusb_handle_events_completed(int *completed);
> > +
> > + #endif /* OPENOCD_JTAG_DRIVERS_LIBUSB_HELPER_H */
> > +diff --git a/src/jtag/drivers/stlink_usb.c
> b/src/jtag/drivers/stlink_usb.c
> > +index c68bbb3ca..7b1932b9f 100644
> > +--- a/src/jtag/drivers/stlink_usb.c
> > ++++ b/src/jtag/drivers/stlink_usb.c
> > +@@ -497,13 +497,8 @@ static void
> sync_transfer_wait_for_completion(struct libusb_transfer *transfer)
> > + {
> > +     int r, *completed =3D transfer->user_data;
> > +
> > +-    /* Assuming a single libusb context exists.  There no existing
> interface into this
> > +-     * module to pass a libusb context.
> > +-     */
> > +-    struct libusb_context *ctx =3D NULL;
> > +-
> > +     while (!*completed) {
> > +-            r =3D libusb_handle_events_completed(ctx, completed);
> > ++            r =3D jtag_libusb_handle_events_completed(completed);
> > +             if (r < 0) {
> > +                     if (r =3D=3D LIBUSB_ERROR_INTERRUPTED)
> > +                             continue;
> > +--
> > +2.35.1
> > +
>

--0000000000002d647305de35a36b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 4, 2022 at 3:36 PM Arnout=
 Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 04/05/2022 18:42, Yannick Brosseau wrote:<br>
&gt; Recent changes in libusb have exposed a bug in OpenOCD which now crash=
 when trying<br>
&gt; to use the ST-Link driver.<br>
&gt; <br>
&gt; Upstream has a fix as commit cff0e417da58adef1ceef9a63a99412c2cc87ff3.=
 This add the commit<br>
&gt; as a stand alone patch.<br>
&gt; <br>
&gt; Should be removed when OpenOCD is updated to a newer release than 0.11=
<br>
<br>
Add a Signed-off-by line for yourself.=C2=A0 This is a short way for you to=
<br>
assert that you are entitled to contribute the patch under buildroot&#39;s<=
br>
GPL license.=C2=A0 See=C2=A0 <a href=3D"http://elinux.org/Developer_Certifi=
cate_Of_Origin" rel=3D"noreferrer" target=3D"_blank">http://elinux.org/Deve=
loper_Certificate_Of_Origin</a><br>
for more details.<br>
<br></blockquote><div><br></div><div>I forgot about this one.=C2=A0</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 =C2=A0...GV-with-libusb-v1.0.24-33-g32a2206-1.patch | 88 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 88 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/openocd/0003-stlink-fix-SIGSEGV=
-with-libusb-v1.0.24-33-g32a2206-1.patch<br>
&gt; <br>
&gt; diff --git a/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.=
24-33-g32a2206-1.patch b/package/openocd/0003-stlink-fix-SIGSEGV-with-libus=
b-v1.0.24-33-g32a2206-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5de3c91fbe<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/openocd/0003-stlink-fix-SIGSEGV-with-libusb-v1.0.24-33-g=
32a2206-1.patch<br>
&gt; @@ -0,0 +1,88 @@<br>
&gt; +From cff0e417da58adef1ceef9a63a99412c2cc87ff3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Antonio Borneo &lt;<a href=3D"mailto:borneo.antonio@gmail.com" =
target=3D"_blank">borneo.antonio@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 23 Jun 2021 16:52:16 +0200<br>
&gt; +Subject: [PATCH] stlink: fix SIGSEGV with libusb v1.0.24-33-g32a2206 =
(11618)<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +The stlink driver incorrectly uses a NULL pointer for libusb&#39;s<br=
>
&gt; +struct libusb_context.<br>
&gt; +The correct value to be used is local in libusb_helper.c.<br>
&gt; +<br>
&gt; +Move in the helper file, in a wrapper function, the only call that<br=
>
&gt; +requires the above value, and let stlink driver to use this<br>
&gt; +wrapper.<br>
&gt; +<br>
&gt; +This issue has not triggered any visible problem until a code<br>
&gt; +refactoring [1] in libusb has made OpenOCD crashing on Windows and<br=
>
&gt; +on MacOS.<br>
<br>
=C2=A0 I guess not only Windows and MacOS but also Linux, otherwise you wou=
ldn&#39;t have <br>
sent this, right?<br></blockquote><div><br></div><div>Indeed, was also fail=
ing on Linux. I&#39;ll add a note to make it clear.=C2=A0</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +Change-Id: Id1818c8af7cf0d4d17dfa1d22aad079da01ef740<br>
&gt; +Signed-off-by: Antonio Borneo &lt;<a href=3D"mailto:borneo.antonio@gm=
ail.com" target=3D"_blank">borneo.antonio@gmail.com</a>&gt;<br>
&gt; +Fixes: <a href=3D"https://sourceforge.net/p/openocd/tickets/308/" rel=
=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/openocd/tickets=
/308/</a><br>
&gt; +Fixes: <a href=3D"https://github.com/libusb/libusb/issues/928/" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/libusb/libusb/issues/9=
28/</a><br>
&gt; +Fixes: 42d8fa899c6a (&quot;stlink_usb: Submit multiple USB URBs at on=
ce to improve performance&quot;)<br>
&gt; +Link: [1] <a href=3D"https://github.com/libusb/libusb/commit/32a22069=
428c" rel=3D"noreferrer" target=3D"_blank">https://github.com/libusb/libusb=
/commit/32a22069428c</a><br>
&gt; +Reported-by: Andrzej Sier=C5=BC=C4=99ga &lt;<a href=3D"mailto:asier70=
@gmail.com" target=3D"_blank">asier70@gmail.com</a>&gt;<br>
&gt; +Co-developed-by: Andrzej Sier=C5=BC=C4=99ga &lt;<a href=3D"mailto:asi=
er70@gmail.com" target=3D"_blank">asier70@gmail.com</a>&gt;<br>
&gt; +Co-developed-by: Xiaofan Chen &lt;<a href=3D"mailto:xiaofanc@gmail.co=
m" target=3D"_blank">xiaofanc@gmail.com</a>&gt;<br>
&gt; +Reviewed-on: <a href=3D"http://openocd.zylin.com/6331" rel=3D"norefer=
rer" target=3D"_blank">http://openocd.zylin.com/6331</a><br>
&gt; +Tested-by: jenkins<br>
&gt; +Reviewed-by: Marc Schink &lt;<a href=3D"mailto:dev@zapb.de" target=3D=
"_blank">dev@zapb.de</a>&gt;<br>
&gt; +Reviewed-by: Xiaofan &lt;<a href=3D"mailto:xiaofanc@gmail.com" target=
=3D"_blank">xiaofanc@gmail.com</a>&gt;<br>
&gt; +Reviewed-by: Andrzej Sier=C5=BC=C4=99ga &lt;<a href=3D"mailto:asier70=
@gmail.com" target=3D"_blank">asier70@gmail.com</a>&gt;<br>
&gt; +Reviewed-by: Oleksij Rempel &lt;<a href=3D"mailto:linux@rempel-privat=
.de" target=3D"_blank">linux@rempel-privat.de</a>&gt;<br>
&gt; +Reviewed-by: Andreas Fritiofson &lt;<a href=3D"mailto:andreas.fritiof=
son@gmail.com" target=3D"_blank">andreas.fritiofson@gmail.com</a>&gt;<br>
<br>
=C2=A0 Here, you need to add your Signed-off-by as well. This is needed bec=
ause the <br>
package license may be different from Buildroot&#39;s, and the patch takes =
the <br>
package&#39;s license.<br>
<br></blockquote><div><br></div><div>But did not know about that one. Inter=
esting.=C2=A0</div><div><br></div><div>Will update and resend.=C2=A0</div><=
div><br></div><div>Yannick</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +---<br>
&gt; + src/jtag/drivers/libusb_helper.c | 5 +++++<br>
&gt; + src/jtag/drivers/libusb_helper.h | 1 +<br>
&gt; + src/jtag/drivers/stlink_usb.c=C2=A0 =C2=A0 | 7 +------<br>
&gt; + 3 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/jtag/drivers/libusb_helper.c b/src/jtag/drivers/libu=
sb_helper.c<br>
&gt; +index f0122d534..18fe4bad4 100644<br>
&gt; +--- a/src/jtag/drivers/libusb_helper.c<br>
&gt; ++++ b/src/jtag/drivers/libusb_helper.c<br>
&gt; +@@ -363,3 +363,8 @@ int jtag_libusb_get_pid(struct libusb_device *dev=
, uint16_t *pid)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ERROR_FAIL;<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++int jtag_libusb_handle_events_completed(int *completed)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 return libusb_handle_events_completed(jtag_libusb_cont=
ext, completed);<br>
&gt; ++}<br>
&gt; +diff --git a/src/jtag/drivers/libusb_helper.h b/src/jtag/drivers/libu=
sb_helper.h<br>
&gt; +index fa7d06e28..3e77865d6 100644<br>
&gt; +--- a/src/jtag/drivers/libusb_helper.h<br>
&gt; ++++ b/src/jtag/drivers/libusb_helper.h<br>
&gt; +@@ -60,5 +60,6 @@ int jtag_libusb_choose_interface(struct libusb_devi=
ce_handle *devh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *usb_wri=
te_ep,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int bclass, int subcl=
ass, int protocol, int trans_type);<br>
&gt; + int jtag_libusb_get_pid(struct libusb_device *dev, uint16_t *pid);<b=
r>
&gt; ++int jtag_libusb_handle_events_completed(int *completed);<br>
&gt; +<br>
&gt; + #endif /* OPENOCD_JTAG_DRIVERS_LIBUSB_HELPER_H */<br>
&gt; +diff --git a/src/jtag/drivers/stlink_usb.c b/src/jtag/drivers/stlink_=
usb.c<br>
&gt; +index c68bbb3ca..7b1932b9f 100644<br>
&gt; +--- a/src/jtag/drivers/stlink_usb.c<br>
&gt; ++++ b/src/jtag/drivers/stlink_usb.c<br>
&gt; +@@ -497,13 +497,8 @@ static void sync_transfer_wait_for_completion(st=
ruct libusb_transfer *transfer)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int r, *completed =3D transfer-&gt;user_data;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 /* Assuming a single libusb context exists.=C2=A0 Ther=
e no existing interface into this<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* module to pass a libusb context.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +-=C2=A0 =C2=A0 struct libusb_context *ctx =3D NULL;<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (!*completed) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D libusb_handle_events=
_completed(ctx, completed);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D jtag_libusb_handle_e=
vents_completed(completed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r =3D=3D LIBUSB_ERROR_INTERRUPTED)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +--<br>
&gt; +2.35.1<br>
&gt; +<br>
</blockquote></div></div>

--0000000000002d647305de35a36b--

--===============7030696316599541539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7030696316599541539==--
