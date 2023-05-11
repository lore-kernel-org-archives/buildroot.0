Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174CBC77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 23:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D90A42B72;
	Thu, 11 May 2023 23:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D90A42B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iq_d6EyTjT9K; Thu, 11 May 2023 23:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00CF342B89;
	Thu, 11 May 2023 23:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00CF342B89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53DDA1BF276
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 23:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C35BD6059C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 23:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C35BD6059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGcjE4ku8n78 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 23:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF6660592
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBF6660592
 for <buildroot@buildroot.org>; Thu, 11 May 2023 23:27:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so6218646f8f.1
 for <buildroot@buildroot.org>; Thu, 11 May 2023 16:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683847634; x=1686439634;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fzlmZU7+f+OH2ZZ1e0bVgmh7/fBPwrilSejnUYnNtYY=;
 b=eVbfaEZotHBzka6bAK7CWv3CF+B52mpxMg4flsIB3IS8N6LGWajE1P1sA2pJdcsgjj
 M8h2dx5sHa9ctndIsA3yPv6T/Rx38aIq6rWUfUH2APvmSBxQtXfcs6tdBeg8HwWryKrD
 X8FikUkQR7iiIRKqTa7cSpeWtB/bL/EbXdDPYGPR8U7arlVsUPUslrdJNnIaX+6wi+wy
 34pnehXh/0skfmRwVwR6oP1uK6C47XrLW+d/5uhY3sDq/PhUn2O6d7slLZCgZnbyRYCk
 GWdAkRBqGbeqWKTwgZ15WENq9HqG4qsUT4pd+kw6Vo4FMvy50CSYBokeXrV9EBPIxOf7
 gwgg==
X-Gm-Message-State: AC+VfDz1BPPKLKDorit7ivSufGAW/MOFw9JzffKek+gq/iP+kSBCivOe
 QGwENo8jYcyFWJvRG9WRzgD6EBog00X8A5yYYSkcAxRnA9xBKew=
X-Google-Smtp-Source: ACHHUZ7RRiPXnSzKx0R+ZIIwzSAyljOEFMUKKWFDqQySsFnSVJutLsXgaV5+vQiCHapczfYGF2i9iI133TgO4xBqpDo=
X-Received: by 2002:adf:dd8a:0:b0:2ef:ba4f:c821 with SMTP id
 x10-20020adfdd8a000000b002efba4fc821mr15564731wrl.36.1683847633861; Thu, 11
 May 2023 16:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSAz36QEnWSGBW__+GanpD4C==z+uQ+4LW7VCKXTpaO-9XBmg@mail.gmail.com>
 <87fs8gijh2.fsf@dell.be.48ers.dk>
In-Reply-To: <87fs8gijh2.fsf@dell.be.48ers.dk>
Date: Thu, 11 May 2023 19:27:02 -0400
Message-ID: <CAOSAz36DKMqXSFHFc8EovJBVhD0zmEcxiiYrzzxDj-fy9m2g6w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sense.com; s=google; t=1683847634; x=1686439634;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fzlmZU7+f+OH2ZZ1e0bVgmh7/fBPwrilSejnUYnNtYY=;
 b=GwfsbxoANRarBOnk9OGPIVkQstlpnz1jInq6rEO0zNjjz7aiCz/Lp9htRk35Mlt0HK
 iuURcE+QiHBr53tNFOy05K0xMk3blmbLpE5UAUS72kjR8q0+MuIwMxWOyIntUFCEO3fZ
 Tn9AREkZ3YbIN3NIj8txfLdR0z0hxgSKmVNNc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=sense.com header.i=@sense.com
 header.a=rsa-sha256 header.s=google header.b=GwfsbxoA
Subject: Re: [Buildroot] libopenssl CVEs
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
From: Matt Casperson via buildroot <buildroot@buildroot.org>
Reply-To: Matt Casperson <matt.casperson@sense.com>
Cc: Matt Casperson via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3545263549509138332=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3545263549509138332==
Content-Type: multipart/alternative; boundary="00000000000012a37c05fb7354c1"

--00000000000012a37c05fb7354c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Peter and I'm now realizing that those are different CVEs than the
ones I was curious about which I found to be mitigated in the latest build
so my bad here. Regarding the OpenSSL 3.0 transition has buildroot worked
with OpenSSL in the past for things like 0.9.0 to 1.0.1? I'm happy to
inquire with OpenSSL on potential assistance albeit my ability to influence
may not be as strong as others.

On Mon, May 1, 2023 at 3:44=E2=80=AFAM Peter Korsgaard <peter@korsgaard.com=
> wrote:

