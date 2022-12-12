Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68016C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 16:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C841A405FC;
	Mon, 12 Dec 2022 16:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C841A405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cRKoZA8xF_5; Mon, 12 Dec 2022 16:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F00E40256;
	Mon, 12 Dec 2022 16:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F00E40256
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81E131BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5702640123
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5702640123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2QRueyosknj for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 16:50:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D82C40101
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D82C40101
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 16:50:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id b2so29591987eja.7
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OuWujmLXXUBl8dV6RxkwGWpxqN9TAzwNwkT3oZGhSFM=;
 b=UBBr19xNGESbLMpz+MmDYXARDWGCy87xpqLNSZ/GXrlxeIj9yKTU8HYOgbOdq8Ru8X
 4emr704J+CdC0cHG8JxNo32RvuMJF5TMZBcltXcUqsFOaIYJNO42d82TeJ0f3DrgdwuT
 I4m26yr7r9dK98ovB/dPWWLZ/OOuxVFeoRwG49SoVIm5LARD+xMKTg4uxmGulcUce+sF
 D5QV79NyQROMbl7DlzfK9g2fvj6OUxq87D/S/7trhvQLf3GO1qxC9cSVkarrUH8tXy86
 3zR6nWh8giw3r7d1wvW5R+cnvtBJijMgg0fT5QaE4pXQLthpcyyv+NJw75wWaiI5e36X
 4t1A==
X-Gm-Message-State: ANoB5pmbfQjr8rVnhtsrTmjXoMgBWnL7ccZ2K3W2gKuyDusomNUdcOPs
 8vLJncdOtRbN9E4LJLfX8HFxlbi8GxnYhqa2s3kN4TQfBFw=
X-Google-Smtp-Source: AA0mqf5yAraWx1c/Dhao4xj/H9vEQOqQrVnKewQrFc/TW84jtqIUrUxt1ZqBJbZZSxDxiwM8Z0glwy8SXJjwGocLCDs=
X-Received: by 2002:a17:906:a11a:b0:7c0:9cb9:bac8 with SMTP id
 t26-20020a170906a11a00b007c09cb9bac8mr34455339ejy.25.1670863820739; Mon, 12
 Dec 2022 08:50:20 -0800 (PST)
MIME-Version: 1.0
From: John Lemonovich <lemonoje@gmail.com>
Date: Mon, 12 Dec 2022 11:50:10 -0500
Message-ID: <CABBCHidJG84Y_tpnSAE7t2qksEj4izv_TRMRLxfNcbADDUw05A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OuWujmLXXUBl8dV6RxkwGWpxqN9TAzwNwkT3oZGhSFM=;
 b=UAlVl73ewB4BYdtS5swUr4u27f8uL1BHMnH0qcFSWefNpcPAfjasSwFj/fZfnKbXCU
 zJ38IwNTJAdcVdzWzJfdWdfd6BylIKgGVqcOCBjoDeioZ39TAB1X/YAFD9CLhQRodolu
 P0gay9b6BDEwcLDjtA9BS58oJ/LXgqWLYhcYxXq/vCWyDehDeIsOqEB2ttB5Qc9X6WM+
 CH0+/+Kq1+DYSCoAZpSX8vTovV6WnP7N0ObhUSpckrL0fdy8d9l5RoQvyO9Ho5rsldCI
 8ZHkeBOYVKhks96RDP8xy+9wY065nza4WlyHGSpi6tPryudiOw9stsTyX0kPxgw7IUrj
 vWNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UAlVl73e
