From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 23:33:41 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add hash for 2012.07
In-Reply-To: <20150426222755.437ae3fe@free-electrons.com>
References: <1430078172-8136-1-git-send-email-vincent.stehle@laposte.net>
 <20150426222755.437ae3fe@free-electrons.com>
Message-ID: <20150426213341.GI4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Vincent, All,

On 2015-04-26 22:27 +0200, Thomas Petazzoni spake thusly:
> On Sun, 26 Apr 2015 21:56:12 +0200, Vincent Stehle wrote:
> > From: Vincent Stehl? <vincent.stehle@laposte.net>
> > 
> > To repair the build of pandaboard_defconfig.
> > 
> > Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> > ---
> >  boot/uboot/uboot.hash | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
> > index 9cc96f6..9def045 100644
> > --- a/boot/uboot/uboot.hash
> > +++ b/boot/uboot/uboot.hash
> > @@ -1,2 +1,3 @@
> >  # Locally computed:
> > +sha256	e08e20a6979bfca6eebb9a2b0e42aa4416af3d796332fd63a3470495a089d496  u-boot-2012.07.tar.bz2
> >  sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
> 
> The problem indeed exists, but this is not the right solution. The
> right solution is to use BR_NO_CHECK_HASH_FOR. Yann, can you look at
> all the packages that may use custom versions (U-Boot, Barebox,
> kernel, etc.) and do the necessary BR_NO_CHECK_HASH_FOR handling?

I'll have a look.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
