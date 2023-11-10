Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BA6C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 08:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0CE34012A;
	Fri, 10 Nov 2023 08:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0CE34012A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k54iR61bbvZT; Fri, 10 Nov 2023 08:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D3A340182;
	Fri, 10 Nov 2023 08:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D3A340182
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E85DE1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 08:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0594012A
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 08:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0594012A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aorzX50P-W8F for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 08:43:21 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E89DD40182
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 08:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89DD40182
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5a822f96aedso21948647b3.2
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 00:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699605799; x=1700210599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FCAkeC4A8bn8kHflaZoAIeOi0yrRgDA8pmY6wRZNjP0=;
 b=NIznnaONC7XXZis21SgJbe1iOb8s+8mrrlG/XqBuuFFZFreweCwSLWvCh8lA1mshoG
 Knb7vYF+4lZjqwa86xAeqGr86cLgKW86FZemnPnKwpVdsLcJ7qf11okhuXBD8moU7zuh
 hEyurQ/QShltWPWFDq6rKz5JbDbIlEZQr0+Y9pf2uDWhtDin9wpTdfsYiqwUg1pECWfB
 vN5Ywf5a2wswSkgsJeWanI+BCt9bNVv5cLV2C5nUMeeMyHT48RaO9sJtZAQydT9Nrzyc
 CSLHYsF8r0sFONDprrH0lwkaENVAqfLoM17qfJ68YrVhEaH8oXSIABdVZGfbCasO7388
 eDoQ==
X-Gm-Message-State: AOJu0YznCXFXx0f7Sw9IHebgQfZseIMr75aMLdhP2SDlBWU8lrbn2AkX
 i4RCq6cYp77617bfR+G4jvA/y6CDlXxAeZZhzmNnSQ==
X-Google-Smtp-Source: AGHT+IE7l0YbxWGJ+NpcgbLkVSB9dHo7f4nOAHLky/vmmjLIzionzToW89fe80cvgCK1J73sdj19DcEFFHZgTlSuI7A=
X-Received: by 2002:a0d:fb84:0:b0:5a7:db09:5067 with SMTP id
 l126-20020a0dfb84000000b005a7db095067mr7512052ywf.20.1699605799581; Fri, 10
 Nov 2023 00:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20231109142009.3490104-1-jonhenrik@qbee.io>
 <20231109142009.3490104-2-jonhenrik@qbee.io>
 <ZU0CyWbfy97yxwCZ@tl-lnx-nyma7486-2>
In-Reply-To: <ZU0CyWbfy97yxwCZ@tl-lnx-nyma7486-2>
Date: Fri, 10 Nov 2023 09:43:08 +0100
Message-ID: <CAC3uuetUVp69a-_mQ-MEpCB2r=fD7qiKDD6M5paOxgnj0Faj7A@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1699605799; x=1700210599; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FCAkeC4A8bn8kHflaZoAIeOi0yrRgDA8pmY6wRZNjP0=;
 b=AChyTt+3+3+tQkrNb8rHzS+IN5R5a+oj5gDbImnvIOH5Ak8RB5u/p7IY/J/mJBswrM
 TIBPj7CzxyM7sL17Ke+UOQEDdM8zx0dCVvsA1hnFarHqT3IIdsrQdYLFqMnJegf0M9i1
 87O9hVQkp19Mb7eujDkZCtu3LKNB9LcSoEAP0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=qbee.io header.i=@qbee.io
 header.a=rsa-sha256 header.s=google header.b=AChyTt+3
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2525039130871010591=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2525039130871010591==
Content-Type: multipart/alternative; boundary="000000000000f151570609c84fa7"

--000000000000f151570609c84fa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

Thanks for your feedback.

I wrote a cover letter based in an initial review of the patch that
attempted to explain why the choice to install pre-compiled static binaries
was made (Subject: [PATCH 0/1] Regarding review of qbee-agent patch)

However, it seems the approach I've chosen is not the optimal one. I'll
attempt to redo the patch with your feedback in mind.

