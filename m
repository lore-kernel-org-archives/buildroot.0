Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC822C19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 11:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F3028266C;
	Thu,  4 Aug 2022 11:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F3028266C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0alHoishoHiv; Thu,  4 Aug 2022 11:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E19F82640;
	Thu,  4 Aug 2022 11:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E19F82640
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA041BF48B
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3659182640
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3659182640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Xr7Uho90tNt for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 11:21:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 486D982628
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 486D982628
 for <buildroot@busybox.net>; Thu,  4 Aug 2022 11:21:12 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 130so11246046pfv.13
 for <buildroot@busybox.net>; Thu, 04 Aug 2022 04:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7tqRLnLafCF+rRlmH4XLgnUusKQWR5y7wuVOXw9pqw=;
 b=4wrc+gAlGFlwJDRGnwHETAFk+DtxOTdPBaMVHBr8RaU/rCGbxw0DAIG7hm+lfE/vXR
 mihO1Szs4uy6CyBvxYw5yFVFXTYj9SQyS7Jx01HMYyDr9kgaDmns3RWqiy97rmjR3gQ6
 Afs9tNw5UH6lvCCw7PCR6YwXVkWhRoA3QVsGSD7d/ZWCqGKxpSPnwKgjI6C0ocagyzX8
 7+FPrDDmz70bRX3WO347Nccs/7BOHCwoKwZIl2M7KvkvL3cKzaYIFsju8akewcHcCkr7
 h+mqRnzhSwNAp0Jt+c6fFO4U2MFjpnWvRQhDZsFqX7ytC8sJhDCCqU9RJSH7/9jNdGZd
 L86w==
X-Gm-Message-State: ACgBeo1+5GTvN314zLCBNoVUYth0Tdm0pMtXFPdSWkv38KDjLQNtpd9E
 xFMXzvgXcs8FWyxrmBdxeOEBqKtwfN9rmSszkslLo5ZzrVU=
X-Google-Smtp-Source: AA6agR6/QzoqfqmJMzfSoESXlC2qMDu5TF4rzFRzmNjb9zD1cjYOfUN1fbxTPBPsIKZ+394aAGAslEyYiv8ol0JlsFg=
X-Received: by 2002:a05:6a00:328e:b0:52d:44e0:297c with SMTP id
 ck14-20020a056a00328e00b0052d44e0297cmr1264065pfb.64.1659612072297; Thu, 04
 Aug 2022 04:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-3-francois.perrad@gadz.org>
 <20220803183206.4a278247@windsurf>
 <CAB0FRssCzSJocBF3yee4nOEf-z=92Dm93OLaKoM7sCn+5jGgzA@mail.gmail.com>
 <20220803221913.470cbf7a@windsurf>
In-Reply-To: <20220803221913.470cbf7a@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 4 Aug 2022 13:21:01 +0200
Message-ID: <CAB0FRsvxOUmGvi=zQyR+DNSH-cjnavZfrxqUA+1QApEU4qBBCQ@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: Re: [Buildroot] [PATCH v2 2/3] package/qoriq-cadence-dp-firmware:
 add install in target
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============6778697410670608127=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6778697410670608127==
Content-Type: multipart/alternative; boundary="00000000000008efbd05e5688c3c"

--00000000000008efbd05e5688c3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 3 ao=C3=BBt 2022 =C3=A0 22:26, Thomas Petazzoni <thomas.petazzoni@b=
ootlin.com>
a =C3=A9crit :

> On Wed, 3 Aug 2022 21:45:48 +0200
> Fran=C3=A7ois Perrad <francois.perrad@gadz.org> wrote:
>
> > in v1, the commit message was :
>
> Why has the v2 commit message changed, to remove information?
>
> > this firmware must be installed with the kernel,
> > > there are 2 cases:
> > >
> > - in $(TARGET_DIR)/boot
> > > - in $(BINARIES), in order to be bundled into a boot partition
>
> This doesn't explain the *why*. How is the firmware being used from
> $(TARGET_DIR)/boot ?
>
>
At this time, I don't known how this firmware (DisplayPort related) works
on this SoC,
so, please, just skip this patch 2/3
(that doesn't break the build of the board).

Fran=C3=A7ois


> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000008efbd05e5688c3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 3 ao=C3=BBt 2022 =C3=A0=
=C2=A022:26, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootli=
n.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 3 Aug 2022 21:45:48=
 +0200<br>
Fran=C3=A7ois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=
=3D"_blank">francois.perrad@gadz.org</a>&gt; wrote:<br>
<br>
&gt; in v1, the commit message was :<br>
<br>
Why has the v2 commit message changed, to remove information?<br>
<br>
&gt; this firmware must be installed with the kernel,<br>
&gt; &gt; there are 2 cases:<br>
&gt; &gt;=C2=A0 <br>
&gt; - in $(TARGET_DIR)/boot<br>
&gt; &gt; - in $(BINARIES), in order to be bundled into a boot partition<br=
>
<br>
This doesn&#39;t explain the *why*. How is the firmware being used from<br>
$(TARGET_DIR)/boot ?<br>
<br></blockquote><div><br></div><div>At this time, I don&#39;t known how th=
is firmware (DisplayPort related) works on this SoC,</div><div>so, please, =
just skip this patch 2/3<br></div><div>(that doesn&#39;t break the build of=
 the board).<br></div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000008efbd05e5688c3c--

--===============6778697410670608127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6778697410670608127==--
