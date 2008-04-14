From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 14 Apr 2008 22:55:03 +0200
Subject: [Buildroot] zImage.embedded
References: <014701c89bda$09380060$ad289e86@LPSC0173W><fa686aa40804110655x48120e84tde01a52d8bb39a3@mail.gmail.com>
	<01e801c89e49$6d0e6400$ad289e86@LPSC0173W>
Message-ID: <000b01c89eb5$2af81630$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> [cross posting from one mailing list to another]
> 
>>>  is the file zImage.elf my proper network image ?
>>
>> What bootloader is on your board?  zImage.elf *might* be the proper
>> image.  If you're using u-boot, then you want to build a uImage
>> instead.
> 
> I'm trying to compile u-boot with buildroot, but it fails with:
> 
>                /usr/bin/make -j1 -C 
> /home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/u-boot-1.3.2 
> \
>                ""_config
> make[1]: Entering directory 
> `/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/u-boot-1.3.2'
> make[1]: *** No rule to make target `_config'.  Stop.
> make[1]: Leaving directory 
> `/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/u-boot-1.3.2'
> make: *** 
> [/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/u-boot-1.3.2/.configured] 
> Error 2
> 
> Apparently it expects a BOARD_NAME variable, but I don't know what to put in 
> it (I looked at the makefile and can't find the ml405 referenced in there).
> -- 
> Guillaume Dargaud
> http://www.gdargaud.net/
> 


I think you need to figure out how to build u-boot for your board
outside buildroot, before you try to build it inside buildroot.


Best Regards
Ulf Samuelsson
