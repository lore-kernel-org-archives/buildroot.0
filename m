Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AC6C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 09:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7207409DB;
	Mon, 26 Sep 2022 09:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7207409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUJBCQJeHjYo; Mon, 26 Sep 2022 09:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E443540883;
	Mon, 26 Sep 2022 09:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E443540883
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33BF41BF25F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B60F40883
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B60F40883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4d7HfXDr0Lsb for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 09:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C05AE40277
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C05AE40277
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 09:51:19 +0000 (UTC)
Received: from opfednr01.francetelecom.fr (unknown [xx.xx.xx.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr24.francetelecom.fr (ESMTP service) with ESMTPS id 4MbdLY2Mm8z201H; 
 Mon, 26 Sep 2022 11:51:17 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 26 Sep 2022 11:51:13 +0200
Date: Mon, 26 Sep 2022 11:51:13 +0200
From: <yann.morin@orange.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <4286_1664185876_63317614_4286_458_1_20220926095113.GB3010@tl-lnx-nyma7486>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
 <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de> <Yy3e9fTSv19Zxq9T@oscomms1>
 <20220926070545.GA3010@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <20220926070545.GA3010@tl-lnx-nyma7486>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX106.corporate.adroot.infra.ftgroup (10.115.27.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1664185877;
 bh=M6zPS6ZFB5Dd+dv0O3TVQo2wBtJnzYcXXYViWNb0ytA=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=ifLoQBq6I02DF3fsePBkY0b4piNH5T9MpdHhnsbiRX31mipkgSM97L9XIOgKRwsKK
 2lgq0FGuFcuZDNdztbdfZyQDS680h4fY+sL8ZqzRbMkfTktKqZvW+WYzcPz8Z9VAkI
 fIoQeVHIgiw1DkbOpTDzBqmUMUmterTZd6gfCzQWQCGjcLSmqU1n/+hZbxfykN3zrr
 MtesakZuSeyD1kTCGRW2iQmeg4g+ATkMYXTLWYaDJ8lrd9P5VdntVV1+JAmL2G61rD
 6sufFrxCQ9mmEwqAAzEIStQPjrJEYc0EKtoPDduhuPGgt50YumgWHiOaEzE84Rt5/B
 XFA0e6cg27JCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=ifLoQBq6
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline

Stafford, Waldemar, All,

On 2022-09-26 09:05 +0200, MORIN Yann INNOV/IT-S spake thusly:
> On 2022-09-23 16:29 +0000, Stafford Horne spake thusly:
> > On Fri, Sep 23, 2022 at 05:23:11PM +0200, Waldemar Brodkorb wrote:
> > > > On 2022-09-23 14:13 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > > > On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
> > > > > >     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
> > > > > This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.
> > > > >     ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
> > > > >     ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> 
> So, I made some progress in looking at this.
[--SNIP--]
> So, this hints at a compiler error...

I did a quick fix to libusb to workaround the issue (see attached
patch), but this issue is more widespread. For example, libndp fails
to build for the same reason:

      CCLD     ndptool
    ..../or1k-buildroot-linux-uclibc/bin/ld: ../libndp/.libs/libndp.so: undefined reference to `__tls_get_addr'

So, we can't chase all libraries that will want to use some TLS
objects, espeically as the issue may well occur in another package.

I looked at the build options for libusb, and there is absolutely
nothing weird going on (see attached log).

The more I look at it, the more it smells like a gcc issue. Thoughts?

In the end, I wonder how we can solve this in Buildroot... Just disable
LT for or1k?

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment;
	filename="0001-package-libusb-workaround-for-LinuxThread-issue-on-o.patch"

From 00a4674b912ad63dd235ffb52536d588828ed0d2 Mon Sep 17 00:00:00 2001
Message-Id: <00a4674b912ad63dd235ffb52536d588828ed0d2.1664184918.git.yann.morin@orange.com>
From: "Yann E. MORIN" <yann.morin@orange.com>
Date: Mon, 26 Sep 2022 11:05:36 +0200
Subject: [PATCH] package/libusb: workaround for LinuxThread issue on or1k

There is an issue with LinuxThreads on or1k, whereby a call to
__tls_get_addr is made, even though this is an NPTL-only call.

This looks like a compiler bug (see thread [0]), but we could not spot
any relevant issue in the gcc bug tracker.

Add a workaround.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Stafford Horne <shorne@gmail.com>
---
 ...ds_posix-only-use-TLS-when-available.patch | 96 +++++++++++++++++++
 package/libusb/libusb.mk                      |  3 +
 2 files changed, 99 insertions(+)
 create mode 100644 package/libusb/0001-threads_posix-only-use-TLS-when-available.patch

diff --git a/package/libusb/0001-threads_posix-only-use-TLS-when-available.patch b/package/libusb/0001-threads_posix-only-use-TLS-when-available.patch
new file mode 100644
index 0000000000..7bd877fb16
--- /dev/null
+++ b/package/libusb/0001-threads_posix-only-use-TLS-when-available.patch
@@ -0,0 +1,96 @@
+From add0e53365cd5e8f2a49651d472b9dfcf51e1395 Mon Sep 17 00:00:00 2001
+Message-Id: <add0e53365cd5e8f2a49651d472b9dfcf51e1395.1664181489.git.yann.morin@orange.com>
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Mon, 26 Sep 2022 10:17:15 +0200
+Subject: [PATCH] threads_posix: only use TLS when available
+
+On OpenRISC or1k, with uClibc-ng and LinuxThreads (not NPTL), and a C11
+compiler (tested with gcc-11.3.0), _Thread_local is properly parsed by
+the compiler, and thus we do detect a C11 compiler (lines 48-66 in
+configure.ac), but it (presumably incorrectly) emits calls to
+__tls_get_addr, which is obviously missing because LinuxThreads do not
+implement TLS (which requires NPTL).
+
+This causes link failures for programs that try to link with libusb,
+e.g.:
+    http://autobuild.buildroot.net/results/7ad/7adc125e843b21b559f1e8813059d65af58feb8d/build-end.log
+
+    ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl [...] -lusb-1.0 -lm -lrt -lnsl
+    ..../or1k-buildroot-linux-uclibc/11.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+        ..../or1k-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
+    collect2: error: ld returned 1 exit status
+
+This, despite the fact that the compiler was configured with
+--disable-tls, so this is presumably a compiler issue specific to or1k.
+However, all versions of gcc were tested to behave that way or or1k, and
+no bug report about that issue have been spotted.
+
+On other architectures, though (e.g. arm), that call is not emitted, and
+the link succeeds.
+
+We add a new test, that partially restores the one removed by
+9a1bc8cafb90 (build: Require C11 to build and clean up
+autoconfig/automake files), to check that we can actually link a program
+(not a shared object) with _Thread_local. If we can't, then
+threads_posix will not cache the TID.
+
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+Upstream status: N/A
+---
+ configure.ac              |  9 +++++++++
+ libusb/os/threads_posix.c | 11 ++++++++---
+ 2 files changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4f12510..a78c2dd5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -154,6 +154,15 @@ if test "x$platform" = xposix; then
+ 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
+ 		[], [])
+ 	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
++	dnl Even with C11, some compilers may lack proper _Thread_local (e.g. if using LinuxThreads instead of NPTL).
++	saved_CFLAGS="${CFLAGS}"
++	CFLAGS="${CFLAGS} -fPIC"
++	AC_MSG_CHECKING([whether CC supports _Thread_local])
++	AC_LINK_IFELSE([AC_LANG_PROGRAM([_Thread_local int v;], [v=42])],
++		[AC_MSG_RESULT([yes])
++		AC_DEFINE([HAVE_CC_THREAD_LOCAL], [1], [Define to 1 if the compiler supports _Thread_local.])],
++		[AC_MSG_RESULT([no])])
++	CFLAGS="${saved_CFLAGS}"
+ elif test "x$platform" = xwindows; then
+ 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
+ else
+diff --git a/libusb/os/threads_posix.c b/libusb/os/threads_posix.c
+index 0e0e2213..b3a3c338 100644
+--- a/libusb/os/threads_posix.c
++++ b/libusb/os/threads_posix.c
+@@ -83,11 +83,12 @@ int usbi_cond_timedwait(pthread_cond_t *cond,
+ 
+ unsigned int usbi_get_tid(void)
+ {
++#ifdef HAVE_CC_THREAD_LOCAL
+ 	static _Thread_local unsigned int tl_tid;
+-	int tid;
+-
+ 	if (tl_tid)
+ 		return tl_tid;
++#endif
++	int tid;
+ 
+ #if defined(__ANDROID__)
+ 	tid = gettid();
+@@ -125,5 +126,9 @@ unsigned int usbi_get_tid(void)
+ 		tid = (int)(intptr_t)pthread_self();
+ 	}
+ 
+-	return tl_tid = (unsigned int)tid;
++	return
++#ifdef HAVE_CC_THREAD_LOCAL
++		tl_tid =
++#endif
++			(unsigned int)tid;
+ }
+-- 
+2.25.1
+
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 98a4a578b2..4e8a524960 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -14,6 +14,9 @@ LIBUSB_CPE_ID_VENDOR = libusb
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
 
+# 0001-threads_posix-only-use-TLS-when-available.patch
+LIBUSB_AUTORECONF = YES
+
 # Avoid the discovery of udev for the host variant
 HOST_LIBUSB_CONF_OPTS = --disable-udev
 HOST_LIBUSB_DEPENDENCIES = host-pkgconf
-- 
2.25.1


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment; filename="libusb-build.log"
Content-Transfer-Encoding: quoted-printable

make libusb-build V=3D1
umask 0022 && make -C /home/user/dev/work/project/tmp/buildroot/buildroot O=
=3D/home/user/dev/work/project/tmp/buildroot/O/. libusb-build
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/tar=
get
for p in https+https://github.com/libusb/libusb/releases/download/v1.0.26/l=
ibusb-1.0.26.tar.bz2 ; do \
        if test ! -e /home/user/cache/src/libusb/`basename $p` ; then \
                echo ">>> libusb 1.0.26 Downloading" ; \
                break ; \
        fi ; \
done
mkdir -p /home/user/cache/src/libusb
PATH=3D"/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host=
/bin:/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/sb=
in:/home/user/bin:/opt/mutt-sidebar/bin:/opt/containerd/bin:/usr/local/sbin=
:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/=
snap/bin" BR2_DL_DIR=3D/home/user/cache/src BUILD_DIR=3D/home/user/dev/work=
/project/tmp/buildroot/O/build CONFIG_DIR=3D/home/user/dev/work/project/tmp=
/buildroot/O O=3D/home/user/dev/work/project/tmp/buildroot/O  flock /home/u=
ser/cache/src/libusb/.lock support/download/dl-wrapper -c '1.0.26' -d '/hom=
e/user/cache/src/libusb' -D '/home/user/cache/src' -f 'libusb-1.0.26.tar.bz=
2' -H 'package/libusb//libusb.hash' -n 'libusb-1.0.26' -N 'libusb' -o '/hom=
e/user/cache/src/libusb/libusb-1.0.26.tar.bz2'   -u https+https://github.co=
m/libusb/libusb/releases/download/v1.0.26 -u http\|urlencode+http://sources=
=2Ebuildroot.net/libusb -u http\|urlencode+http://sources.buildroot.net   --
libusb-1.0.26.tar.bz2: OK (sha256: 12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba0=
95c259e6067a46500381b5a5)
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26
touch /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26/.stam=
p_downloaded
>>> libusb 1.0.26 Extracting
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/tar=
get
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26
bzcat /home/user/cache/src/libusb/libusb-1.0.26.tar.bz2 | tar --strip-compo=
nents=3D1 -C /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.2=
6   -xf -
chmod -R +rw /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26
touch /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26/.stam=
p_extracted
>>> libusb 1.0.26 Patching
( \
for D in package/libusb/ ; do \
  if test -d ${D}; then \
    if test -d ${D}/1.0.26; then \
      PATH=3D/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb=
/host/bin:$PATH support/scripts/apply-patches.sh  /home/user/dev/work/proje=
ct/tmp/buildroot/O/build/libusb-1.0.26 ${D}/1.0.26 \*.patch \*.patch.or1k |=
| exit 1; \
    else \
      PATH=3D/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb=
/host/bin:$PATH support/scripts/apply-patches.sh  /home/user/dev/work/proje=
ct/tmp/buildroot/O/build/libusb-1.0.26 ${D} \*.patch \*.patch.or1k || exit =
1; \
    fi; \
  fi; \
done; \
)
>>> libusb 1.0.26 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/user/dev/work=
/project/tmp/buildroot/O/build/libusb-1.0.26 -name $file); do cp support/gn=
uconfig/$file $i; done; done
>>> libusb 1.0.26 Patching libtool
for i in `find /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0=
=2E26 -name ltmain.sh`; do ltmain_version=3D`sed -n '/^[ \t]*VERSION=3D/{s/=
^[ \t]*VERSION=3D//;p;q;}' $i | sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\=
"//'`; ltmain_patchlevel=3D`sed -n '/^[ \t]*VERSION=3D/{s/^[ \t]*VERSION=3D=
//;p;q;}' $i | sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'=
`; if test ${ltmain_version} =3D '1.5'; then patch -i support/libtool/build=
root-libtool-v1.5.patch ${i}; elif test ${ltmain_version} =3D "2.2"; then p=
atch -i support/libtool/buildroot-libtool-v2.2.patch ${i}; elif test ${ltma=
in_version} =3D "2.4"; then if test ${ltmain_patchlevel:-0} -gt 2; then pat=
ch -i support/libtool/buildroot-libtool-v2.4.4.patch ${i}; else patch -i su=
pport/libtool/buildroot-libtool-v2.4.patch ${i}; fi fi done
patching file /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.=
26/ltmain.sh
Hunk #1 succeeded at 2786 (offset 99 lines).
Hunk #2 succeeded at 4376 (offset 99 lines).
Hunk #3 succeeded at 6671 (offset 117 lines).
Hunk #4 succeeded at 6681 (offset 117 lines).
Hunk #5 succeeded at 6974 (offset 117 lines).
Hunk #6 succeeded at 7266 (offset 117 lines).
Hunk #7 succeeded at 8241 (offset 129 lines).
Hunk #8 succeeded at 10873 (offset 163 lines).
touch /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26/.stam=
p_patched
>>> libusb 1.0.26 Configuring
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/hos=
t /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/target /ho=
me/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/or1k-build=
root-linux-uclibc/sysroot /home/user/dev/work/project/tmp/buildroot/O/images
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/host-pkgconf/host/ /home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/host-pkgconf/host/ /home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/libusb/host
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/host-skeleton/host/ /home/user/dev/work/project/tmp/buildroot/O/per-pac=
kage/host-skeleton/host/ /home/user/dev/work/project/tmp/buildroot/O/per-pa=
ckage/libusb/host
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/skeleton/host/ /home/user/dev/work/project/tmp/buildroot/O/per-package/=
skeleton/host/ /home/user/dev/work/project/tmp/buildroot/O/per-package/libu=
sb/host
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/toolchain/host/ /home/user/dev/work/project/tmp/buildroot/O/per-package=
/toolchain/host/ /home/user/dev/work/project/tmp/buildroot/O/per-package/li=
busb/host
mkdir -p /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/tar=
get
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/host-pkgconf/target/ /home/user/dev/work/project/tmp/buildroot/O/per-pa=
ckage/host-pkgconf/target/ /home/user/dev/work/project/tmp/buildroot/O/per-=
package/libusb/target
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/host-skeleton/target/ /home/user/dev/work/project/tmp/buildroot/O/per-p=
ackage/host-skeleton/target/ /home/user/dev/work/project/tmp/buildroot/O/pe=
r-package/libusb/target
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/skeleton/target/ /home/user/dev/work/project/tmp/buildroot/O/per-packag=
e/skeleton/target/ /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/target
rsync -a --link-dest=3D/home/user/dev/work/project/tmp/buildroot/O/per-pack=
age/toolchain/target/ /home/user/dev/work/project/tmp/buildroot/O/per-packa=
ge/toolchain/target/ /home/user/dev/work/project/tmp/buildroot/O/per-packag=
e/libusb/target
grep --binary-files=3Dwithout-match -lrZ '/home/user/dev/work/project/tmp/b=
uildroot/O/per-package/[^/]\+/' /home/user/dev/work/project/tmp/buildroot/O=
/per-package/libusb/host |while read -d '' f; do file -b --mime-type "${f}"=
 | grep -q '^text/' || continue; printf '%s\0' "${f}"; done |xargs -0 --no-=
run-if-empty /usr/bin/sed -i -e 's:/home/user/dev/work/project/tmp/buildroo=
t/O/per-package/[^/]\+/:/home/user/dev/work/project/tmp/buildroot/O/per-pac=
kage/libusb/:g'
find /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host \(=
    -path '/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/h=
ost/lib/python*' -o -path '/home/user/dev/work/project/tmp/buildroot/O/per-=
package/libusb/host/or1k-buildroot-linux-uclibc/sysroot/usr/lib/python*' \)=
 \( -name "_sysconfigdata*.pyc" -delete \)
(cd /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26/ && rm =
-rf config.cache && PATH=3D"/home/user/dev/work/project/tmp/buildroot/O/per=
-package/libusb/host/bin:/home/user/dev/work/project/tmp/buildroot/O/per-pa=
ckage/libusb/host/sbin:/home/user/bin:/opt/mutt-sidebar/bin:/opt/containerd=
/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/game=
s:/usr/local/games:/snap/bin" AR=3D"/home/user/dev/work/project/tmp/buildro=
ot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc-ar" AS=3D"=
/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/or1=
k-buildroot-linux-uclibc-as" LD=3D"/home/user/dev/work/project/tmp/buildroo=
t/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-ld" NM=3D"/home=
/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-bui=
ldroot-linux-uclibc-gcc-nm" CC=3D"/home/user/dev/work/project/tmp/buildroot=
/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc" GCC=3D"/hom=
e/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-bu=
ildroot-linux-uclibc-gcc" CPP=3D"/home/user/dev/work/project/tmp/buildroot/=
O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-cpp" CXX=3D"/home=
/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-bui=
ldroot-linux-uclibc-g++" FC=3D"/home/user/dev/work/project/tmp/buildroot/O/=
per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gfortran" F77=3D"/h=
ome/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-=
buildroot-linux-uclibc-gfortran" RANLIB=3D"/home/user/dev/work/project/tmp/=
buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc-ran=
lib" READELF=3D"/home/user/dev/work/project/tmp/buildroot/O/per-package/lib=
usb/host/bin/or1k-buildroot-linux-uclibc-readelf" STRIP=3D"/bin/true" OBJCO=
PY=3D"/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/b=
in/or1k-buildroot-linux-uclibc-objcopy" OBJDUMP=3D"/home/user/dev/work/proj=
ect/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc=
-objdump" AR_FOR_BUILD=3D"/usr/bin/ar" AS_FOR_BUILD=3D"/usr/bin/as" CC_FOR_=
BUILD=3D"/usr/bin/gcc" GCC_FOR_BUILD=3D"/usr/bin/gcc" CXX_FOR_BUILD=3D"/usr=
/bin/g++" LD_FOR_BUILD=3D"/usr/bin/ld" CPPFLAGS_FOR_BUILD=3D"-I/home/user/d=
ev/work/project/tmp/buildroot/O/per-package/libusb/host/include" CFLAGS_FOR=
_BUILD=3D"-O2 -I/home/user/dev/work/project/tmp/buildroot/O/per-package/lib=
usb/host/include" CXXFLAGS_FOR_BUILD=3D"-O2 -I/home/user/dev/work/project/t=
mp/buildroot/O/per-package/libusb/host/include" LDFLAGS_FOR_BUILD=3D"-L/hom=
e/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/lib -Wl,-rp=
ath,/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/lib=
" FCFLAGS_FOR_BUILD=3D"" DEFAULT_ASSEMBLER=3D"/home/user/dev/work/project/t=
mp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-as" =
DEFAULT_LINKER=3D"/home/user/dev/work/project/tmp/buildroot/O/per-package/l=
ibusb/host/bin/or1k-buildroot-linux-uclibc-ld" CPPFLAGS=3D"-D_LARGEFILE_SOU=
RCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64" CFLAGS=3D"-D_LARGEFILE_=
SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -Og -g0 " CXXFLAGS=
=3D"-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -Og=
 -g0 " LDFLAGS=3D"" FCFLAGS=3D" -Og -g0" FFLAGS=3D" -Og -g0" PKG_CONFIG=3D"=
/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/pkg=
-config" STAGING_DIR=3D"/home/user/dev/work/project/tmp/buildroot/O/per-pac=
kage/libusb/host/or1k-buildroot-linux-uclibc/sysroot" INTLTOOL_PERL=3D/usr/=
bin/perl CXX=3Dno ac_cv_lbl_unaligned_fail=3Dyes ac_cv_func_mmap_fixed_mapp=
ed=3Dyes ac_cv_func_memcmp_working=3Dyes ac_cv_have_decl_malloc=3Dyes gl_cv=
_func_malloc_0_nonnull=3Dyes ac_cv_func_malloc_0_nonnull=3Dyes ac_cv_func_c=
alloc_0_nonnull=3Dyes ac_cv_func_realloc_0_nonnull=3Dyes lt_cv_sys_lib_sear=
ch_path_spec=3D"" ac_cv_c_bigendian=3Dyes   CONFIG_SITE=3D/dev/null ./confi=
gure --target=3Dor1k-buildroot-linux-uclibc --host=3Dor1k-buildroot-linux-u=
clibc --build=3Dx86_64-pc-linux-gnu --prefix=3D/usr --exec-prefix=3D/usr --=
sysconfdir=3D/etc --localstatedir=3D/var --program-prefix=3D"" --disable-gt=
k-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-documen=
tation --with-xmlto=3Dno --with-fop=3Dno --disable-dependency-tracking --en=
able-ipv6 --disable-nls --disable-static --enable-shared  --disable-udev )
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-=
doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xm=
lto, --with-fop, --enable-ipv6, --disable-nls
checking for or1k-buildroot-linux-uclibc-gcc... /home/user/dev/work/project=
/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /home/user/dev/work/project/tmp/buildroot/O/per-package/li=
busb/host/bin/or1k-buildroot-linux-uclibc-gcc accepts -g... yes
checking for /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb=
/host/bin/or1k-buildroot-linux-uclibc-gcc option to accept ISO C89... none =
needed
checking whether /home/user/dev/work/project/tmp/buildroot/O/per-package/li=
busb/host/bin/or1k-buildroot-linux-uclibc-gcc understands -c and -o togethe=
r... yes
checking whether we are using the GNU C++ compiler... no
checking whether no accepts -g... no
checking for inline... inline
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for or1k-buildroot-linux-uclibc-strip... /bin/true
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports the include directive... yes (GNU style)
checking whether make supports nested variables... yes
checking dependency style of /home/user/dev/work/project/tmp/buildroot/O/pe=
r-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc... none
checking dependency style of no... none
checking build system type... x86_64-pc-linux-gnu
checking host system type... or1k-buildroot-linux-uclibc
checking how to print strings... printf
checking for a sed that does not truncate output... /usr/bin/sed
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for fgrep... /usr/bin/grep -F
checking for ld used by /home/user/dev/work/project/tmp/buildroot/O/per-pac=
kage/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc... /home/user/dev/work=
/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-u=
clibc-ld
checking if the linker (/home/user/dev/work/project/tmp/buildroot/O/per-pac=
kage/libusb/host/bin/or1k-buildroot-linux-uclibc-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /home/user/dev/work/=
project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uc=
libc-gcc-nm
checking the name lister (/home/user/dev/work/project/tmp/buildroot/O/per-p=
ackage/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc-nm) interface... BSD=
 nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to or1k-buildroot-li=
nux-uclibc format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format.=
=2E. func_convert_file_noop
checking for /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb=
/host/bin/or1k-buildroot-linux-uclibc-ld option to reload object files... -r
checking for or1k-buildroot-linux-uclibc-objdump... /home/user/dev/work/pro=
ject/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclib=
c-objdump
checking how to recognize dependent libraries... pass_all
checking for or1k-buildroot-linux-uclibc-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for or1k-buildroot-linux-uclibc-ar... /home/user/dev/work/project/=
tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc=
-ar
checking for archiver @FILE support... @
checking for or1k-buildroot-linux-uclibc-strip... (cached) /bin/true
checking for or1k-buildroot-linux-uclibc-ranlib... /home/user/dev/work/proj=
ect/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc=
-gcc-ranlib
checking command to parse /home/user/dev/work/project/tmp/buildroot/O/per-p=
ackage/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc-nm output from /home=
/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-bui=
ldroot-linux-uclibc-gcc object... ok
checking for sysroot... no
checking for a working dd... /usr/bin/dd
checking how to truncate binary pipes... /usr/bin/dd bs=3D4096 count=3D1
checking for or1k-buildroot-linux-uclibc-mt... no
checking for mt... mt
configure: WARNING: using cross tools not prefixed with host triplet
checking if mt is a manifest tool... no
checking how to run the C preprocessor... /home/user/dev/work/project/tmp/b=
uildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-cpp
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc supports -fno-rtti -fno-exceptions=
=2E.. no
checking for /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb=
/host/bin/or1k-buildroot-linux-uclibc-gcc option to produce PIC... -fPIC -D=
PIC
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc PIC flag -fPIC -DPIC works... yes
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc static flag -static works... yes
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc supports -c -o file.o... yes
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc supports -c -o file.o... (cached) =
yes
checking whether the /home/user/dev/work/project/tmp/buildroot/O/per-packag=
e/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc linker (/home/user/dev/wo=
rk/project/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux=
-uclibc-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... no
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for or1k-buildroot-linux-uclibc-windres... no
checking for windres... no
checking whether make supports nested variables... (cached) yes
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc supports -std=3Dgnu11... yes
checking operating system... Linux
checking for nfds_t... yes
checking for pipe2... yes
checking if /home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/=
host/bin/or1k-buildroot-linux-uclibc-gcc recognizes -pthread... yes
checking for library containing pthread_create... none required
checking for library containing __atomic_fetch_add_4... -latomic
checking for library containing clock_gettime... none required
checking for pthread_setname_np... no
checking asm/types.h usability... yes
checking asm/types.h presence... yes
checking for asm/types.h... yes
checking linux/netlink.h usability... yes
checking linux/netlink.h presence... yes
checking for linux/netlink.h... yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking for clock_gettime... yes
checking whether CLOCK_MONOTONIC is declared... yes
checking for pthread_condattr_setclock... yes
checking sys/eventfd.h usability... yes
checking sys/eventfd.h presence... yes
checking for sys/eventfd.h... yes
checking whether EFD_NONBLOCK is declared... yes
checking whether EFD_CLOEXEC is declared... yes
checking for eventfd... yes
checking whether to use eventfd for signalling... yes
checking sys/timerfd.h usability... yes
checking sys/timerfd.h presence... yes
checking for sys/timerfd.h... yes
checking whether TFD_NONBLOCK is declared... yes
checking whether TFD_CLOEXEC is declared... yes
checking for timerfd_create... yes
checking whether to use timerfd for timing... yes
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating libusb-1.0.pc
config.status: creating Makefile
config.status: creating libusb/Makefile
config.status: creating examples/Makefile
config.status: creating tests/Makefile
config.status: creating doc/Makefile
config.status: creating doc/doxygen.cfg
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-=
doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xm=
lto, --with-fop, --enable-ipv6, --disable-nls
touch /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26/.stam=
p_configured
>>> libusb 1.0.26 Building
PATH=3D"/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host=
/bin:/home/user/dev/work/project/tmp/buildroot/O/per-package/libusb/host/sb=
in:/home/user/bin:/opt/mutt-sidebar/bin:/opt/containerd/bin:/usr/local/sbin=
:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/=
snap/bin"  /usr/bin/make -j9  -C /home/user/dev/work/project/tmp/buildroot/=
O/build/libusb-1.0.26/
/usr/bin/make  all-recursive
Making all in libusb
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o core.lo core.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o descriptor.lo descriptor.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o hotplug.lo hotplug.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o io.lo io.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o strerror.lo strerror.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o sync.lo sync.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o os/events_posix.lo os/events_posix.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o os/threads_posix.lo os/threads_posix.c
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o os/linux_usbfs.lo os/linux_usbfs.c
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c sync.c  =
-fPIC -DPIC -o .libs/sync.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c core.c  =
-fPIC -DPIC -o .libs/core.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c strerror=
=2Ec  -fPIC -DPIC -o .libs/strerror.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c descript=
or.c  -fPIC -DPIC -o .libs/descriptor.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c io.c  -f=
PIC -DPIC -o .libs/io.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c hotplug.=
c  -fPIC -DPIC -o .libs/hotplug.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c os/linux=
_usbfs.c  -fPIC -DPIC -o os/.libs/linux_usbfs.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c os/threa=
ds_posix.c  -fPIC -DPIC -o os/.libs/threads_posix.o
/bin/sh ../libtool  --tag=3DCC   --mode=3Dcompile /home/user/dev/work/proje=
ct/tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-=
gcc -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrit=
e-strings -Werror=3Dformat-security -Werror=3Dimplicit-function-declaration=
 -Werror=3Dimplicit-int -Werror=3Dinit-self -Werror=3Dmissing-prototypes -W=
error=3Dstrict-prototypes -Werror=3Dundef -Werror=3Duninitialized -fvisibil=
ity=3Dhidden -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFF=
SET_BITS=3D64  -Og -g0  -c -o os/linux_netlink.lo os/linux_netlink.c
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c os/event=
s_posix.c  -fPIC -DPIC -o os/.libs/events_posix.o
libtool: compile:  /home/user/dev/work/project/tmp/buildroot/O/per-package/=
libusb/host/bin/or1k-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I.. -D=
_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -std=3Dgnu=
11 -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dformat-securit=
y -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
init-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototypes -Werror=
=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread -D_LARGEFIL=
E_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og -g0 -c os/linux=
_netlink.c  -fPIC -DPIC -o os/.libs/linux_netlink.o
/bin/sh ../libtool  --tag=3DCC   --mode=3Dlink /home/user/dev/work/project/=
tmp/buildroot/O/per-package/libusb/host/bin/or1k-buildroot-linux-uclibc-gcc=
 -std=3Dgnu11  -Wall -Wextra -Wshadow -Wunused -Wwrite-strings -Werror=3Dfo=
rmat-security -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-in=
t -Werror=3Dinit-self -Werror=3Dmissing-prototypes -Werror=3Dstrict-prototy=
pes -Werror=3Dundef -Werror=3Duninitialized -fvisibility=3Dhidden -pthread =
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -Og -g0=
  -version-info 3:0:3 -no-undefined   -o libusb-1.0.la -rpath /usr/lib core=
=2Elo descriptor.lo hotplug.lo io.lo strerror.lo sync.lo os/events_posix.lo=
 os/threads_posix.lo os/linux_usbfs.lo  os/linux_netlink.lo  -latomic
libtool: link: /home/user/dev/work/project/tmp/buildroot/O/per-package/libu=
sb/host/bin/or1k-buildroot-linux-uclibc-gcc -shared  -fPIC -DPIC  .libs/cor=
e.o .libs/descriptor.o .libs/hotplug.o .libs/io.o .libs/strerror.o .libs/sy=
nc.o os/.libs/events_posix.o os/.libs/threads_posix.o os/.libs/linux_usbfs.=
o os/.libs/linux_netlink.o   -latomic  -pthread -Og -g0   -pthread -Wl,-son=
ame -Wl,libusb-1.0.so.0 -o .libs/libusb-1.0.so.0.3.0
libtool: link: (cd ".libs" && rm -f "libusb-1.0.so.0" && ln -s "libusb-1.0.=
so.0.3.0" "libusb-1.0.so.0")
libtool: link: (cd ".libs" && rm -f "libusb-1.0.so" && ln -s "libusb-1.0.so=
=2E0.3.0" "libusb-1.0.so")
libtool: link: ( cd ".libs" && rm -f "libusb-1.0.la" && ln -s "../libusb-1.=
0.la" "libusb-1.0.la" )
touch /home/user/dev/work/project/tmp/buildroot/O/build/libusb-1.0.26/.stam=
p_built

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--ZfOjI3PrQbgiZnxM--


