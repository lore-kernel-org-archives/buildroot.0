Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB346C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 17:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D6A440570;
	Sat, 11 Feb 2023 17:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D6A440570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uauEQ0TvgGRb; Sat, 11 Feb 2023 17:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E34405E7;
	Sat, 11 Feb 2023 17:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E34405E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A26AC1BF580
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 17:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BDFD60758
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 17:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BDFD60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCTarntscmep for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 17:55:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136FC606FF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 136FC606FF
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 17:55:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.210]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1p27yg0upm-00T9zI; Sat, 11
 Feb 2023 18:55:48 +0100
Date: Sat, 11 Feb 2023 18:55:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230211185547.59a1fa42@gmx.net>
In-Reply-To: <20230211164926.GI2796@scaer>
References: <20230211163202.25627-1-ps.report@gmx.net>
 <20230211164926.GI2796@scaer>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:yXV98DTiPFR8XpzijBAxdDtj4cjDxQruOzAxm1iIbbz8Nn9BgiT
 iW11gbmltMdLgvyGaKrYOf0RGQOwbRqlaaku2SDTpPcQxk4MAGb6/62sEjfLeN1ueQazEBG
 7kBJUExTB11fMmgaaD6iZxDCZ2lUBh2D4B1EdjLAw99u/6Gwi4XcVUtkMNsgguqGSf+F3BS
 C3mJ780Gbq7dtqzEjxP5g==
UI-OutboundReport: notjunk:1;M01:P0:LqRKBvYgaek=;Qtp9IJk6jNRQA2QVRKZz1XSzCVO
 P76BE6jU+gTqEeND6pdM92uYqUqyELKsEyogqP1UqL6I1Cc+ORd+VZiWKW0BlYBHzLwRXnKsa
 0W02CY7DAwC7UYUtLOXpbjIjVRJx6/UA3ZzyPC68GjOPCUVvTnohyH9dDd12tyw3QXp0rGdrT
 H1xuLDfP0vA5k3iWNsvKdj2y9JiE0xi8sTZ4ARKrnXyRzCPN5yUqQtMC2m1tQ9DZ9yEfIPptA
 mG6Xr9/lRUdk+n7LHpk6avpDGQ7OeealR+bIX2jGE1MkF0N+Xw7eqQLKY//K0jX+myifYMsTh
 RfaFhsWjp7gewpupv+so/3JeQHg+vJ62fGQNxmRaQEpAXPjISn9MEiIlUrkH+XZ3EqNnO2sqe
 2nQpQ/6a8KvH7BdVMG00i+gYONmd6pELzgBecU5tQyymwYvRUyXgfkJnEKbyefs+n5CaSgugo
 Ia0hIa7kAIIzDs36bv1ZtMeReSscwba13VNOZKlh1omQUlBNcBxvjV29BGl1Q14gbHwC9FMvr
 wwF0kE56VeXYgXr5mXzcUfeNdL30rw3WVUTOy5WOe3trM4dSUITyfYBpt6YaLQ1PMMsGUuelN
 ZH6VparrFZ+mSo57DC1dHVmNLkgnyc08/FkUZxS1ST2803gxsG+Fr6Esv72K2wH0se1wuU17H
 uirQDpqgAShfIuJRNlLdEHeG+RE4wxOlnTKqyMXzFdX86cszxZuBrLDMycN82yi9yxXil+UH9
 u9Mm/NpzjOBVVp4rV7JhOZZsVuoHRYKaWVhyKN++cgl6N5PbIIUzH0ki1awH6sfNbQqPQjjac
 JzHMjlTA6QCWPxLCp4/Eq9e8BdI8fRd0XnOYU6b9uQDlHjTCZ5c2QYqKVg8d5VXYiZt0XQtGj
 93nik/XMZtzOKJ/c2PugwkRwNTw4EpDk5tA4T7PEIhbz3JoD6OsUTlt+22n+KuyvARJ7Ol8Eu
 Z91kaqDFlLen+rkSqce6awKOa1I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1676138148; bh=LSJSvEmyNFbXPKvoOnt6cX0sj5fOyq6WsUeOi4THif4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mqSXEmthBkRSr918Di4U7N16yX3dLqy7I1Kf3sZ5v+PD5qc4MhXOXyUxDvk5RFTg6
 P8Viu6O8KIMJPQkSIu5iW2fruyjWi2ozvr5IdDtOWFqKbI1anvg5FCuL+AUr0jHHVB
 oBVhRlFP+dtIhii6ayhXKG33U+EvIaH7cWDo5iJG409vdqhhMGhBi41Pk7g1WbvqO7
 xsL2G5EWqKbIxZ4JTYPKYEwQTF4xMoTz2vlUiJ/271c85Q1rCmP9IrHYOJohcAtHFN
 2twreL7wQBbj0vHiZSHkgBF58XQzxvH9QfLjX82z220Mus0Sj0d2TE9ukicIgMrvtZ
 WkcaC9nn1h7JA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=mqSXEmth
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: fix Stack Smashing
 Protection detection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann, *,

