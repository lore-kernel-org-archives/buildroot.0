From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Apr 2014 19:36:51 +0200
Subject: [Buildroot] [PATCH 4/9] boot/syslinux: rewrite options prompts
In-Reply-To: <535DEDB4.4030601@mind.be>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <8977ed467510f41bf80553eb104ed93e52aac1c8.1398378217.git.yann.morin.1998@free.fr>
 <535DEDB4.4030601@mind.be>
Message-ID: <20140428173651.GC3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-28 07:57 +0200, Arnout Vandecappelle spake thusly:
> On 25/04/14 00:29, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Rewrite the options prompt in preparation to adding a new
> > type of image to install.
> > 
> > Add help entries to each option, too.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >  boot/syslinux/Config.in | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> > index 1b8c527..b92f28f 100644
> > --- a/boot/syslinux/Config.in
> > +++ b/boot/syslinux/Config.in
> > @@ -12,10 +12,16 @@ config BR2_TARGET_SYSLINUX
> >  if BR2_TARGET_SYSLINUX
> >  
> >  config BR2_TARGET_SYSLINUX_ISOLINUX
> > -	bool "Install isolinux"
> > +	bool "isolinux"
> >  	default y
> > +	help
> > +	  Install the legacy BIOS 'isolinux' image, to boot off
> 
>  This sounds like it's a legacy image... I'd just skip the word "legacy".
> BIOS is BIOS.

Hmmm. OK.

Side-channel rant: I always wonder how I should call the EFI 'firmware':
  - EFI BIOS
  - EFI firmware
  - BIOS
  - firmware
  - EFI  (but that more a spec than an implementation)

So, I usually refer to what we called BIOS in the early days as the
"lecagy BIOS", which is also what you'd find in most EFI BIOSes when
you enable "legacy BIOS" (often as a simple and efficient way to
by-pass the secure-boot.)

> > +	  optical medias (CDROM, DVD.)
> 
>  The plural of medium is media, without s.

Yep, it always bites me... Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