I'm fairly new to the buildroot community and I'm still learning the ropes
:)

Thanks again!

With best regards,

Jon Henrik Bj=C3=B8rnstad

On Thu, Nov 9, 2023 at 5:03=E2=80=AFPM <yann.morin@orange.com> wrote:

> Jon, All,
>
> On 2023-11-09 15:20 +0100, Jon Henrik Bj=C3=B8rnstad via buildroot spake =
thusly:
> > This patch add qbee-agent, an open source device management software
> > for Linux devices.
> [--SNIP--]
> > diff --git a/package/qbee-agent/qbee-agent.hash
> b/package/qbee-agent/qbee-agent.hash
> > new file mode 100644
> > index 0000000000..b7e311405f
> > --- /dev/null
> > +++ b/package/qbee-agent/qbee-agent.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256
> edcf319c4ce17e9844df598fa796aa87303a1bf238299dbeeb41c94ff5de5e1d
> qbee-agent-2023.44.tar.gz
> > diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/
> qbee-agent.mk
> > new file mode 100644
> > index 0000000000..aded6b72f4
> > --- /dev/null
> > +++ b/package/qbee-agent/qbee-agent.mk
> > @@ -0,0 +1,42 @@
> >
> +########################################################################=
########
> > +#
> > +# qbee-agent package
> > +#
> >
> +########################################################################=
########
> > +
> > +QBEE_AGENT_VERSION =3D 2023.44
> > +QBEE_AGENT_SITE =3D
> https://cdn.qbee.io/software/qbee-agent/$(QBEE_AGENT_VERSION)/binaries
> > +QBEE_AGENT_LICENSE =3D Apache-2.0
>
> There is the go source code on:
>     https://github.com/qbee-io/qbee-agent
>
> So, why do you download a prebuilt pacakge?
> Why can't you use the buidlroot go pacakge infrastructure?
>
> See:
>
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_go=
_packages
>
> Basically, that would look like (omitting licensing and stuff):
>
>     QBEE_AGENT_VERSION =3D 2023.44
>     QBEE_AGENT_SITE =3D $(call
> github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
>
>     $(eval $(golang-pacakge))
>
> Then, maybe you need to specify a few other variables, see the manual:
>     QBEE_AGENT_GOMOD
>     QBEE_AGENT_BUILD_TARGETS
>     QBEE_AGENT_INSTALL_BINS
>
> Regards,
> Yann E. MORIN.
>
> > +ifeq ($(BR2_arm),y)
> > +QBEE_AGENT_GOARCH =3D arm
> > +else ifeq ($(BR2_aarch64),y)
> > +QBEE_AGENT_GOARCH =3D arm64
> > +else ifeq ($(BR2_i386),y)
> > +QBEE_AGENT_GOARCH =3D 386
> > +else ifeq ($(BR2_x86_64),y)
> > +QBEE_AGENT_GOARCH =3D amd64
> > +endif
> > +
> > +QBEE_AGENT_STRIP_COMPONENTS =3D 2
> > +
> > +define QBEE_AGENT_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -m 0755 $(@D)/qbee-agent-$(QBEE_AGENT_GOARCH)
> $(TARGET_DIR)/usr/bin/qbee-agent
> > +     $(INSTALL) -D -m 0600 $(@D)/share/ssl/ca.cert
> $(TARGET_DIR)/etc/qbee/ppkeys/ca.cert
> > +endef
> > +
> > +define QBEE_AGENT_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 0644
> $(@D)/init-scripts/systemd/qbee-agent.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/qbee-agent.service
> > +endef
> > +
> > +define QBEE_AGENT_INSTALL_INIT_SYSV
> > +     $(INSTALL) -D -m 755 $(@D)/init-scripts/sysvinit/qbee-agent \
> > +             $(TARGET_DIR)/etc/init.d/S99qbee-agent
> > +endef
> > +
> > +define QBEE_AGENT_LINUX_CONFIG_FIXUPS
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
> > +endef
> > +
> > +$(eval $(generic-package))
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_=3D"    ,--' | / \ HTML MAIL    =
|
> '--------------------------------------:______/_____:------------------'
>
>
> _________________________________________________________________________=
___________________________________
> Ce message et ses pieces jointes peuvent contenir des informations
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages
> electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme o=
u
> falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have bee=
n
> modified, changed or falsified.
> Thank you.
>

--000000000000f151570609c84fa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yann,</div><div><br></div><div>Thanks for your fee=
dback.</div><div><br></div><div>I wrote a cover letter based in an initial =
review of the patch that attempted to explain why the choice to install pre=
-compiled static binaries was made (Subject: [PATCH 0/1] Regarding review o=
f qbee-agent patch)</div><div><br></div><div>However, it seems the approach=
 I&#39;ve chosen is not the optimal one. I&#39;ll attempt to redo the patch=
 with your feedback in mind.</div><div><br></div><div>I&#39;m fairly new to=
 the buildroot community and I&#39;m still learning the ropes :)<br></div><=
div><br></div><div>Thanks again!</div><div><br></div><div>With best regards=
,</div><div><br></div><div>Jon Henrik Bj=C3=B8rnstad<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 9=
, 2023 at 5:03=E2=80=AFPM &lt;<a href=3D"mailto:yann.morin@orange.com" targ=
et=3D"_blank">yann.morin@orange.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Jon, All,<br>
<br>
On 2023-11-09 15:20 +0100, Jon Henrik Bj=C3=B8rnstad via buildroot spake th=
usly:<br>
&gt; This patch add qbee-agent, an open source device management software<b=
r>
&gt; for Linux devices.<br>
[--SNIP--]<br>
&gt; diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/q=
bee-agent.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b7e311405f<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qbee-agent/qbee-agent.hash<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +# Locally calculated<br>
&gt; +sha256=C2=A0 edcf319c4ce17e9844df598fa796aa87303a1bf238299dbeeb41c94f=
f5de5e1d=C2=A0 qbee-agent-2023.44.tar.gz<br>
&gt; diff --git a/package/qbee-agent/<a href=3D"http://qbee-agent.mk" rel=
=3D"noreferrer" target=3D"_blank">qbee-agent.mk</a> b/package/qbee-agent/<a=
 href=3D"http://qbee-agent.mk" rel=3D"noreferrer" target=3D"_blank">qbee-ag=
ent.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..aded6b72f4<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qbee-agent/<a href=3D"http://qbee-agent.mk" rel=3D"noref=
errer" target=3D"_blank">qbee-agent.mk</a><br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# qbee-agent package<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +QBEE_AGENT_VERSION =3D 2023.44<br>
&gt; +QBEE_AGENT_SITE =3D <a href=3D"https://cdn.qbee.io/software/qbee-agen=
t/$(QBEE_AGENT_VERSION)/binaries" rel=3D"noreferrer" target=3D"_blank">http=
s://cdn.qbee.io/software/qbee-agent/$(QBEE_AGENT_VERSION)/binaries</a><br>
&gt; +QBEE_AGENT_LICENSE =3D Apache-2.0<br>
<br>
There is the go source code on:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/qbee-io/qbee-agent" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/qbee-io/qbee-agent</a><br>
<br>
So, why do you download a prebuilt pacakge?<br>
Why can&#39;t you use the buidlroot go pacakge infrastructure?<br>
<br>
See:<br>
=C2=A0 =C2=A0 <a href=3D"https://buildroot.org/downloads/manual/manual.html=
#_infrastructure_for_go_packages" rel=3D"noreferrer" target=3D"_blank">http=
s://buildroot.org/downloads/manual/manual.html#_infrastructure_for_go_packa=
ges</a><br>
<br>
Basically, that would look like (omitting licensing and stuff):<br>
<br>
=C2=A0 =C2=A0 QBEE_AGENT_VERSION =3D 2023.44<br>
=C2=A0 =C2=A0 QBEE_AGENT_SITE =3D $(call github,qbee-io,qbee-agent,$(QBEE_A=
GENT_VERSION))<br>
<br>
=C2=A0 =C2=A0 $(eval $(golang-pacakge))<br>
<br>
Then, maybe you need to specify a few other variables, see the manual:<br>
=C2=A0 =C2=A0 QBEE_AGENT_GOMOD<br>
=C2=A0 =C2=A0 QBEE_AGENT_BUILD_TARGETS<br>
=C2=A0 =C2=A0 QBEE_AGENT_INSTALL_BINS<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; +ifeq ($(BR2_arm),y)<br>
&gt; +QBEE_AGENT_GOARCH =3D arm<br>
&gt; +else ifeq ($(BR2_aarch64),y)<br>
&gt; +QBEE_AGENT_GOARCH =3D arm64<br>
&gt; +else ifeq ($(BR2_i386),y)<br>
&gt; +QBEE_AGENT_GOARCH =3D 386<br>
&gt; +else ifeq ($(BR2_x86_64),y)<br>
&gt; +QBEE_AGENT_GOARCH =3D amd64<br>
&gt; +endif<br>
&gt; +<br>
&gt; +QBEE_AGENT_STRIP_COMPONENTS =3D 2<br>
&gt; +<br>
&gt; +define QBEE_AGENT_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 $(@D)/qbee-agent-$(QBEE_AGENT_=
GOARCH) $(TARGET_DIR)/usr/bin/qbee-agent<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0600 $(@D)/share/ssl/ca.cert $(T=
ARGET_DIR)/etc/qbee/ppkeys/ca.cert<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define QBEE_AGENT_INSTALL_INIT_SYSTEMD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0644 $(@D)/init-scripts/systemd/=
qbee-agent.service \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/usr/lib=
/systemd/system/qbee-agent.service<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define QBEE_AGENT_INSTALL_INIT_SYSV<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 $(@D)/init-scripts/sysvinit/=
qbee-agent \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/ini=
t.d/S99qbee-agent<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define QBEE_AGENT_LINUX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(generic-package))<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ________=
____<br>
.-----------------.--------------------:=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =
=C2=A0 :------------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded |=C2=A0 =C2=A0 __/ )=C2=A0=
 =C2=A0| /&quot;\ ASCII RIBBON |<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Software=