> >>>>> "Matt" =3D=3D Matt Casperson via buildroot <buildroot@buildroot.org=
>
> writes:
>
> Hi,
>
>  > Based on
>  >
> https://lore.kernel.org/buildroot/20230424053608.ADC944058F@smtp2.osuosl.=
org/
>  > I see a few libopenssl vulnerabilities and I was curious if there were
> any
>  > plans to provide a patch in an upcoming release. I did review Chapter
> 24 in
>  > the User Manual and other sections on patches but wasn't able to find
>  > anything specific on patching timelines. Or if you have a general
> approach
>  > to libopenssl that would also be good to know for future reference. I'=
m
> new
>  > to buildroot so apologies if I'm stumbling around here.
>
> I take it you are referring to:
>
> https://security-tracker.debian.org/tracker/CVE-2023-0464
> https://security-tracker.debian.org/tracker/CVE-2023-0465
> https://security-tracker.debian.org/tracker/CVE-2023-0466
>
> These are all low severity issues - In fact, so low that openssl has not
> made new releases with the fixes.
>
> Is there any specific reason you are worried about these issues? If so,
> feel free to send patches with the git formatted patches from openssl
> git for those:
>
> https://nightly.buildroot.org/manual.html#patch-policy
>
> A bigger issue with openssl is that the 1.1.1 series will go EOL in less
> than 6 months, so we should really start moving towards the 3.x series
> instead:
>
> https://www.openssl.org/blog/blog/2023/03/28/1.1.1-EOL/
>
> It would be great if people interested in OpenSSL security would help in
> that transition.
>
> --
> Bye, Peter Korsgaard
>

--00000000000012a37c05fb7354c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Peter and I&#39;m now realizing that those are diff=
erent CVEs than the ones I was curious about which I found to be mitigated =
in the latest build so my bad here. Regarding the OpenSSL 3.0 transition ha=
s buildroot worked with OpenSSL in the past for things like 0.9.0 to 1.0.1?=
 I&#39;m happy to inquire with OpenSSL on potential assistance albeit my ab=
ility to influence may not be as strong as others.</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 1, 2023 at 3:=
44=E2=80=AFAM Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">pe=
ter@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Matt&quot; =3D=3D Matt Casperso=
n via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org" target=3D"_b=
lank">buildroot@buildroot.org</a>&gt; writes:<br>
<br>
Hi,<br>
<br>
=C2=A0&gt; Based on<br>
=C2=A0&gt; <a href=3D"https://lore.kernel.org/buildroot/20230424053608.ADC9=
44058F@smtp2.osuosl.org/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/buildroot/20230424053608.ADC944058F@smtp2.osuosl.org/</a><br>
=C2=A0&gt; I see a few libopenssl vulnerabilities and I was curious if ther=
e were any<br>
=C2=A0&gt; plans to provide a patch in an upcoming release. I did review Ch=
apter 24 in<br>
=C2=A0&gt; the User Manual and other sections on patches but wasn&#39;t abl=
e to find<br>
=C2=A0&gt; anything specific on patching timelines. Or if you have a genera=
l approach<br>
=C2=A0&gt; to libopenssl that would also be good to know for future referen=
ce. I&#39;m new<br>
=C2=A0&gt; to buildroot so apologies if I&#39;m stumbling around here.<br>
<br>
I take it you are referring to:<br>
<br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-0464" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-0464</a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-0465" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-0465</a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-0466" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-0466</a><br>
<br>
These are all low severity issues - In fact, so low that openssl has not<br=
>
made new releases with the fixes.<br>
<br>
Is there any specific reason you are worried about these issues? If so,<br>
feel free to send patches with the git formatted patches from openssl<br>
git for those:<br>
<br>
<a href=3D"https://nightly.buildroot.org/manual.html#patch-policy" rel=3D"n=
oreferrer" target=3D"_blank">https://nightly.buildroot.org/manual.html#patc=
h-policy</a><br>
<br>
A bigger issue with openssl is that the 1.1.1 series will go EOL in less<br=
>
than 6 months, so we should really start moving towards the 3.x series<br>
instead:<br>
<br>
<a href=3D"https://www.openssl.org/blog/blog/2023/03/28/1.1.1-EOL/" rel=3D"=
noreferrer" target=3D"_blank">https://www.openssl.org/blog/blog/2023/03/28/=
1.1.1-EOL/</a><br>
<br>
It would be great if people interested in OpenSSL security would help in<br=
>
that transition.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div>

--00000000000012a37c05fb7354c1--

--===============3545263549509138332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3545263549509138332==--
