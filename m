From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 9 Jan 2008 08:59:56 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN><01ce01c8524a$65be7fa0$080514ac@atmel.com>
	<47847933.2010902@gmail.com>
Message-ID: <008301c85298$5df36d00$7601a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Joe" <zentrale.at.work@gmail.com>
To: <buildroot@uclibc.org>
Sent: Wednesday, January 09, 2008 8:35 AM
Subject: Re: [Buildroot] How is the RM9200 status of buildroot ?


> We're using a custom RM9200 board (parallel flash) also with buildroot, 
> and i would like to specify some of the "limitations" Ulf mentioned if 
> on parallel flash:
> 
> - Kernel won't work created by buildroot. We've moved to build one using 
> the buildroot toolchain, sources are vanilla + the victor patches + some 
> small fixes concerning the PHY

If you want to have your board supported, then I suggest that you
provide the patches neccessary.

Please note that you can easily create your own board support by doing:

$ make configurated
then you edit the different configuration files.
$ make saveconfig

Your project configuration files are then saved in "local/<project>"

By making "local" a symbolic link, you can share it between 
different instances of buildroot.


> - U-Boot is the same, but for you are on a custom board, you'll always 
> have to "tune" the bootloader, i think.
> - I would suggest to stick with the OABI. We've given EABI more than 
> just a try and kept running into a whole lotta trouble.
> - Most "standard apps" will work: bash, busybox, gcc - for evereything 
> else, we compile in-target here.
> 
> Hope that  helps a little, Joe
> 


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