=C2=A0 Designer |=C2=A0 _/ - /&#39;=C2=A0 =C2=A0| \ / CAMPAIGN=C2=A0 =C2=A0=
 =C2=A0|<br>
| +33 638.411.245 &#39;--------------------: (_=C2=A0 =C2=A0 `--, |=C2=A0 X=
=C2=A0 AGAINST=C2=A0 =C2=A0 =C2=A0 |<br>
| yann.morin (at) <a href=3D"http://orange.com" rel=3D"noreferrer" target=
=3D"_blank">orange.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|_=3D&qu=
ot;=C2=A0 =C2=A0 ,--&#39; | / \ HTML MAIL=C2=A0 =C2=A0 |<br>
&#39;--------------------------------------:______/_____:------------------=
&#39;<br>
<br>
___________________________________________________________________________=
_________________________________<br>
Ce message et ses pieces jointes peuvent contenir des informations confiden=
tielles ou privilegiees et ne doivent donc<br>
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu=
 ce message par erreur, veuillez le signaler<br>
a l&#39;expediteur et le detruire ainsi que les pieces jointes. Les message=
s electroniques etant susceptibles d&#39;alteration,<br>
Orange decline toute responsabilite si ce message a ete altere, deforme ou =
falsifie. Merci.<br>
<br>
This message and its attachments may contain confidential or privileged inf=
ormation that may be protected by law;<br>
they should not be distributed, used or copied without authorisation.<br>
If you have received this email in error, please notify the sender and dele=
te this message and its attachments.<br>
As emails may be altered, Orange is not liable for messages that have been =
modified, changed or falsified.<br>
Thank you.<br>
</blockquote></div>

--000000000000f151570609c84fa7--

--===============2525039130871010591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2525039130871010591==--
