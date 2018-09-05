From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 21:14:05 +0200
Subject: [Buildroot] [PATCH 1/1] screen: fix rare build failure on T_N
 undeclared
In-Reply-To: <20180905172644.1871-1-fontaine.fabrice@gmail.com>
References: <20180905172644.1871-1-fontaine.fabrice@gmail.com>
Message-ID: <20180905211405.0db9e5ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Sep 2018 19:26:44 +0200, Fabrice Fontaine wrote:
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/arm-none-linux-gnueabi-gcc -c -I. -I.  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DETCSCREENRC='"/usr/etc/screenrc"' -DSCREENENCODINGS='"/usr/share/screen/utf8encodings"' -DHAVE_CONFIG_H -DGIT_REV=\"\" \
>      -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_GNU_SOURCE list_display.c
> In file included from screen.h:150:0,
>                  from list_display.c:36:
> display.h:154:19: error: 'T_N' undeclared here (not in a function)
>    union tcu d_tcs[T_N];  /* terminal capabilities */
> 
> Macro T_N is defined in header file term.h but it may not be created
> then fails. Backport patch to make sure term.h is created before compile
> other source codes.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a62bea1fd32246526d59f029df3dca60f1cd710f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0010-comm-h-now-depends-on-term-h.patch   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/screen/0010-comm-h-now-depends-on-term-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
