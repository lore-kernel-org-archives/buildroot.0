Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C574C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 15:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B8961AD3;
	Fri, 17 Mar 2023 15:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B8961AD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_tMSyC-qQYF; Fri, 17 Mar 2023 15:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F91F61AC0;
	Fri, 17 Mar 2023 15:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F91F61AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 212551BF38E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F7941B85
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F7941B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjqBryksExbb for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 15:20:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E933441B71
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E933441B71
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 15:20:14 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 103-20020a9d0870000000b0069f000acf40so620714oty.1
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679066414;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hAPvCf4aKz0N4AdsOxObU3IHJEhCS6/1QvTM5yjqs7o=;
 b=hej3x83RYNzJ2ZibHc68P0z+ioXcNYM6J4MsVhuGnTtc3HYLzQP2PWcTxI6GGmnP/N
 3YrGjSwNQHJrtz08DEC3YKUn2py4KHchpADDl+4Q0Hz2W3MzVw5xGmm4JWYxfiKUhcwX
 AJNxqak9z69kb29qfc9xSIA+YD1LdI+r96/oIDpdZqWnx6mA5koh964xNCdg6zmVWwNl
 jvqGBo7URNJ+WStBed4ei2ubiUFaiKBpPyWhqXsfosu9DTwT40UDVyrnr1NqH5FRFpQM
 V4BN2sO8OLxR1vyMLyqKS7Gd2mhQ7elK9gAY2QdNRREmewauVeOAfp3b31j1GjiDlbUI
 4D0g==
X-Gm-Message-State: AO0yUKVWnkajzO8+SZoSryztt435k5GPAvbCEOcx+Ou6StQzwkyq/sJU
 zO09BPIL8yKKXugx3xV1IqdwkgczoOh8XkY7L7QrIRRxYF1Xsw==
X-Google-Smtp-Source: AK7set/3j/IXq+lFqgNT6sLtg+inFhohkiLRGxp+rwVPYzgrqXIWX/SprZ9Wim/zJT5DEO+mwpgY38T+uSYQCN4Pv7A=
X-Received: by 2002:a9d:4c09:0:b0:699:7d71:d2dc with SMTP id
 l9-20020a9d4c09000000b006997d71d2dcmr3728177otf.6.1679066413843; Fri, 17 Mar
 2023 08:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANgJbdVKFO_HvXOvrMcJW_bb=QXnpB6T7M9T+r1ypR7icwfPWA@mail.gmail.com>
In-Reply-To: <CANgJbdVKFO_HvXOvrMcJW_bb=QXnpB6T7M9T+r1ypR7icwfPWA@mail.gmail.com>
From: Jonathan Bittner <jbittner.br.bugs@gmail.com>
Date: Fri, 17 Mar 2023 11:20:02 -0400
Message-ID: <CANgJbdXqFfHtd=fnutfAkJXnRzhZH=SuLeme8P4gOxVnvTrCuA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679066414;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hAPvCf4aKz0N4AdsOxObU3IHJEhCS6/1QvTM5yjqs7o=;
 b=e0Bd+nEg+Klx2ded+YA9uaGZPz+vA24Ps+EGLuJC5R01oYL37kdzjf1Mb1Uj9ej0Gw
 TL8sW816Hp+1dmo73YDDT2fC2m6GGe93MlNONJP4soB3+F1TGLnguL82gqSekKBJct7T
 MhGKviPQbLr/jtymeb67lcQ91fP5YDSEIvzKjapWIcTvMG9KSB/bdoo4D8SK4cdSz+K5
 1jUmqt441Mfl1FB7PaUBVX3I7GPB2cMK15VCk6lSh4pZu2sFapZx/AMqlAjywF4p0vjF
 TOywbsysTxOQBdXu8egd0O05tSZMOxvmcIZlpcBLWY6DGgEWVl66//ZBOH1JWnZFvrvI
 Yn7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e0Bd+nEg
Subject: Re: [Buildroot] Troubles with SELinux
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
Content-Type: multipart/mixed; boundary="===============1588485817127866324=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1588485817127866324==
Content-Type: multipart/alternative; boundary="00000000000026c89305f71a1d6b"

--00000000000026c89305f71a1d6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 12:33=E2=80=AFPM Jonathan Bittner <
jbittner.br.bugs@gmail.com> wrote:

> I'm developing an embedded config on an Intel Atom board. It is a
> government app and will go through vetting. Likely it will be compared to
> the RedHat and Ubuntu Security Technical Implementation Guides (STIGs) as
> there no specific embedded Linux STIGs.
>
 I hate replying to my own posts but I learned two additional things during
my experimentation yesterday:
1.) an early forced relabel (S000relabel service) on a fresh filesystem
helps fix some issues
2.) Switching to SystemV init allowed more useful troubleshooting in
permissive mode: auditd could run early, reported exceptions were logged,
and authorizations could be added.  I think BusyBox init somehow just turns
SElinux off (no reporting) in permissive mode.
3.) My issues with ssh login is apparently the /etc/pam.d/sshd that ships
with the system contains no reference to any of the SELinux modules in the
auth stack which means the contexts are not set during the login.  I
haven't quite fixed this yet. Most of the sample configs I've found online
were distribution-specific and had external references (includes) to files
shipped by that distro, often incorporating distro-specific modules not
shipped with Buildroot

--00000000000026c89305f71a1d6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 16, 2023 at 12:33=E2=80=AFPM Jona=
than Bittner &lt;<a href=3D"mailto:jbittner.br.bugs@gmail.com">jbittner.br.=
bugs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr">I&#39;m developing an embedded config on an =
Intel Atom board. It is a government app and will go through vetting. Likel=
y it will be compared to the RedHat and Ubuntu Security Technical Implement=
ation Guides (STIGs) as there no specific embedded Linux STIGs.=C2=A0 </div=
></blockquote><div>=C2=A0I hate replying to my own posts but I learned two =
additional things during my experimentation yesterday:</div><div>1.) an ear=
ly forced relabel (S000relabel service) on a fresh filesystem helps fix som=
e issues</div><div>2.) Switching to SystemV init allowed more useful troubl=
eshooting in permissive mode: auditd could run early, reported exceptions w=
ere logged, and authorizations could be added.=C2=A0 I think BusyBox init s=
omehow just turns SElinux off (no reporting) in permissive mode.=C2=A0=C2=
=A0</div><div>3.) My issues with ssh login is apparently the /etc/pam.d/ssh=
d that ships with the system contains no reference to any of the SELinux mo=
dules in the auth stack which means the contexts are not set during the log=
in.=C2=A0 I haven&#39;t quite fixed this yet. Most of the sample configs I&=
#39;ve found online were distribution-specific and had external references =
(includes) to files shipped by that distro, often incorporating distro-spec=
ific modules not shipped with Buildroot=C2=A0</div></div></div>

--00000000000026c89305f71a1d6b--

--===============1588485817127866324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1588485817127866324==--
