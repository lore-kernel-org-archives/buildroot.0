From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Nov 2014 20:10:16 +0200
Subject: [Buildroot] [PATCH] package/shairport-sync: fix static builds
In-Reply-To: <1417268097-29884-1-git-send-email-yann.morin.1998@free.fr>
References: <1417268097-29884-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141129181016.GC2204@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Nov 29, 2014 at 02:34:57PM +0100, Yann E. MORIN wrote:
> Because shairport-sync uses AC_CHECK_LIB to find some of the needed
> libraries (opensl, alsa, popt...), it fails to bring in the dependencies
> of those libraries; for example, -lssl requires -lz.
> 
> When doing a dynamically-linked build, those dependent libraries are
> pulled in thansk to the DT_NEEDED ELF tags, but those are not available
> in static libraries.
> 
> Use PKG_CHECK_MODULES instead of AC_CHECK_LIB, and emulate the results
> of AC_CJECK_LIB (i.e. set the HAVE_LIBxxx and the LIBS variable
> appropriately) to minimise the amount of code touched.
> 
> This should fix:
>     http://autobuild.buildroot.net/results/1a5/1a56dbff3583bed0d693508dfc16859086846ecd/
>     http://autobuild.buildroot.net/results/6d5/6d5a8157592f7a2c9469bf71b0453796ef982ab1/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?rg Krause <jkrause@posteo.de>

SHAIRPORT_SYNC_DEPENDENCIES should now include host-pkgconf, I believe.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
