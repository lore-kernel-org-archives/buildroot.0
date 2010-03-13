From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sat, 13 Mar 2010 21:33:09 +0200
Subject: [Buildroot] Pull request for branch x11r75patches
In-Reply-To: <4B96D09D.4070100@carallon.com>
References: <4B96D09D.4070100@carallon.com>
Message-ID: <4B9BE875.9040500@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/2010 12:50 AM, Will Wagner wrote:
> I have setup a repository with my x11r7.5 changes merged into Paulius's
> changes that have already been commited.

Hi,

I pulled your tree and I am trying to compile and test it.

> Most just bump things to newer version, but also have converted mesa3d
> to autotools and added more option support when building xserver.
>
> Regards
> Will
>
> The following changes since commit
> 32ae5854dd1a1c77c9019932f248eb2dc1f1d565:
> Peter Korsgaard (1):
> busybox: additional 1.16.0 fixes
>
> are available in the git repository at:
>
> git://gitorious.org/willw-buildroot/willw-buildroot.git x11r75patches
>
> Will Wagner (17):
> libdrm: bump version
> pixman: bump version
> correct name of xapp_xinput.mk
> mesa3d: bump version and convert to autotools
> xlib_libXau: remove duplicate dependancies
> pthread-stubs: bump version
> xdriver_xf86-video-intel: bump version
> xproto_dri2proto: bump version
> xproto_fontcacheproto: bump version
> xproto_xf86miscproto: bump version
> xlib_libpciaccess: bump version

libpciaccess fails... due to libtool patch:

 >>>   Patching libtool

Applying buildroot-libtool.patch using plaintext:
patching file ltmain.sh
Hunk #1 FAILED at 273.
Hunk #2 succeeded at 5412 (offset 3005 lines).
Hunk #3 FAILED at 2551.
Hunk #4 FAILED at 2895.
Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
Hunk #6 FAILED at 5937.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make: *** 
[/home/paulius/buildroot/output/build/xlib_libpciaccess-0.11.0/.stamp_patched] 
Error 1

> xlib_libXfontcache: bump version
> xdriver_xf86-video-sunleo: correct version
> xkeyboard-config: bump version
> xproto_evieext: bump version
> xlib_libXxf86misc: bump version
> xserver_xorg-server: bump version, improve option support
