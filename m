Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF7FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDCF84167A;
	Mon, 18 Apr 2022 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qe2GT3-SPMUD; Mon, 18 Apr 2022 20:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C58F408F4;
	Mon, 18 Apr 2022 20:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90EDF1BF28C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C894842B4
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-baW9EeUBY3 for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 20:47:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C386841BC
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 20:47:47 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r8so16040686oib.5
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FuCJbNZW7i1dr2XhnPnehAw3TIDVawhhLGhi4bhWDGo=;
 b=VMwDPOk5/IjmjNErJEXzIboN75Gh1u6st3xuR7Iy2g918oKSrqldirWZandT5Y7KLw
 E9ClJXQjvQ+nEHmjaETrqY877kl08AiEOjNsrGENAHVznrkYHh567UmAKOEhqzpe4KRR
 R4ut/XG5+4Jn632PWL47bVUtOCwjihvA0DsoHpjNVB07GRo+64uBG1fVCYDPCchN96wp
 hBn3S1m6OGlunIXJHZmMqQCp2FT7vr/cHNY2UqO9cgGTGk5AyPzScpMnUxMpSROi5iSG
 OZxQvAx0mQmXfjy8shZfQ/uX6s2+inCpG7PijRtEmd2zkUKpVYg9VYVFKVq7WfiT1DUi
 Ev+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FuCJbNZW7i1dr2XhnPnehAw3TIDVawhhLGhi4bhWDGo=;
 b=SnHIVjiCmnsbXeCzhtjlBapBLbHvvM0hDsw9fYVNjAeEkC5wEYUCu7neByK4PCEgq+
 efoJRhE7dXac1gtKr50gCUbmETE4B7SWddA7uJrlour5jrIWxhITR0a8nH0df9uANYeG
 xS0la0Upa27rL1wMDLpgjI6vOIRhCAbORy4/UR4fdw0+ViDb/NH5Orls/PySEtnPMGyz
 wOtfXmwZgf+nxOHV9nSFSfuhck3Eqc7YO+B1aFtAkt2aEMPXYjlrwjHquODzJpuFSsh/
 MhjRCmzjMuEhYdY8lTXWH5St93jHFNvqNM/6+6U9Qky11fqMnrAI8xpUcgyLy4gGhrUQ
 iJzg==
X-Gm-Message-State: AOAM532nxjC6Xg5g4Hoon2tZMe5MZRlCHC4dpHcfM/EXSf4K7p67KXRs
 0nGsQ/S+DodAubasIR3LSkep/YuevD5zCLXaBSE=
X-Google-Smtp-Source: ABdhPJzADPe7K1Gbqch6hZhb+fkOlpPct2Su48FxFL21IMw8tsfn1NfYmsYARWhXd3LmB0qKM9tiInFqoNf6+O/zfzA=
X-Received: by 2002:a05:6808:20a2:b0:2fa:789c:84ea with SMTP id
 s34-20020a05680820a200b002fa789c84eamr7996884oiw.206.1650314866429; Mon, 18
 Apr 2022 13:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b06:0:0:0:0:0 with HTTP; Mon, 18 Apr 2022 13:47:46
 -0700 (PDT)
In-Reply-To: <DU0P251MB077954C75D3B4FCF733466E5E3F39@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB077954C75D3B4FCF733466E5E3F39@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 18 Apr 2022 22:47:46 +0200
Message-ID: <CADYdroMTMTnVwe3z1uMLp7VNiL0PBwoqCk1YVZKvYN0yiBOAxg@mail.gmail.com>
To: Tim Hammer <Tim.Hammer@orolia.com>
Subject: Re: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3041146431584225047=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3041146431584225047==
Content-Type: multipart/alternative; boundary="00000000000061956505dcf3dffd"

--00000000000061956505dcf3dffd
Content-Type: text/plain; charset="UTF-8"

Am Montag, 18. April 2022 schrieb Tim Hammer <Tim.Hammer@orolia.com>:

> On Wed, Jan 12, 2022 at 11:10:20AM +0100, Norbert Lange wrote:
> > We changed the skeletons in bf01e51f3c, so that var/lock
> > points to run/lock. This resulted in build failures as
> > some packages want to work with these paths.
> >
> > -   Create run/lock, the run directory will be purged
> >     later anyway (since 5e78e7e97d).
>
> Yes, run/lock is removed later (see
> https://lore.kernel.org/buildroot/20200605224858.
> 12870-2-nolange79@gmail.com/
> and
> https://lore.kernel.org/buildroot/20220319190531.
> 975B183CB8@busybox.osuosl.org/).
>
> However, the soft link in var/ is not. It ends up in the rootfs for the
> target
> and can cause problems later.
>
> Is there a reason the link created by skeleton was not cleaned up?
>
>
Yeah, it's supposed to be there in the final roots.
The run/lock directory is just *in the skeleton* so you don't have a broken
symlink *during building with buildroot*.

I will be honest, I do not understand the full process and why the items
> created by
> the skeleton package are not just left in place...


The running system will mount a tmpfs onto /run (and most likely /tmp) and
will create /run/lock anew each bootup

Means all content on you image is

- irrelevant
- prone to leaking info from the system where you built the rootfs.

Norbert


