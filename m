From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:02:25 +0100
Subject: [Buildroot] [PATCH 8/9] fs/iso9660: add Grub splashscreen
 support
In-Reply-To: <20131229164518.GB3567@free.fr>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131228210920.GL3373@free.fr> <20131229112444.1307a7db@skate>
 <20131229164518.GB3567@free.fr>
Message-ID: <20131229180225.16fdabc9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 29 Dec 2013 17:45:18 +0100, Yann E. MORIN wrote:

> > That's because the documentation is not up-to-date with the Debian
> > patches additions. Those options are really handled, they really have an
> > effect (I tested it). I learned about them while reading:
> > 
> >   http://www.katspace.org/computers/Grub_Splash/
> 
> Hey! Nice ressource! :-)
> 
> Maybe we could add a reference to it somewhere in our docs?

True, I'll add it in the help text of the Splash image support.


> > +static struct builtin builtin_foreground =
> > +{
> > +  "foreground",
> > +  foreground_func,
> > +  BUILTIN_CMDLINE | BUILTIN_MENU | BUILTIN_HELP_LIST,
> > +  "foreground RRGGBB",
> > +  "Sets the foreground color when in graphics mode."
> > +  "RR is red, GG is green, and BB blue. Numbers must be in hexadecimal."
> > +};
> 
> But then, to be clean, maybe we'd want to also get rid of 'foreground'
> and 'background' when there's no splashscreen. From the link you quoted:
> 
>     The "foreground" and "background" commands seem to only take effect
>     when a splash image is used; otherwise grub uses the "color" command.
> 
> Granted, this does not seem to be strictly required, but I think it'be
> better to just remove it, to avoid the user being puzzled that his
> changing foregroud/background has no effect...
> 
> Or at least a comment that basically says:
>     # {fore,back}ground have no effect without a splashscreen:
>     foreground 000000
>     background cccccc

Well, since they have not effect when the splashimage is disabled, I
wanted to avoid adding more code in iso9660.mk/grub.mk. But indeed,
adding a comment might be useful.

I'll respin the series with your comments taken into account, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
