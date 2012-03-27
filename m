From: PHilip RUshik <prushik@gmail.com>
Date: Tue, 27 Mar 2012 15:23:18 +0900
Subject: [Buildroot] Cannot build modular X.org
In-Reply-To: <CADiAo4+AHpenrWj69th=3m=1axW4wgrT-Rd20min9=PpxMpNAw@mail.gmail.com>
References: <CADiAo4+AHpenrWj69th=3m=1axW4wgrT-Rd20min9=PpxMpNAw@mail.gmail.com>
Message-ID: <CAGmOteM+K_0b0BNxDP2G=DDTrs7+vO5hVfB9DjKvV9uYRt=wzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I ran into that problem too, I managed to work around it. The problem is
that for some reason, the xdriver_xf86-input-* aren't looking in the right
places for the xorg-server. Don't remember if its a pkg-config issue or
something else, but it can be fixed by putting the files somewhere where
configure will see them.

On Tue, Mar 27, 2012 at 11:09 AM, Dimitry Golubovsky
<golubovsky@gmail.com>wrote:

> Hi,
>
> I cannot build modular X.org with buildroot-2012.02. TinyX built fine.
>
> Build fails on the input driver: xdriver_xf86-input-evdev (this is the
> first driver in the driver section selected)
>
> End of output before the error:
>
> ============================================================
> checking whether to build static libraries... yes
> checking for i586-linux-gcc... (cached)
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
>
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> checking whether we are using the GNU C compiler... (cached) yes
> checking whether
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
>
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> accepts -g... (cached) yes
> checking for
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
>
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> option to accept ISO C89... (cached) none needed
> checking dependency style of
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
>
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc...
> (cached) gcc3
> checking for
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/ccache
>
> /40G2/golubovsky/src/buildroot-2012.02/output/host/usr/bin/i586-unknown-linux-uclibc-gcc
> option to accept ISO C99... -std=gnu99
> checking pkg-config is at least version 0.9.0... yes
> checking for XORG... configure: error: Package requirements
> (xorg-server xproto ) were not met:
>
> No package 'xorg-server' found
>
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
>
> Alternatively, you may set the environment variables XORG_CFLAGS
> and XORG_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
>
> make: ***
> [/40G2/golubovsky/src/buildroot-2012.02/output/build/xdriver_xf86-input-evdev-2.3.0/.stamp_configured]
> Error 1
> ============================================================
>
> Thanks.
>
> --
> Dimitry Golubovsky
>
> Anywhere on the Web
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120327/f8e9e245/attachment.html>