On Sat, 11 Feb 2023 17:49:26 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2023-02-11 17:32 +0100, Peter Seiderer spake thusly:
> > Fix SSP missdetection (compiler supports '-fstack-protector-all' command
> > line argument but selected libc/toolchain does not support SSP,
> > e.g. i686-musl.
> >
> > Fixes:
> >
> >   - http://autobuild.buildroot.net/results/ded9ad5badbcfa6552443d3ce0866722becfefbd
> >
> >   [...]
> >   Checking if C compiler supports -fstack-protector-all : yes
> >   [...]
> >   Checking for type struct timex                                  : no
> >   The configuration failed
> >   (complete log in .../build/ntpsec-1_2_2/build/config.log)
> >
> >   And from build/ntpsec-1_2_2/build/config.log:
> >
> >   err: .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: test.c.1.o: in function `main':
> >   test.c:(.text.startup+0x2a): undefined reference to `__stack_chk_fail_local'
> >   .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: .../build/ntpsec-1_2_2/build/.conf_check_01f3f794d5b6ffb7add7ce130581ae04/testbuild/main/testprog: hidden symbol `__stack_chk_fail_local' isn't defined
> >   .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: final link failed: bad value
> >   collect2: error: ld returned 1 exit status
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/ntpsec/ntpsec.mk | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
> > index c7fa2f85a8..18a8353900 100644
> > --- a/package/ntpsec/ntpsec.mk
> > +++ b/package/ntpsec/ntpsec.mk
> > @@ -30,6 +30,15 @@ NTPSEC_DEPENDENCIES = \
> >  	libcap \
> >  	openssl
> >
> > +# prevent '-fstack-protector-all' compiler flag detection without
> > +# ssp support (e.g. i686-musl)
> > +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> > +define NTPSEC_FORCE_DISABLE_SSP
> > +	$(SED) s/fstack-protector-all/fstack-protector-all-disabled/g $(@D)/wscript
> > +endef
> > +endif
> > +NTPSEC_PRE_CONFIGURE_HOOKS += NTPSEC_FORCE_DISABLE_SSP
>
> Assigning to hooks should be done in the conditional if-block, not
> outside.
>
> But in Buildroot, the SSP flags are automatically handled by the
> wrapper, so we should just unconditionally remove said flags as set by
> the package, like was done in 50cbac5099b1 (package/sysvinit: add patch
> to fix compile without stack-protector support) for example (and no,
> that commit was not chosen totally at random ;-) ).

Nice reference ;-), do you prefer the above sed hack unconditionally
(not sure if the wscript will add additional -lssp/-lssp_nonshared if
available) or a patch removing the whole -fstack-protector-all/-lssp/-lssp_nonshared
handling?

Regards,
Peter


>
> Regards,
> Yann E. MORIN.
>
> >  # CC="$(HOSTCC)" is strange but needed to build some host tools, the
> >  # cross-compiler will properly be used to build target code thanks to
> >  # --cross-compiler
> > --
> > 2.39.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