> .Tim
> Tim D. Hammer
> tim.hammer@orolia.com
>
>
> > -   for init == systemd, create the var/lock symlink early
> >     to prevent packages creating this path as directory.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
> >  system/skeleton/run/{ => lock}/.empty                  | 0
> >  2 files changed, 2 insertions(+)
> >  rename system/skeleton/run/{ => lock}/.empty (100%)
> >
> > diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> b/package/skeleton-init-systemd/skeleton-init-sys>> index
> 1e212cc2f7..795a171809 100644
> > --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > @@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
> >       mkdir -p $(TARGET_DIR)/srv
> >       mkdir -p $(TARGET_DIR)/var
> >       ln -s ../run $(TARGET_DIR)/var/run
> > +     # prevent install scripts to create var/lock as directory
> > +     ln -s ../run/lock $(TARGET_DIR)/var/lock
> >       install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf
> $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
> >       $(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
> >  endef
> > diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.
> empty
> > similarity index 100%
> > rename from system/skeleton/run/.empty
> > rename to system/skeleton/run/lock/.empty
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--00000000000061956505dcf3dffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>Am Montag, 18. April 2022 schrieb Tim Hammer &lt;<a href=3D"mailto:=
Tim.Hammer@orolia.com">Tim.Hammer@orolia.com</a>&gt;:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, Jan 12, 2022 at 11:10:20AM +0100, Norbert Lange wrote=
:<br>
&gt; We changed the skeletons in bf01e51f3c, so that var/lock<br>
&gt; points to run/lock. This resulted in build failures as<br>
&gt; some packages want to work with these paths.<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0Create run/lock, the run directory will be purged<br>
&gt;=C2=A0 =C2=A0 =C2=A0later anyway (since 5e78e7e97d).<br>
<br>
Yes, run/lock is removed later (see<br>
<a href=3D"https://lore.kernel.org/buildroot/20200605224858.12870-2-nolange=
79@gmail.com/" target=3D"_blank">https://lore.kernel.org/<wbr>buildroot/202=
00605224858.<wbr>12870-2-nolange79@gmail.com/</a><br>
and<br>
<a href=3D"https://lore.kernel.org/buildroot/20220319190531.975B183CB8@busy=
box.osuosl.org/" target=3D"_blank">https://lore.kernel.org/<wbr>buildroot/2=
0220319190531.<wbr>975B183CB8@busybox.osuosl.org/</a><wbr>).<br>
<br>
However, the soft link in var/ is not. It ends up in the rootfs for the tar=
get<br>
and can cause problems later.<br>
<br>
Is there a reason the link created by skeleton was not cleaned up?<br>
<br></blockquote><div><br></div><div>Yeah, it&#39;s supposed to be there in=
 the final roots.</div><div>The run/lock directory is just *in the skeleton=
* so you don&#39;t have a broken symlink *during building with buildroot*.<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I will be honest, I do not understand the full process and why the items cr=
eated by<br>
the skeleton package are not just left in place...</blockquote><div><br></d=
iv><div>The running system will mount a tmpfs onto /run (and most likely /t=
mp) and will create /run/lock anew each bootup=C2=A0</div><div><br></div><d=
iv>Means all content on you image is</div><div><br></div><div>- irrelevant<=
/div><div>- prone to leaking info from the system where you built the rootf=
s.</div><div><br></div><div>Norbert</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
.Tim<br>
Tim D. Hammer<br>
<a href=3D"mailto:tim.hammer@orolia.com">tim.hammer@orolia.com</a><br>
<br>
<br>
&gt; -=C2=A0 =C2=A0for init =3D=3D systemd, create the var/lock symlink ear=
ly<br>
&gt;=C2=A0 =C2=A0 =C2=A0to prevent packages creating this path as directory=
.<br>
&gt;<br>
&gt; Signed-off-by: Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com=
">nolange79@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/skeleton-init-systemd/<a href=3D"http://skeleton-init-sy=
stemd.mk" target=3D"_blank"><wbr>skeleton-init-systemd.mk</a> | 2 ++<br>
&gt;=C2=A0 system/skeleton/run/{ =3D&gt; lock}/.empty=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 2 files changed, 2 insertions(+)<br>
&gt;=C2=A0 rename system/skeleton/run/{ =3D&gt; lock}/.empty (100%)<br>
&gt;<br>
&gt; diff --git a/package/skeleton-init-<wbr>systemd/<a href=3D"http://skel=
eton-init-systemd.mk" target=3D"_blank">skeleton-init-systemd.<wbr>mk</a> b=
/package/skeleton-init-<wbr>systemd/skeleton-init-sys&gt;&gt; index 1e212cc=
2f7..795a171809 100644<br>
&gt; --- a/package/skeleton-init-<wbr>systemd/<a href=3D"http://skeleton-in=
it-systemd.mk" target=3D"_blank">skeleton-init-systemd.<wbr>mk</a><br>
&gt; +++ b/package/skeleton-init-<wbr>systemd/<a href=3D"http://skeleton-in=
it-systemd.mk" target=3D"_blank">skeleton-init-systemd.<wbr>mk</a><br>
&gt; @@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_<wbr>TARGET_CMD=
S<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/srv<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/var<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ../run $(TARGET_DIR)/var/run<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# prevent install scripts to create var/lock as d=
irectory<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ln -s ../run/lock $(TARGET_DIR)/var/lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m644 $(SKELETON_INIT_SYSTEMD_<wb=
r>PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/<wbr>tmpfiles.d/legacy.conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SKELETON_INIT_SYSTEMD_ROOT_<wbr>RO_OR_RW)<=
br>
&gt;=C2=A0 endef<br>
&gt; diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.<w=
br>empty<br>
&gt; similarity index 100%<br>
&gt; rename from system/skeleton/run/.empty<br>
&gt; rename to system/skeleton/run/lock/.<wbr>empty<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt; ______________________________<wbr>_________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>=
<br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" tar=
get=3D"_blank">https://lists.buildroot.org/<wbr>mailman/listinfo/buildroot<=
/a><br>
<br>
</blockquote>

--00000000000061956505dcf3dffd--

--===============3041146431584225047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3041146431584225047==--
