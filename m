From: Samuelsson, Ulf <ulf.samuelsson@atmel.com>
Date: 7 Apr 2008 19:14:52 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <044401c8998a$896ed4e4$85f0af0a@corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You  use a shell variable to 
define the location of the
"local" directory outside
the buildroot tree.

I do not remember the
name right now but it
is in the top Makefile.

Do your configuration once
and for all and then
do "make saveconfig"
This will save the configuration
for Buildroot,uboot,linux,
busybox, et.c. in
your "$(LOCA?)/<project>"
directory for easy retrieval
when you download the
next svn.

Remember that thls is only
an issue if  you 

1) have not supplied any linux 
   conlig file
AND
2) Do not have *any* linux
    config file in your 
    $(BOARD_DIR)

Anyone using NGW100 and STK1000 boards will *never*
see this "xconfig/menuconfig"
issue.

I am thinking of adding
a shell variable which overrides
the ".config" anyway.


Best Regards
Ulf Samuelsson

-----Originalmeddelande-----
Fr?n: Thiago A. Corr?a
Skickat: m?n 2008-04-07 16:01
Till: Ulf Samuelsson
Kopia: buildroot
?rende: Re: [Buildroot] svn commit: trunk/buildroot/target/linux

Ulf,

   I for one use buildroot from an ssh shell, even thought the
building machine is right besides me. A default that requires X is
unreasonable, give that buildroot doesn't check for X, and doesn't
require X either. I too back up the others on the opinion that the
default behavior should be menuconfig.

>  I do not put this requirement on everyone else.
>  The default behaviour is
>  1) To not build a kernel at all or
>  2) To build a kernel using the classic behaviour.
>
>  Only by selecting two non-default behaviours you get
>  exposed to the "advanced" linux configuration
>  I have spent considerable time on during the last 9 months.

Actually, the default behavior for NGW100 and STK1000 is to use the
advanced linux configuration. And it's the only one that works at all
AFAIK.

>  This will default to xconfig for AT91/AVR32 chips,
>  but you have the option to select the menuconfig you want.

Which is exactly what most people seam to be using at the moment. At
least I haven't seen any target/device/Hitachi users, I doubt it even
builds new days.
Whenever I do an an{stk1002|ngw100}_defconfig, I have to craw thru a
bunch of menus and packages to change stuff (libdaemon doesn't build
on gentoo, using -j2 makes lot more sense than -j1, etc, etc....). Why
should a default config be tailored to a single user's needs?
IMHO it should be a reasonable minimum set of options most would be
happy with, and clearly xconfig isn't.

>  If someone wants a different behaviour,
>  then they can create yet another linux makefile.

That would just introduce more maintenance, just makes no sense.

>  > Even easier, change the setting in the defconfigs he works with.
>  >

Please don't. We might use ARMs too in the future. :)
What about the make BOARD=<name> save/get thing? I never used it
myself, but should work as an option.

Kind Regards,
    Thiago A. Correa


-------------- next part --------------
A non-text attachment was scrubbed...
Name: UlfSamuelsson.vcf
Type: application/octet-stream
Size: 491 bytes
Desc: UlfSamuelsson.vcf
Url : http://busybox.net/lists/buildroot/attachments/20080407/12e84f5b/attachment-0001.obj 
