From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2014 20:08:17 +0100
Subject: [Buildroot] [PATCH v2 3/5] gummiboot: new package
In-Reply-To: <20140219195906.77cc84a7@skate>
References: <1392766441-2160-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392766441-2160-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140219175929.GB3400@free.fr> <20140219195906.77cc84a7@skate>
Message-ID: <20140219190817.GD3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-19 19:59 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 19 Feb 2014 18:59:29 +0100, Yann E. MORIN wrote:
> 
> > > +# The git archive does not have the autoconf/automake stuff generated.
> > > +GUMMIBOOT_AUTORECONF = YES
> > > +GUMMIBOOT_DEPENDENCIES = gnu-efi host-pkgconf util-linux
> > 
> > Ah, gnu-efi is used here. That's why we need to install it in staging/
> > and target/, right?
> 
> To staging: no.
> 
> > Still, since this is a boot-related stuff, do we really need to have
> > gnu-efi installed in target/ ?
> 
> Correct, I believe installation to target is useless, as I've
> mentioned in my reply to your comments on the gnu-efi package.

OK, it now makes sense. :-)

> > > +GUMMIBOOT_INSTALL_TARGET = NO
> > > +GUMMIBOOT_INSTALL_IMAGES = YES
> > > +
> > > +ifeq ($(BR2_i386),y)
> > > +GUMMIBOOT_IMGARCH = ia32
> > > +else ifeq ($(BR2_x86_64),y)
> > > +GUMMIBOOT_IMGARCH = x64
> > > +endif
> > 
> > Ditto: what about 32-bit EFI-BIOS on a 64-bit machine?
> 
> From my testing, it doesn't work. And I'd say that if someone wants to
> work on this, it could be seen as a possible extension of the proposed
> patches, to be implemented and submitted later.

Maybe add a little note in the help text stating this is not suported,
then?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