Subject: [Buildroot] error - machine `ARM-buildroot' not recognized for
 libpcap
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
Content-Type: multipart/mixed; boundary="===============2363448888481734683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2363448888481734683==
Content-Type: multipart/alternative; boundary="00000000000080d8f605efa44c1b"

--00000000000080d8f605efa44c1b
Content-Type: text/plain; charset="UTF-8"

I am trying to build a rootfs for an Intel SOC FPGA (Arria 10) using
buildroot.  I've had success in the past but am now trying to build a newer
version FS (Buildroot 2019.11.3 Configuration) and I get stuck at this
error.  Does anyone know how to fix/address the error?  I am adding IPv6
support, and I believe this is required for one or more of the networking
applications I'm including.  I have tried various external toolchains all
with the same result, and this output is from the setting  "Toolchain to be
downloaded and installed".



checking build system type... x86_64-pc-linux-gnu
checking host system type... Invalid configuration
`ARM-buildroot-linux-gnueabihf': machine `ARM-buildroot' not recognized
configure: error: /bin/bash ./config.sub ARM-buildroot-linux-gnueabihf
failed
package/pkg-generic.mk:242: recipe for target
'/us/jlemonovich/skyfather/ipv6/buildroot/output/build/libpcap-1.9.1/.stamp_configured'
failed
make: ***
[/us/jlemonovich/skyfather/ipv6/buildroot/output/build/libpcap-1.9.1/.stamp_configured]
Error 1
make: Leaving directory '/us/jlemonovich/skyfather/ipv6/buildroot'
root@ubuntu18-test:/us/jlemonovich/skyfather/ipv6#
STAGING_DIR="/us/jlemonovich/skyfather/ipv6/buildroot/output/host/ARM-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl ac_cv_lbl_unaligned_fail=yes
ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes
ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes
ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes
ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec=""
ac_cv_c_bigendian=no  ac_cv_header_linux_wireless_h=yes
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -Os  " CONFIG_SITE=/dev/null ./configure
--target=ARM-buildroot-linux-gnueabihf --host=ARM-buildroot-linux-gnueabihf
--build=x86_64-pc-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --localstatedir=/var --program-prefix=""
--disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs
--disable-documentation --with-xmlto=no --with-fop=no
--disable-dependency-tracking --enable-ipv6 --disable-nls --disable-static
--enable-shared  --disable-yydebug --with-pcap=linux --without-dag
--disable-dbus --disable-bluetooth --without-libnl )
-bash: syntax error near unexpected token `)'
root@ubuntu18-test:/us/jlemonovich/skyfather/ipv6# configure: WARNING:
unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html,
--disable-doc, --disable-docs, --disable-documentation, --with-xmlto,
--with-fop, --disable-dependency-tracking, --disable-nls, --disable-static
configure:: command not found


Thank you,
John

--00000000000080d8f605efa44c1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am trying to build a rootfs for an Intel SOC FPGA (=
Arria 10) using buildroot.=C2=A0 I&#39;ve had success in the past but am no=
w trying to build a newer version FS (Buildroot 2019.11.3 Configuration) an=
d I get stuck at this error.=C2=A0 Does anyone know how to fix/address the =
error?=C2=A0 I am adding IPv6 support, and I believe this is required for o=
ne or more of the networking applications I&#39;m including.=C2=A0 I have t=
ried various external toolchains all with the same result, and this output =
is from the setting=C2=A0 &quot;Toolchain to be downloaded and installed&qu=
ot;.</div><div><br></div><div><br></div><div><br></div><div>checking build =
system type... x86_64-pc-linux-gnu<br></div><div>checking host system type.=
.. Invalid configuration `ARM-buildroot-linux-gnueabihf&#39;: machine `ARM-=
buildroot&#39; not recognized<br>configure: error: /bin/bash ./config.sub A=
RM-buildroot-linux-gnueabihf failed<br>package/<a href=3D"http://pkg-generi=
c.mk:242">pkg-generic.mk:242</a>: recipe for target &#39;/us/jlemonovich/sk=
yfather/ipv6/buildroot/output/build/libpcap-1.9.1/.stamp_configured&#39; fa=
iled<br>make: *** [/us/jlemonovich/skyfather/ipv6/buildroot/output/build/li=
bpcap-1.9.1/.stamp_configured] Error 1<br>make: Leaving directory &#39;/us/=
jlemonovich/skyfather/ipv6/buildroot&#39;<br>root@ubuntu18-test:/us/jlemono=
vich/skyfather/ipv6# STAGING_DIR=3D&quot;/us/jlemonovich/skyfather/ipv6/bui=
ldroot/output/host/ARM-buildroot-linux-gnueabihf/sysroot&quot; INTLTOOL_PER=
L=3D/usr/bin/perl ac_cv_lbl_unaligned_fail=3Dyes ac_cv_func_mmap_fixed_mapp=
ed=3Dyes ac_cv_func_memcmp_working=3Dyes ac_cv_have_decl_malloc=3Dyes gl_cv=
_func_malloc_0_nonnull=3Dyes ac_cv_func_malloc_0_nonnull=3Dyes ac_cv_func_c=
alloc_0_nonnull=3Dyes ac_cv_func_realloc_0_nonnull=3Dyes lt_cv_sys_lib_sear=
ch_path_spec=3D&quot;&quot; ac_cv_c_bigendian=3Dno =C2=A0ac_cv_header_linux=
_wireless_h=3Dyes CFLAGS=3D&quot;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 =C2=A0-Os =C2=A0&quot; CONFIG_SITE=3D/dev/null ./c=
onfigure --target=3DARM-buildroot-linux-gnueabihf --host=3DARM-buildroot-li=
nux-gnueabihf --build=3Dx86_64-pc-linux-gnu --prefix=3D/usr --exec-prefix=
=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var --program-prefix=3D&quot=
;&quot; --disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-do=
cs --disable-documentation --with-xmlto=3Dno --with-fop=3Dno --disable-depe=
ndency-tracking --enable-ipv6 --disable-nls --disable-static --enable-share=
d =C2=A0--disable-yydebug --with-pcap=3Dlinux --without-dag --disable-dbus =
--disable-bluetooth --without-libnl )<br>-bash: syntax error near unexpecte=
d token `)&#39;<br>root@ubuntu18-test:/us/jlemonovich/skyfather/ipv6# confi=
gure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-h=
tml, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, =
--with-fop, --disable-dependency-tracking, --disable-nls, --disable-static<=
br>configure:: command not found=C2=A0=C2=A0<br></div><div><br></div><div><=
br></div><div>Thank you,</div><div>John</div></div>

--00000000000080d8f605efa44c1b--

--===============2363448888481734683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2363448888481734683==--
