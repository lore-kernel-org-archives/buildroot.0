From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Mon, 1 Nov 2010 10:55:29 +0000 (GMT)
Subject: [Buildroot] at91sam9260 alsa problem
In-Reply-To: <262336.75716.qm@web29607.mail.ird.yahoo.com>
References: <855007.40683.qm@web29601.mail.ird.yahoo.com>
	<262336.75716.qm@web29607.mail.ird.yahoo.com>
Message-ID: <811511.24510.qm@web29618.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi



----- Messaggio originale -----
> Da: Michael Trimarchi <trimarchimichael@yahoo.it>
> A: Michael Trimarchi <trimarchimichael@yahoo.it>; buildroot at busybox.net
> Inviato: Lun 1 novembre 2010, 11:43:13
> Oggetto: Re: [Buildroot] at91sam9260 alsa problem
> 
> 
> 
> Hi all
> 
> maybe this one is the right configuration of the machine  in  buildroot
> 
> BR2_ARM_OABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="arm9tdmi"
> BR2_GCC_TARGET_ARCH="armv4t"

sorry this is the arm5te

Michael

> BR2_GCC_TARGET_ABI="apcs-gnu"
> 
> I  have seen a lot of mailing list and different people report some strange 
> problem with alsa. I'm using
> a 2.6.29.3 kernel  revision
> 
> Michael
> 
> 
> ----- Messaggio originale -----
> > Da:  Michael Trimarchi <trimarchimichael@yahoo.it>
> >  A: buildroot at busybox.net
> > Inviato:  Lun 1 novembre 2010, 10:40:30
> > Oggetto: [Buildroot] at91sam9260 alsa  problem
> > 
> > Hi all
> > 
> > I have compiled the linux  kernel (2.6.29) with EABI option disable  so the 
> > expected compiled  option is:
> > 
> > -mpcu=apcs-gnu
> > 
> > I have the   same compiled option in buildroot and now the amixer and 
>alsamixer 
>
> 
> >  works but  aplay and arecord
> > 
> > report this error:
> > 
> > set_params:  Channels  count non available
> > 
> >  Compile the kernel using eabi and oabi compatible  give different  error.
> > 
> > This is the relevant part of buildroot   config
> > 
> > BR2_ARM_TYPE="GENERIC_ARM"
> > # BR2_ARM_EABI is  not  set
> > BR2_ARM_OABI=y
> > BR2_ARCH="arm"
> >  BR2_ENDIAN="LITTLE"
> > BR2_GCC_TARGET_ABI="apcs-gnu"
> > 
> >  #
> > #  Target options
> > #
> > 
> > #
> > # Preset  Devices
> > #
> > # BR2_TARGET_ARMLTD is  not  set
> >  BR2_BOARD_NAME="at91sam9260dfc"
> >  BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
> > 
> >  and  this is the relevant part of the kernel
> > 
> > #  CONFIG_AEABI is not  set
> > 
> > With other combination I can use  playback and record facilites but  the 
>mixer 
>
> > doesn't
> > work  for the size of the parameteres during kernel  syscall
> > 
> >  Best regards
> > Michael Trimarchi
> > 
> > 
> > 
> >         
> >  _______________________________________________
> > buildroot mailing   list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 
> 
>   
> 


      
