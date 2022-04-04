Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 08:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B91940114;
	Mon,  4 Apr 2022 08:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAd6GAY2TSEP; Mon,  4 Apr 2022 08:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F68D400D8;
	Mon,  4 Apr 2022 08:36:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3851BF3E3
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 08:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76531415BF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 08:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5P8eCINyTGB for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 08:36:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6672D408A3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 08:36:24 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 9so10364957iou.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 01:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AfXJ9+C9KO1h3f1HpwoQF/bXhM/g6IQ1XBYcH/zMZV0=;
 b=aHHXfOpDbJMPrAwQyK3aiAnzb5Cdx4ZNy+yrDSAS1g8daLJNmMKLCvidmUf2hXHdhD
 vZwrfl7D1D91BW9LSD4eMzJsDHbc478icJKrAEOG/kMayjf/XvJP+LYdAYYHW05vR4ZP
 PRz0ht2/cuWBb9Rm0EGu6Xm4Zfk7/MyONFlgQjZ5nVghfuiUdo79G5fnlQZ68g/ibWG9
 VgYLK3cuX11ea1O1+vJQz8WxsD/G9l72RRQeYWBWmZT6I2PU0fzcmpbgH+e/A+yk3j4B
 1lfFzYbqPvxBXSWwcCygw2+2pDRgsFqS1Bo8v+BqjNvZroPEl0mDKSLCGyiKM4cnF8JG
 FtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AfXJ9+C9KO1h3f1HpwoQF/bXhM/g6IQ1XBYcH/zMZV0=;
 b=NMwO4H9+xZWlvfd7qC8ayJnlrPo9ebEYwBn3DLhnJz2iylp6zOf/GQOksnSgesVOU/
 iSFQ0OHEVCvt601bB6hAi+dgIGQ6YamPvnjvyr+N3YFTw2a0MOfrJPCWFGjI+wLiErRn
 1B1WZmexIwxGveW4TGrT5YphwaHorFCORQRFEZ+qP5r3lrtPCW6mLZY1X0TZVLbHTaHQ
 NnAMO/YajoqW1DGkB7DJVxg+YvQnn2Vc6y8V+rMd2xW2C3XsmTQsogmwwtLmj1nPYkZm
 /UiUFgeuu9fwdfH8SIj4SF4PceKuC/GZgNVfbUDl2zvjGgvEH3oLqMcCT+Eb+G+WFZPu
 A/yQ==
X-Gm-Message-State: AOAM530iV8ZqCgGuBTtjZAnDe0mXI+pGb+jhWaBWGiT8kYD7BviUDGox
 +OeOTC5qYv0YecPY8rRUdp4pNi3909nPwtmGmPH2ervF8H4=
X-Google-Smtp-Source: ABdhPJxjfltg+/gNP1veODS+/7cDYbbRyr8AEH20DJ414TByfEpfHhGGNVLrv8M3x7t9zuBjzUywB4XSxfDi0lXoAvQ=
X-Received: by 2002:a05:6602:1583:b0:648:c289:2dab with SMTP id
 e3-20020a056602158300b00648c2892dabmr4830127iow.60.1649061383346; Mon, 04 Apr
 2022 01:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
 <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
 <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
 <9271680c-ab96-f8c0-ff76-fea5e8e5d2ba@theobroma-systems.com>
 <CADYjeSuEG=Qh3-=tQDUi9R_n5D8J1hV0PZGDQg7NvbCbEjy4gQ@mail.gmail.com>
In-Reply-To: <CADYjeSuEG=Qh3-=tQDUi9R_n5D8J1hV0PZGDQg7NvbCbEjy4gQ@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 4 Apr 2022 10:36:12 +0200
Message-ID: <CADYjeSsK7HYfB4_WzsPiez4s8Ffa2vQ-J7N+H1=qJTQYyR6MjQ@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Content-Type: multipart/mixed; boundary="===============6097695875580624662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6097695875580624662==
Content-Type: multipart/alternative; boundary="000000000000f7a0fc05dbd00535"

--000000000000f7a0fc05dbd00535
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

I made some progress to build casync as host-casync. I modified casync.mk
file to include "HOST_CASYNC_DEPENDENCIES =3D host-acl host-libcurl
host-openssl" below "CASYNC_DEPENDENCIES =3D acl libcurl openssl". And also
added BR2_PACKAGE_HOST_CASYNC=3DYES to config. Then if I run make host-casy=
nc
it results in

