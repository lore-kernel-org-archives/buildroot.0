From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 1 Nov 2011 12:54:43 +0100
Subject: [Buildroot] [PATCH] toolchain/ct-ng: update to 1.13.0
In-Reply-To: <20111101114412.GA26415@sapphire.tkos.co.il>
References: <1320145111-5171-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <20111101114412.GA26415@sapphire.tkos.co.il>
Message-ID: <201111011254.43863.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Tuesday 01 November 2011 12:44:12 Baruch Siach wrote:
> Hi Yann,
> 
> On Tue, Nov 01, 2011 at 11:58:31AM +0100, Yann E. MORIN wrote:
> > Update the version in the package description. Update the default
> > configuration files for the three different C libraries.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
> > ---
> 
> [snip]
> 
> > @@ -25,10 +22,10 @@ CT_MODULES=y
> >  #
> >  # Paths
> >  #
> > -CT_LOCAL_TARBALLS_DIR=""
> > +CT_LOCAL_TARBALLS_DIR="/home/ymorin/dev/buildroot/br.wip/dl"
> 
> Is this intentional?

Yes and no. It will be overriden during the build:
  http://git.buildroot.org/buildroot/tree/toolchain/toolchain-crosstool-ng/crosstool-ng.mk#n262

> >  CT_SAVE_TARBALLS=y
> >  CT_WORK_DIR="${CT_TOP_DIR}/.build"
> > -CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
> > +CT_PREFIX_DIR="/home/ymorin/dev/buildroot/O/host/usr"
> 
> And this.

Ditto:
  http://git.buildroot.org/buildroot/tree/toolchain/toolchain-crosstool-ng/crosstool-ng.mk#n261

> [snip]
> 
> > @@ -128,8 +139,8 @@ CT_FORCE_SYSROOT=y
> >  CT_USE_SYSROOT=y
> >  CT_SYSROOT_NAME="sysroot"
> >  CT_SYSROOT_DIR_PREFIX=""
> > -CT_STATIC_TOOLCHAIN_POSSIBLE=y
> > -CT_TOOLCHAIN_PKGVERSION=""
> > +CT_WANTS_STATIC_LINK=y
> > +CT_TOOLCHAIN_PKGVERSION="buildroot 2011.11-git-00322-g9b25853-dirty"
> 
> Ditto.

Ditto:
  http://git.buildroot.org/buildroot/tree/toolchain/toolchain-crosstool-ng/crosstool-ng.mk#n206

> >  CT_TOOLCHAIN_BUGURL=""
> >  
> >  #
> > @@ -137,7 +148,7 @@ CT_TOOLCHAIN_BUGURL=""
> >  #
> >  CT_TARGET_VENDOR="unknown"
> >  CT_TARGET_ALIAS_SED_EXPR=""
> > -CT_TARGET_ALIAS=""
> > +CT_TARGET_ALIAS="armeb-linux"
> 
> Ditto.

Ditto:
  http://git.buildroot.org/buildroot/tree/toolchain/toolchain-crosstool-ng/crosstool-ng.mk#n205

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
