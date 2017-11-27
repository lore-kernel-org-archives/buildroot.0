From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:35:01 +0100
Subject: [Buildroot] [PATCH] dbus: bump to version 1.12.2
In-Reply-To: <063c44bda11568a4b3ea2fdcc8341fff30766734.1511640738.git.baruch@tkos.co.il>
References: <063c44bda11568a4b3ea2fdcc8341fff30766734.1511640738.git.baruch@tkos.co.il>
Message-ID: <20171127093501.272c3e8b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 22:12:18 +0200, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> This is a bug fixes release, so it might be good for master.
> 
> https://cgit.freedesktop.org/dbus/dbus/tree/NEWS?h=dbus-1.12

None of the bug fixes seemed to apply to us:


? Make use of $(MKDIR_P) compatible with install-sh, fixing build when a
  GNU-compatible `mkdir -p` is not available (fd.o #103521, ilovezfs)

 => We always have a GNU-compatible mkdir

? When building for Windows with Autotools, avoid `echo -e`, fixing
  cross-compilation on non-GNU platforms like macOS
  (fd.o #103493, Tony Theodore)

 => We don't build for Windows

? Fix crashes in the server side of the nonce-tcp: transport under
  various error conditions. This transport should normally only be used
  on Windows, where AF_UNIX sockets are unavailable; the unix: transport
  is the only one recommended for production use on Unix platforms.
  (fd.o #103597, Simon McVittie)

 => We don't build for Windows, AF_UNIX sockets are available

So I've erred on the safe side and applied to next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