make[1]: * No rule to make target 'host-libfuse'

I think this is related to below DEPENDENCY in casync.mk file:
ifeq ($(BR2_PACKAGE_LIBFUSE),y)
CASYNC_DEPENDENCIES +=3D libfuse
CASYNC_CONF_OPTS +=3D -Dfuse=3Dtrue
else
CASYNC_CONF_OPTS +=3D -Dfuse=3Dfalse
endif

But I have selected BR2_PACKAGE_LIBFUSE=3Dy in menuconfig. What else should
be selected for "fuse"?

Can you please let me know how to set up buildroot to use build machine
libs?

Thanks in advance.

On Fri, 1 Apr 2022 at 14:29, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello Quentin,
>
> I assume you need this at build time then since you are talking about
>> binary for the host system. In that case, you need to add host-casync to
>> your config.
>>
>> However, casync is currently a target-only package.
>>
>
> If I understand correctly, then as of now Buildroot can't be used to
> create casync host package.
>
> $(eval $(host-meson-package))
>>
>> at the end of the package/casync/casync.mk file.
>>
>
> I will try this solution.
>
> But what could be the other alternative to work with casync?
>
> Thanks in advance
>
> On Fri, 1 Apr 2022 at 13:54, Quentin Schulz <
> quentin.schulz@theobroma-systems.com> wrote:
>
>> Hi Sourabh,
>>
>> On 4/1/22 13:41, Sourabh Hegde wrote:
>> > Hello Quentin,
>> >
>> > make casync
>> >>
>> >> if you want it in an image created by Buildroot, modify your config
>> with
>> >> make menuconfig and save your changes, then run make.
>> >>
>> >
>> > But will this create binary for host system also? Sorry, its bit
>> confusing
>> > here.
>> >
>>
>> No, host packages and target packages are compiled with a different
>> keyword.
>>
>> make casync is for target package
>> make host-casync is for host package
>>
>> > I need casync tool use with "rauc" as given in
>> >
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__rauc.readthedocs.=
io_en_latest_advanced.html-23creating-2Dcasync-2Dbundles&d=3DDwIFaQ&c=3D_sE=
r5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZ=
hkI_-172IIy1t&m=3DAiN2bNa5EFj79y22K554djuFBBXe_MMEIRS1-gwEsbw3ch69jBq4q9j0t=
m_wz1V8&s=3D6mSs1PkEXKk01AMnuQKyCAPV0A9euTiPrj_bP4mGHJ0&e=3D
>> >
>> > When I do "rauc convert --cert=3D<certfile> --key=3D<keyfile>
>> > --keyring=3D<keyring> conventional-bundle.raucb casync-bundle.raucb"
>> >
>>
>> I assume you need this at build time then since you are talking about
>> binary for the host system. In that case, you need to add host-casync to
>> your config.
>>
>> However, casync is currently a target-only package.
>>
>> To create a host package, you need at the very least to add:
>>
>> $(eval $(host-meson-package))
>>
>> at the end of the package/casync/casync.mk file.
>>
>> This might not be enough and might require some additional tweaks to the
>> package makefile.
>>
>> Cheers,
>> Quentin
>>
>

--000000000000f7a0fc05dbd00535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Quentin,<div><br></div><div>I made some progres=
s to build casync as host-casync. I modified <a href=3D"http://casync.mk">c=
async.mk</a> file to include &quot;HOST_CASYNC_DEPENDENCIES =3D host-acl ho=
st-libcurl host-openssl&quot; below &quot;CASYNC_DEPENDENCIES =3D acl libcu=
rl openssl&quot;. And also added BR2_PACKAGE_HOST_CASYNC=3DYES to config. T=
hen if I run make host-casync it results in=C2=A0</div><div><br></div><div>=
make[1]:=C2=A0*=C2=A0No rule to make target &#39;host-libfuse&#39;<br><br>I=
 think this is related to below DEPENDENCY in <a href=3D"http://casync.mk">=
