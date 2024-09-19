Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD82ACF3970
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0ED61612;
	Thu, 19 Sep 2024 21:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifqiE_818V_4; Thu, 19 Sep 2024 21:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB0360772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB0360772;
	Thu, 19 Sep 2024 21:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B06D1BF37E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 21:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2956B403EB
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 21:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29jZ1wz-HwcA for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 21:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B70294013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B70294013C
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B70294013C
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 21:19:42 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-710de2712eeso515706a34.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 14:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726780781; x=1727385581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ok4vhtoTI+pysUv4QIcmgG8t0ZDfmvxb2V96NInipYc=;
 b=a/LMOzvrrW4FPVvfQWWXd4gTRfoscul5ny2oqKb9aho/AMB+TgOzjxlYw3hafTlr5C
 kcpsX9oMAgAXQ4b0VIGnsJRbs7Yp7f9CmZWLC+laK3QADWBsYgA1lKBOl6e53XRM9lOG
 OhifVplhn5sBLPY8g6/IqmpbO+hVB6p3WhL+EwENynN9ZgC9s1rMowKYZe0V/m8cCD2h
 KTWzgNSORCMAjdMDL7Bdz5vUYH4WEHq8NPo5KDjudKYpkhiiAiYcTxiQerdkrN0iVlY2
 6NIK4SUXtBIDu88DjyNzIWrBjdUlgnMHy3+qHCf4fkw2wmdlrSENLFsdCtTSqoTFfuNI
 x19g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOK1twgD+deyb6kXPvzZddJQ8bwccfdnW/OhTNt1e1pc8jKbsu5zOC6VH/HhCofI4/5wnHkQYxecI=@buildroot.org
X-Gm-Message-State: AOJu0YyNiOqbgu3siXGCcj1FE3QpMfsRmeOnNKxoQZ3juqH5VFB//DvA
 kWwtN23m19CWw13TzXyIoMiyTxYQtDJ9LkJ8qJROHD7uYvQl+6abe5ppCv0neEHfg8+dCpzcv6+
 U
X-Google-Smtp-Source: AGHT+IFqsLJklwHc5ZauMpKeXqGE1LX6qAAwQ70MLVCmcevfvJGZkptUg8H4LrPMyPl+NMc88AfJwA==
X-Received: by 2002:a05:6830:6f8f:b0:703:5dbc:1aa9 with SMTP id
 46e09a7af769-713923d0b06mr878224a34.13.1726780781530; 
 Thu, 19 Sep 2024 14:19:41 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com.
 [209.85.161.41]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71389bcbc25sm437490a34.79.2024.09.19.14.19.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 14:19:41 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5e1b55346c0so620915eaf.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 14:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3N7lWmKyqYpkaw4a5U1AD59w1rlXjMMer/vHftVaZlnb3iPuTWik4WcTN4xOzVIA9c4Hp1ON02lo=@buildroot.org
X-Received: by 2002:a05:6870:1b8b:b0:277:d8ee:6dda with SMTP id
 586e51a60fabf-2803a6689e2mr658591fac.23.1726780780548; Thu, 19 Sep 2024
 14:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
 <20240724221001.7ec77c1b@windsurf>
 <CAOMZO5DbYXhKjwpyoLUFhV97_VZ076ExChBWmAzU8Z5FN-M6kQ@mail.gmail.com>
 <18b7c354-da3a-47fd-a424-d0391eea9fac@mind.be>
In-Reply-To: <18b7c354-da3a-47fd-a424-d0391eea9fac@mind.be>
Date: Thu, 19 Sep 2024 14:19:29 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p8_nYHXnZAeTw2z-hz6x2Y1c=gD7WQOMqWcc6830Z2tQ@mail.gmail.com>
Message-ID: <CA+h8R2p8_nYHXnZAeTw2z-hz6x2Y1c=gD7WQOMqWcc6830Z2tQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1726780781; x=1727385581; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ok4vhtoTI+pysUv4QIcmgG8t0ZDfmvxb2V96NInipYc=;
 b=oWqI5Fyv46DjCgs0dZbbxwP2oN5Si8ZccPTUHyKidkZ4Fdl8wqAXvtTEZ9eXGTSYOD
 mf6XUhUbaHpmWvrKJs8tCoSnscVysf8z8ZKYqu6Z4oBuJd1V+R3uUO5iEB/XkReo+39u
 TVr0MikYgjbBhd4wJ9cI2mc+ext7LcWmJONINoYvYgy+V5j9rNzLvvvWZhw4QcJTXkjI
 ZGjNF1TAxCECjTm7/nqv76I+Kc9cr0UcZQNm+K47WIZqhbTgMjrFswtFuBiushvNZIC4
 f1ZxRbWFFzvCldHbn/F7QXkIz26m9FlEEwRshTNyJ/AHY6QUMrlg6hOZ4PMkJwdjJbhk
 OjbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=oWqI5Fyv
Subject: Re: [Buildroot] crucible: Build failure on riscv64/mips64el
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5578173365572191288=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5578173365572191288==
Content-Type: multipart/alternative; boundary="00000000000007a25806227f7b39"

--00000000000007a25806227f7b39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

On Thu, Sep 19, 2024, 4:55=E2=80=AFAM Arnout Vandecappelle <arnout@mind.be>=
 wrote:

> > Can anyone please help with these Go issues?
> >
> > I keep getting build failure reports for the crucible package.
> >
> > Here is another one:
> >
> https://autobuild.buildroot.org/results/b56d9376bd758081e27bc349c192783ec=
e22a4fb/build-end.log
>
>   If we don't find a solution I think we should disable Go entirely for
> these
> architectures. Until someone shows up who is willing to put in the effort
> to
> make it work.
>

Go can compile and run fine on these architectures, just this specific
package has an incompatibility. I would suggest instead filing an issue on
the project GitHub page with the build error and disabling the package for
that known incompatible architecture + GOARM.

Best regards,
Christian

--00000000000007a25806227f7b39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Arnout,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Sep 19, 2024, 4:55=E2=80=AFAM Arnout=
 Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;=
 wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
&gt; Can anyone please help with these Go issues?<br>
&gt; <br>
&gt; I keep getting build failure reports for the crucible package.<br>
&gt; <br>
&gt; Here is another one:<br>
&gt; <a href=3D"https://autobuild.buildroot.org/results/b56d9376bd758081e27=
bc349c192783ece22a4fb/build-end.log" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://autobuild.buildroot.org/results/b56d9376bd758081e27bc34=
9c192783ece22a4fb/build-end.log</a><br>
<br>
=C2=A0 If we don&#39;t find a solution I think we should disable Go entirel=
y for these <br>
architectures. Until someone shows up who is willing to put in the effort t=
o <br>
make it work.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Go can compile and run fine on these architectures, just this =
specific package has an incompatibility. I would suggest instead filing an =
issue on the project GitHub page with the build error and disabling the pac=
kage for that known incompatible architecture + GOARM.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Christi=
an=C2=A0</div></div>

--00000000000007a25806227f7b39--

--===============5578173365572191288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5578173365572191288==--
