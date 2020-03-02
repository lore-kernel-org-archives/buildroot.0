From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Mar 2020 14:30:07 +0100
Subject: [Buildroot] [RFC v2 2/2] package/qt5webengine: fix chromium arm
 compile flags
In-Reply-To: <20200302091926.19308-2-ps.report@gmx.net>
References: <20200302091926.19308-1-ps.report@gmx.net>
 <20200302091926.19308-2-ps.report@gmx.net>
Message-ID: <20200302143007.17aa8819@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Mar 2020 10:19:26 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
> chromium compiler flags and uses some hard coded ARMv7 default values
> for the compiler command line: '... -march=armv7-a -mfloat-abi=hard
> -mtune=generic-armv7-a -mfpu=vfpv3-d16 ...'.
> 
> This results e.g. in an illegal instruction failure for rpi zero
> (reported on the mailing list, see [1]).
> 
> Custom values could be set in the file src/3rdparty/chromium/build/config/arm.gni
> (as tested by an proof-of-concept patch [2]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-February/274587.html
> [2] http://lists.busybox.net/pipermail/buildroot/2020-February/274586.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Could we instead ask this thing to not do all this sorcery, and instead
just use the compiler as-is, without passing crazy
architecture-specific compiler flags ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
