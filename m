Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB81E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 20:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0503B80D30;
	Sun, 12 Jan 2025 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmcA3tu8JcX8; Sun, 12 Jan 2025 20:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1103B811CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1103B811CA;
	Sun, 12 Jan 2025 20:59:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D59942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 145F2405BD
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znFuP2vRrVhw for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 20:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D83F64027B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83F64027B
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D83F64027B
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:59:02 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e46ebe19489so5236867276.2
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 12:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715541; x=1737320341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hgDiWHWrAaA1W0F/QuRONkiWcd5jdglfIA+9aoTlUtw=;
 b=syJqXLzXveM4NVTReq833EkshQkDwYx35TKTuoWf/dolAIfkIF6ivLhL0BRgiA9SUg
 Fa9tRQMA2nDBsYeJSyx/YiThZkFeYDU9B3EiwcCM8i5y0rwytAzZZ4fjpqpRzqJhbSQr
 m64i1q+IweCGczmY4QCIynAceV2cqJMnmVkNXQyv7SUz2Dl88d0dDXdssjYj42UbBx9K
 GxlrZLcgThJpgjppr6WLvJEMs9yi94lYOqk7tHaD3A2jrXF6ngU8zrha6jtTLXovB6xC
 QF0WfmR08KKYKY9w7+Vqso5QitNPQ9ZQ/igrk7b72rsenyRCSHk+67Olck3sjaT70VWQ
 vZdQ==
X-Gm-Message-State: AOJu0YwULHZ7M+/6Bfa3bdiCDAh8Rlbz9fTXtzCYzj0fW5YdFOvhVb3v
 WVjaCc5ZDmGuRDJOFwHrvCbLY96pC1iLqqDGRkFT+k4CVEcJjHLzpQUoikI2lM1E4HJ/G/KKExl
 cQep1tUPDnQoAmmtjfl4/YtC+wGw=
X-Gm-Gg: ASbGncuR3K3V3KmYc2KRLbhLILRWUtkkI7gVL/80VTsyTNlZd8phFd7asbgR0cNgKyM
 EYMLOehhtpxHedykDhdr0iQGMyIF9cK1rTC390Q==
X-Google-Smtp-Source: AGHT+IFt3BSZ736BmzK9TMKD2tOfMv6zRzC+2k7WHjuyxFk9Trqmgy3KX5u4XUz/MAeilsuwvOZMc0Ru1hLwwxU7sL8=
X-Received: by 2002:a05:690c:660c:b0:6ef:4fba:8153 with SMTP id
 00721157ae682-6f531248264mr150400487b3.10.1736715541389; Sun, 12 Jan 2025
 12:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20250109011807.28041-1-nemaakhilesh@gmail.com>
 <4c9c28ba8d404ac268334f211221f8b0@free.fr>
In-Reply-To: <4c9c28ba8d404ac268334f211221f8b0@free.fr>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 12 Jan 2025 12:58:35 -0800
X-Gm-Features: AbW1kvaya0sYOkQPKGxrnYfM8Dr9jOVx3zAsGX-4qfcFHleW5uhlGFxK56JVp4Q
Message-ID: <CAMV0Ro8cSRSMeMjWC6Q5HNW=9FD39MG1=9+HSqBYNPp6F2=tJg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736715541; x=1737320341; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hgDiWHWrAaA1W0F/QuRONkiWcd5jdglfIA+9aoTlUtw=;
 b=Bca3+UuGywrP7SiDVKWAkGhM0kES82t5XuCTuOde/sVTdt6rPDllJmQ53+MtZuAjvr
 muRGChIkAOR3kH0MSIk572IiOZ8n6IjIXON/88ytmBqbJS9AnveG0MJab2dPk7nD543C
 uMzNYKVGpZ4ZXwS/2hYjp3UK30LXrM4mUtegKrLZ0aKNTFo6D6XZtsxEG4okjqopApkG
 DEgvc9L3vXx4MelBjmxSd/XygPiV/Azej0vTX3XeDTnfB26DIk1+xL8R1YS/S05K17mi
 bZm3gxGuiC9K3G4oyoX+nUFYnUh/7Em/gFQK/abOxsY9fvziZuFANPJmsCv/O7kcZYy4
 VrAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bca3+UuG
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to
 4.4.37
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2113046424089530070=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2113046424089530070==
Content-Type: multipart/alternative; boundary="000000000000eba937062b889808"

--000000000000eba937062b889808
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sat, Jan 11, 2025 at 5:19=E2=80=AFAM Julien Olivain <ju.o@free.fr> wrote=
:


> When testing this new version with the command:
>
>      utils/test-pkg -a -p libxcrypt
>
> it seems all builds are now failing. The failures seems related
> to the release archive autoconf "configure" script which was
> generated with a newer pkgconf, which includes commit [1].
>
> This means new dependencies might be needed, such as:
>
> LIBXCRYPT_DEPENDENCIES =3D host-pkgconf
> HOST_LIBXCRYPT_DEPENDENCIES =3D host-pkgconf
>
> Could you confirm this analysis and send an updated patch please?
> Could you also add the explanation in the commit log why those
> new dependencies are needed?
>
>
> https://github.com/pkgconf/pkgconf/commit/c583d49a3780c71c0d20a662a7cf562=
f6d01c171


Thank you for investigating the package build failure and providing a
solution.

The configuration error occurred due to the generated aclocal.m4 triggering
an error when pkg-config was not found.

This issue has also been reported at:
https://github.com/besser82/libxcrypt/issues/198#issue-2764045470

I will prepare and submit an updated patch with the suggested fix.

Thanks
Akhilesh

--000000000000eba937062b889808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Julien,</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 11, 2025 at 5:=
19=E2=80=AFAM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" target=3D"=
_blank">ju.o@free.fr</a>&gt; wrote:<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
When testing this new version with the command:<br>
<br>
=C2=A0 =C2=A0 =C2=A0utils/test-pkg -a -p libxcrypt<br>
<br>
it seems all builds are now failing. The failures seems related<br>
to the release archive autoconf &quot;configure&quot; script which was<br>
generated with a newer pkgconf, which includes commit [1].<br>
<br>
This means new dependencies might be needed, such as:<br>
<br>
LIBXCRYPT_DEPENDENCIES =3D host-pkgconf<br>
HOST_LIBXCRYPT_DEPENDENCIES =3D host-pkgconf<br>
<br>
Could you confirm this analysis and send an updated patch please?<br>
Could you also add the explanation in the commit log why those<br>
new dependencies are needed?<br>
<br><a href=3D"https://github.com/pkgconf/pkgconf/commit/c583d49a3780c71c0d=
20a662a7cf562f6d01c171" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/pkgconf/pkgconf/commit/c583d49a3780c71c0d20a662a7cf562f6d01c171</a></b=
lockquote><div><br></div><div>Thank you for investigating the package build=
 failure and providing a solution.<br><br>The configuration error occurred =
due to the generated aclocal.m4 triggering an error when pkg-config was not=
 found.<br><br>This issue has also been reported at:<br><a href=3D"https://=
github.com/besser82/libxcrypt/issues/198#issue-2764045470">https://github.c=
om/besser82/libxcrypt/issues/198#issue-2764045470</a><br><br>I will prepare=
 and submit an updated patch with the suggested fix.</div><div><br></div><d=
iv>Thanks</div><div>Akhilesh<br></div></div></div>
</div>

--000000000000eba937062b889808--

--===============2113046424089530070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2113046424089530070==--
