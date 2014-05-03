From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 May 2014 22:08:38 +0200
Subject: [Buildroot] [PATCH 11/12] boot/syslinux: add option to install
	c32 modules
In-Reply-To: <87k3a2mxw3.fsf@dell.be.48ers.dk>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <f66cc7a87e5bcdc8a958dc40444541c4063cd5ab.1399050467.git.yann.morin.1998@free.fr>
 <87k3a2mxw3.fsf@dell.be.48ers.dk>
Message-ID: <20140503200838.GG10671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-05-03 22:05 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Romain Naour <romain.naour@openwide.fr>
>  > ---
>  >  boot/syslinux/Config.in   | 10 ++++++++++
>  >  boot/syslinux/syslinux.mk |  9 +++++++++
>  >  2 files changed, 19 insertions(+)
> 
>  > diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
>  > index 28c5329..f4b9870 100644
>  > --- a/boot/syslinux/Config.in
>  > +++ b/boot/syslinux/Config.in
>  > @@ -46,4 +46,14 @@ config BR2_TARGET_SYSLINUX_EFI
>  
>  >  endchoice
>  
>  > +if BR2_TARGET_SYSLINUX_LEGACY_BIOS
>  > +
>  > +config BR2_TARGET_SYSLINUX_C32
>  > +	string "modules to install"
>  > +	help
>  > +	  Enter a space-separated list of .c32 modules to install.
>  > +	  Leave empty to install no module.
> 
> Out of interest, what are those c32 modules? Some kind of loadable
> libraries?

Yes, a kind of plugin. One provides a graphical (vesa) menu, another
provides a simple shell, and so on...

>  > +# We install the c32 modules from the host-installed tree, they are all
>  > +# neatly installed in the same location, while they are scaterred around
> 
> s/scaterred/scattered/
> 
> Reworded slightly and committed, thanks.

Doh, I really need to do something about my keyboard dislexia... ;-)
Thanks for fixing. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
