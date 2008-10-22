From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Wed, 22 Oct 2008 14:48:31 +0200
Subject: [Buildroot] [RFC] Avoid make distclean to remove packages
	fromrootfs
In-Reply-To: <COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
	<COL0-DAV311F354B4DDD6CF6B394418D290@phx.gbl>
Message-ID: <e4c675870810220548h3f85c114n875697070af502f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/22 John Schimandle <john_schimandle@hotmail.com>:
> I perform the following steps to rebuild the rootfs. It's fast and easy.
>
> rm project_build_ARCH/PROJECT/.root
> rm -rf project_build_ARCH/PROJECT/root
>
> Once these steps are done then the next make will copy in a clean skeleton
> template and all the other Makefiles will notice the install targets are
> missing and they will install all the targets. This is the cleanest and
> fastest method I have found because this only copies files.
>
> Maybe this should be added to the top level Makefile.
>

I have just tried this way but it installs only skeleton, dbus,
mcookie, busybox, kernel modules, kernel (in case), uClibc, some
libraries (expat, drm, dbus, png, z), rxvt:

roberto at rafbook:~/gles/buildroot$ du -ks project_build_i586/ugles/root
44680	project_build_i586/ugles/root

roberto at rafbook:~/gles/buildroot$ mv -f project_build_i586/ugles/root
project_build_i586/ugles/root.002
roberto at rafbook:~/gles/buildroot$ rm -f project_build_i586/ugles/.root
roberto at rafbook:~/gles/buildroot$ make
[...]
roberto at rafbook:~/gles/buildroot$ du -ks project_build_i586/ugles/root
6676	project_build_i586/ugles/root

However it does not resolve the problem to remove ONLY a package from
customized rootfs or reset some kernel config parameters back (i.e.:
bug report 5564).

 Cheers,
-- 
/roberto
