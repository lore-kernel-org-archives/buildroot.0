From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 14:48:36 +0200
Subject: [Buildroot] Xineramaproto
In-Reply-To: <233A67DA67A045DF84F76ABF9CA04635@tux.local>
References: <233A67DA67A045DF84F76ABF9CA04635@tux.local>
Message-ID: <20131011144836.6a22ca05@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwyll Gwyllin,

On Thu, 10 Oct 2013 14:16:14 +0200, Gwyll Gwyllin wrote:

> i?m trying to cross compile (for MIPS) but i?m stucked at xserver_xorg-xserver-1.5.2

Hum, which version of Buildroot are you using? 1.5.2 was the X.org
server packaged in Buildroot before July 2009 or something like that.
Maybe you should upgrade to benefit from all the testing and
improvements we've done since then. In 2009, we didn't had the
autobuilders that we have today, and since we have that, the amount of
testing Buildroot receives has increased significantly.

> The compiler error says:
> 
> checking for a useful monotonic clock ...... cross compiling
> checking for strcasecmp... yes
> checking for strncasecmp... yes
> checking for strcasestr... (cached) yes
> checking for XDMCP... yes
> checking for XdmcpWrap in -lXdmcp... yes
> checking for XSERVERCFLAGS... configure: error: Package requirements (randrproto >= 1.2 renderproto fixesproto >= 4.0 damageproto >= 1.1 xcmiscproto xextproto xproto >= 7.0.9 xtrans scrnsaverproto >= 1.1 bigreqsproto resourceproto fontsproto inputproto >= 1.4.4 kbproto >= 1.0.3 videoproto compositeproto >= 0.4 resourceproto xineramaproto evieproto xkbfile xfont xau fontenc pixman-1 >= 0.9.5 dbus-1 xdmcp) were not met:
> 
> No package 'xineramaproto' found
> 
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> 
> Alternatively, you may set the environment variables XSERVERCFLAGS_CFLAGS
> and XSERVERCFLAGS_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> pkg-config ?modversion xineramaproto says 1.1.2

Yes, if you're using the pkg-config from your host machine, it will
tell you that xineramaproto is installed on your host machine. But that
doesn't tell anything about whether it's available for your target.

It seems like there is a missing dependency in the X server
Buildroot .mk file on the xinerama proto package, or a missing
--disable-xinerama in the X server configuration options.

> I tried to set PKG_CONFIG_PATH to /usr/lib/pkg-config, the result was the same.

That's plain wrong. /usr/lib/pkg-config contains the description of
libraries built for your host. Using them for your target is just going
to make the build fail even more.

I would definitely recommend upgrading your Buildroot version. An
open-source community unfortunately cannot afford supporting users that
use such old version: we've fixed gazillions of problems since 2009.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
