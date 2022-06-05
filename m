Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA4EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 16:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49E8E61202;
	Sun,  5 Jun 2022 16:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikoFDgR3Pceg; Sun,  5 Jun 2022 16:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C86161005;
	Sun,  5 Jun 2022 16:17:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBE531BF408
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 16:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87CB41959
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 16:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sonologic.nl
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJILuh9JVMma for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 16:17:35 +0000 (UTC)
X-Greylist: delayed 00:08:09 by SQLgrey-1.8.0
Received: from mx1.sonologic.net (mx1.sonologic.net [178.63.120.202])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AE8D41946
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 16:17:34 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=178.63.120.221; helo=monk.sonologic.nl;
 envelope-from=gmc@sonologic.nl;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from monk.sonologic.nl (portal.sonologic.net [178.63.120.221])
 (authenticated bits=0)
 by mx1.sonologic.net (8.17.1/8.16.1) with ESMTPA id 255G92dJ076175
 for <buildroot@buildroot.org>; Sun, 5 Jun 2022 16:09:03 GMT
 (envelope-from gmc@sonologic.nl)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sonologic.nl; s=dkim;
 t=1654445343; bh=ojBAlFl0fGxNGqwRBP/MHaaMWQM+ldJAI0AfgNpx3nk=;
 h=Date:From:To:Subject;
 b=DISgcLV0rjIp54LZ+P9XQD7SdYg7Dt/fZnmpg5G9HgHyzm09rA5PUtnBn8arVIAYl
 LgpxHB1Ncch0N2MADvP/3h4gFhe4fxqw53/GuJTrPyGoXP6vNIj36XUy6fwRx2I4AQ
 8QGpeye+clOL2AT5v9tcFmIKzeSqewc08lVmvmJX8CScVSEvPPDyNM3imeUuOU8Gik
 e0i32fVZUEfrc23Pql/nasdDhTZ1wYP7a8o7mxFVQ7ozABAKR9PQank+5KsQeVLJgS
 YpB0Q43dVnlBUTf9UnDzKUwtqYb0jck9fgoUdY60RA9HselC+PB3GcHFM5IthJT/ks
 JcsSnluAJpM9A==
X-Authentication-Warning: mx1.sonologic.net: Host portal.sonologic.net
 [178.63.120.221] claimed to be monk.sonologic.nl
Date: Sun, 5 Jun 2022 18:09:02 +0200
From: Koen Martens <gmc@sonologic.nl>
To: buildroot@buildroot.org
Message-ID: <20220605160902.GA1283120@coltrane>
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (mx1.sonologic.net [178.63.120.202]); Sun, 05 Jun 2022 16:09:04 +0000 (UTC)
Subject: [Buildroot] [PATCH 1/1] package/linuxconsoletools: bump version to
 1.8.1
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
Content-Type: multipart/mixed; boundary="===============1443521332548728884=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1443521332548728884==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Upstream has released a new version. In this version, they
have chosen to copy the conditional compilation of tools,
however they have chosen to use DISABLE_* flags instead
of ENABLE_* flags. Therefore, the logic in our .mk file
has been reversed: when an option is *NOT* selected, we
set the corresponding DISABLE_* flag.

As a corollary, the patch to add conditional compilation
in the upstream Makefile is no longer needed and is
removed in this commit.

Tested compilation by running `./utils/test-pkg -a` with
a configuration that enables all options tools.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Tested-by: Koen Martens <gmc@sonologic.nl>
---
 .../0001-conditional-build.patch              | 58 -------------------
 .../linuxconsoletools/linuxconsoletools.hash  |  2 +-
 .../linuxconsoletools/linuxconsoletools.mk    | 18 +++---
 3 files changed, 10 insertions(+), 68 deletions(-)
 delete mode 100644 package/linuxconsoletools/0001-conditional-build.patch

