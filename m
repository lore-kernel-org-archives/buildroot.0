Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38070C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 04:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E3D260F3B;
	Fri, 10 Mar 2023 04:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E3D260F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIgU7l1chpzS; Fri, 10 Mar 2023 04:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D724560F4B;
	Fri, 10 Mar 2023 04:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D724560F4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E25CD1BF575
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 04:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C933040895
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 04:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C933040895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPyYpsjC0Hem for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 04:03:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C57E3415E7
 for <buildroot@uclibc.org>; Fri, 10 Mar 2023 04:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C57E3415E7
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B0F7786A4E; Fri, 10 Mar 2023 04:03:25 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 10 Mar 2023 04:03:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: jbittner.br.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15366-163-68o78V2Wwx@https.bugs.busybox.net/>
In-Reply-To: <bug-15366-163@https.bugs.busybox.net/>
References: <bug-15366-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15366] xscreensaver needs util-linux dependency
 for per-package build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15366

--- Comment #5 from Jonathan Bittner <jbittner.br.bugs@gmail.com> ---
Interesting...

I have:

atk cairo eudev expat fontconfig freetype gdk-pixbuf gdk-pixbuf-xlib glibc
harfbuzz host-autoconf host-autoconf-archive host-automake host-binutils
host-bison host-ccache host-expat host-flex host-gawk host-gcc-final
host-gcc-initial host-gdk-pixbuf host-gettext host-gettext-tiny host-gmp
host-gperf host-intltool host-libffi host-libglib2 host-libgtk2 host-libjpeg
host-libpng host-libtool host-libxml-parser-perl host-libxml2 host-libxslt
host-libzlib host-m4 host-meson host-mpc host-mpfr host-nasm host-ninja
host-pcre host-pkgconf host-python-mako host-python-markupsafe
host-python-setuptools host-python3 host-skeleton host-util-linux
host-xcb-proto host-xorgproto host-zlib jpeg jpeg-turbo kmod libdrm libffi
libfribidi libgl libglib2 libglu libgtk2 libpng libpthread-stubs libxcb libxml2
libzlib linux-headers mesa3d pango pcre pixman skeleton skeleton-init-common
skeleton-init-sysv toolchain toolchain-buildroot udev util-linux-libs xcb-proto
xlib_libICE xlib_libSM xlib_libX11 xlib_libXau xlib_libXcursor xlib_libXdamage
xlib_libXdmcp xlib_libXext xlib_libXfixes xlib_libXft xlib_libXi
xlib_libXinerama xlib_libXrandr xlib_libXrender xlib_libXt xlib_libXxf86vm
xlib_xtrans xorgproto xutil_util-macros zlib


 so I have host-util-linux and util-linux-libs but not enough to satisfy the
dependency.  Also interesting, per xconfig, package fontconfig selects
BR2_PACKAGE_UTIL_LINUX but not the dependency.

Here's another fun one. I mentioned that systemd would trigger the dependency. 
Switching from eudev (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV) to static
device table (BR2_ROOTFS_DEVICE_CREATION_STATIC) also triggers the dependency.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