casync.mk</a> file:<br>ifeq ($(BR2_PACKAGE_LIBFUSE),y)<br>CASYNC_DEPENDENCI=
ES +=3D libfuse<br>CASYNC_CONF_OPTS +=3D -Dfuse=3Dtrue<br>else<br>CASYNC_CO=
NF_OPTS +=3D -Dfuse=3Dfalse<br>endif<br><br>But I have selected=C2=A0BR2_PA=
CKAGE_LIBFUSE=3Dy in menuconfig. What else should be selected=C2=A0for &quo=
t;fuse&quot;?<br><br>Can you please let me know=C2=A0how to set up buildroo=
t to use build machine libs?<br></div><div><br></div><div>Thanks in advance=
.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 1 Apr 2022 at 14:29, Sourabh Hegde &lt;<a href=3D"mailto:hrs=
ourabh011@gmail.com">hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello=C2=A0Quen=
tin,<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I assu=
me you need this at build time then since you are talking about<br>binary f=
or the host system. In that case, you need to add host-casync to<br>your co=
nfig.<br><br>However, casync is currently a target-only package.<br></block=
quote><div><br></div><div>If I understand correctly, then as of now Buildro=
ot can&#39;t be used to create casync host package.=C2=A0</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">$(eval $(host-meson-pa=
ckage))<br><br>at the end of the package/casync/<a href=3D"http://casync.mk=
/" rel=3D"noreferrer" target=3D"_blank">casync.mk</a>=C2=A0file.<br></block=
quote><div><br></div><div>I will try this solution.</div><div><br></div><di=
v>But what could be the other=C2=A0alternative to work with casync?=C2=A0</=
div><div><br></div><div>Thanks in advance</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 1 Apr 2022 at 13:54,=
 Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com"=
 target=3D"_blank">quentin.schulz@theobroma-systems.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Sourabh,<br>
<br>
On 4/1/22 13:41, Sourabh Hegde wrote:<br>
&gt; Hello Quentin,<br>
&gt; <br>
&gt; make casync<br>
&gt;&gt;<br>
&gt;&gt; if you want it in an image created by Buildroot, modify your confi=
g with<br>
&gt;&gt; make menuconfig and save your changes, then run make.<br>
&gt;&gt;<br>
&gt; <br>
&gt; But will this create binary for host system also? Sorry, its bit confu=
sing<br>
&gt; here.<br>
&gt; <br>
<br>
No, host packages and target packages are compiled with a different keyword=
.<br>
<br>
make casync is for target package<br>
make host-casync is for host package<br>
<br>
&gt; I need casync tool use with &quot;rauc&quot; as given in<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__rauc=
.readthedocs.io_en_latest_advanced.html-23creating-2Dcasync-2Dbundles&amp;d=
=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1X=
TSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DAiN2bNa5EFj79y22K554djuFBBXe=
_MMEIRS1-gwEsbw3ch69jBq4q9j0tm_wz1V8&amp;s=3D6mSs1PkEXKk01AMnuQKyCAPV0A9euT=
iPrj_bP4mGHJ0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__rauc.readthedocs.io_en_latest_adva=
nced.html-23creating-2Dcasync-2Dbundles&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhu=
k4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-=
172IIy1t&amp;m=3DAiN2bNa5EFj79y22K554djuFBBXe_MMEIRS1-gwEsbw3ch69jBq4q9j0tm=
_wz1V8&amp;s=3D6mSs1PkEXKk01AMnuQKyCAPV0A9euTiPrj_bP4mGHJ0&amp;e=3D</a><br>
&gt; <br>
&gt; When I do &quot;rauc convert --cert=3D&lt;certfile&gt; --key=3D&lt;key=
file&gt;<br>
&gt; --keyring=3D&lt;keyring&gt; conventional-bundle.raucb casync-bundle.ra=
ucb&quot;<br>
&gt; <br>
<br>
I assume you need this at build time then since you are talking about <br>
binary for the host system. In that case, you need to add host-casync to <b=
r>
your config.<br>
<br>
However, casync is currently a target-only package.<br>
<br>
To create a host package, you need at the very least to add:<br>
<br>
$(eval $(host-meson-package))<br>
<br>
at the end of the package/casync/<a href=3D"http://casync.mk" rel=3D"norefe=
rrer" target=3D"_blank">casync.mk</a> file.<br>
<br>
This might not be enough and might require some additional tweaks to the <b=
r>
package makefile.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>
</blockquote></div>

--000000000000f7a0fc05dbd00535--

--===============6097695875580624662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6097695875580624662==--