diff --git a/package/linuxconsoletools/0001-conditional-build.patch b/packa=
ge/linuxconsoletools/0001-conditional-build.patch
deleted file mode 100644
index 9f462a6436..0000000000
--- a/package/linuxconsoletools/0001-conditional-build.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Selectively build groups of tools (inputattach,
-joystick tools and/or force-feedback tools).
-
-Signed-off-by: Koen Martens <gmc@sonologic.nl>
-
-diff -Naur a/utils/Makefile b/utils/Makefile
---- a/utils/Makefile	2016-04-19 23:28:36.000000000 +0200
-+++ b/utils/Makefile	2017-06-19 08:54:20.152184000 +0200
-@@ -27,8 +27,26 @@
-=20
- CFLAGS		?=3D -g -O2 -Wall
-=20
--PROGRAMS	=3D inputattach jstest jscal fftest ffmvforce ffset \
--		  ffcfstress jscal-restore jscal-store evdev-joystick
-+PROGRAMS    =3D
-+
-+ifdef ENABLE_INPUTATTACH
-+PROGRAMS	+=3D inputattach
-+endif
-+
-+ifdef ENABLE_JOYSTICK
-+PROGRAMS    +=3D jstest
-+PROGRAMS    +=3D jscal
-+PROGRAMS    +=3D jscal-restore
-+PROGRAMS    +=3D jscal-store
-+PROGRAMS    +=3D evdev-joystick
-+endif
-+
-+ifdef ENABLE_FORCEFEEDBACK
-+PROGRAMS    +=3D fftest
-+PROGRAMS    +=3D ffmvforce
-+PROGRAMS    +=3D ffset
-+PROGRAMS    +=3D ffcfstress
-+endif
-=20
- PREFIX          ?=3D /usr/local
-=20
-@@ -79,13 +97,20 @@
- 80-stelladaptor-joystick.rules: 80-stelladaptor-joystick.rules.in
- 	sed "s^@@PREFIX@@^$(PREFIX)^g" < $^ > $@
-=20
-+INSTALL_DEP =3D compile
-+ifdef ENABLE_JOYSTICK
-+INSTALL_DEP +=3D  80-stelladaptor-joystick.rules
-+endif
-+
- install: compile 80-stelladaptor-joystick.rules
- 	install -d $(DESTDIR)$(PREFIX)/bin
- 	install $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
-+ifdef ENABLE_JOYSTICK
- 	install -d $(DESTDIR)$(PREFIX)/share/joystick
- 	install extract filter ident $(DESTDIR)$(PREFIX)/share/joystick
- 	install -d $(DESTDIR)/lib/udev/rules.d
- 	install js-set-enum-leds $(DESTDIR)/lib/udev
- 	install -m 644 80-stelladaptor-joystick.rules $(DESTDIR)/lib/udev/rules.d
-+endif
-=20
- .PHONY: compile clean distclean install
diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/lin=
uxconsoletools/linuxconsoletools.hash
index 889f6d1d6c..8e4099f163 100644
--- a/package/linuxconsoletools/linuxconsoletools.hash
+++ b/package/linuxconsoletools/linuxconsoletools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547  =
linuxconsoletools-1.7.1.tar.bz2
+sha256  4da29745c782b7db18f5f37c49e77bf163121dd3761e2fc7636fa0cbf35c2456  =
linuxconsoletools-1.8.1.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  =
COPYING
diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linux=
consoletools/linuxconsoletools.mk
index 306a5b1fa0..a97618c832 100644
--- a/package/linuxconsoletools/linuxconsoletools.mk
+++ b/package/linuxconsoletools/linuxconsoletools.mk
@@ -4,24 +4,24 @@
 #
 ##########################################################################=
######
=20
-LINUXCONSOLETOOLS_VERSION =3D 1.7.1
+LINUXCONSOLETOOLS_VERSION =3D 1.8.1
 LINUXCONSOLETOOLS_SOURCE =3D linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION=
).tar.bz2
 LINUXCONSOLETOOLS_SITE =3D https://downloads.sourceforge.net/project/linux=
console
 LINUXCONSOLETOOLS_LICENSE =3D GPL-2.0+
 LINUXCONSOLETOOLS_LICENSE_FILES =3D COPYING
=20
-ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH),y)
-LINUXCONSOLETOOLS_MAKE_OPTS +=3D ENABLE_INPUTATTACH=3D1
+ifneq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH),y)
+LINUXCONSOLETOOLS_MAKE_OPTS +=3D DISABLE_INPUTATTACH=3D1
 endif
=20
-ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK),y)
-LINUXCONSOLETOOLS_MAKE_OPTS +=3D ENABLE_JOYSTICK=3D1
+ifneq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK),y)
+LINUXCONSOLETOOLS_MAKE_OPTS +=3D DISABLE_JOYSTICK=3D1
 endif
=20
-ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
-LINUXCONSOLETOOLS_MAKE_OPTS +=3D \
-	ENABLE_FORCEFEEDBACK=3D1 \
-	CFLAGS=3D"$(TARGET_CFLAGS) -std=3Dgnu99"
+ifneq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
+LINUXCONSOLETOOLS_MAKE_OPTS +=3D DISABLE_FORCEFEEDBACK=3D1
+else
+LINUXCONSOLETOOLS_MAKE_OPTS +=3D CFLAGS=3D"$(TARGET_CFLAGS) -std=3Dgnu99"
 LINUXCONSOLETOOLS_DEPENDENCIES +=3D sdl2 host-pkgconf
 endif
=20
--=20
2.25.1

--=20
https://www.koenmartens.nl/

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRxWNkc6RvvZXHWHYiS0OBGuQU+lgUCYpzVHAAKCRCS0OBGuQU+
lp7eAJ93eQh5wLkTM05yF/IUQ6b2KbcJewCgswd3EZ6NRDyffMtsBSPjT9zfHLU=
=APQr
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============1443521332548728884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1443521332548728884==--
