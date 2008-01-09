From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Wed, 9 Jan 2008 14:51:15 -0500
Subject: [Buildroot] How is the RM9200 status of buildroot ?
In-Reply-To: <014901c852ed$4ce2d500$6103170a@atmel.com>
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>
	<01ce01c8524a$65be7fa0$080514ac@atmel.com>
	<000001c852cc$8bd69100$6e00a8c0@JONATHAN>
	<014901c852ed$4ce2d500$6103170a@atmel.com>
Message-ID: <009e01c852f8$fe7078d0$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Great information ulf,

I already have my board in hand. I done some basic testing with a jtag
interface with openocd. I can talk to the cpu this is a good news in some
way. Then I try to talk to the flash and got some response. So I think I'm
in good position to continue testing my board. 

What I will do next is to try to use the jtag interface and write to sdram. 

As for why we use parallel flash ... I' don't know. I have access to sd
memory also. This can be a good thing ? 

I think we based our design on the EK board. I will have to talk about this
to the engineer that builds up the schematics. 

Again, 

I'll appreciate your information.

Jonathan

-----Message d'origine-----
De?: Ulf Samuelsson [mailto:ulf at atmel.com] 
Envoy??: 9 janvier 2008 13:27
??: Jonathan Dumaresq; buildroot at uclibc.org
Objet?: Re: [Buildroot] How is the RM9200 status of buildroot ?

I would like to thanks you guys to point me to the right thing. 

Here a little bit of information about our board.

CPU = RM9200
FLASH = AT49BV642D connected in a 16bit data bus
SDRAM = 2 x MT48LC8M16A2P-7E from Micron Technology. We have 2 SDRAM
connected in parallel with 16 bits databus. I think we based this design on
the dk board supplies by atmel. 

Since a relatively new to all of the arm9 cpu + linux, I think I will have
some fun to get all of this working :)

I would like to know if it is possible to do some basinc testing on my board
to know if my memories setup is working correctly before going to far with
linux etc. ? I have acces to a jtag interface if this can help. 

==> Traditionally, the process of getting an AT91RM9200 to run from a 
        parallel flash is to set BMS high to boot from the bootROM,
        Download "loader.bin" using X-Modem to the internal SRAM,
        "loader.bin" will start a new x-modem session and you use this
        to download "boot.bin", which gets programmed into the first sector
        of the parallel flash.
        You will then program the u-boot.gz into a nearby sector of the
flash.

        After a reset, the board will execute "boot.bin" which will 
        decompress u-boot.gz into SDRAM and jump to the start of the U-boot.

        You will need to check with your local contact to get source of
"loader.bin"
        and "boot.bin". They were originally compiled by gcc-2.95.3 and
        using gcc-3.x.x does not work as far as I know.
        I am not aware of anyone trying with gcc-4.x.x.

        boot.bin/loader.bin binaries might work, but they were written for
        the somewhat compatible AT49BV6416.

        There is not a lot of support from Atmel on booting the AT91SAM926x
chips
        from a parallel flash, but many customers has succeeded in getting
        them to run anyway.
        Hopefully, next generation of AT91Bootstrap will support parallel
flash,
        but the AT91RM9200 is not supported at all by the bootstrap.

        Why parallel flash in the first place???
        
        Please be aware that the AT91RM9200DK has some critical flaws.
        The AT91RM9200EK was designed to get rid of those flaws.
        Again, discuss with your local Atmel FAE to have your schematics
reviewed.

Best Regards
Ulf Samuelsson
