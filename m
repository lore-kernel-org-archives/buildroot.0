From: Manuel Sahm <ManuelSahm@freenet.de>
Date: Tue, 15 Jan 2008 22:06:42 +0100
Subject: [Buildroot] Buildroot for AT91SAM9260ek ???
In-Reply-To: <068f01c85628$d55a5493$85f0af0a@corp.atmel.com>
References: <068f01c85628$d55a5493$85f0af0a@corp.atmel.com>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHPNBStbvZ9BluURSOZ8EsPCgAAAEAAAAI5pkxmidMNBgS9NNLRpTSUBAAAAAA==@freenet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thanks Mr. Samuelsson,

first question:
------------------
Could you explain me why it?s not possible, I don?t understand because there
are binaries from AT91Bootstrap and UBOOT which are loadable from NAND Flash
at the starting process ???(For example from the firm TIMESYS)
So why no NAND Flash only system, when does the error happen ?

second question:
------------------
In the Buildroot menuconfig I try to add a patch to the 2.6.23 Kernel. I
want to download the 2.6.23-at91.patch.gz from
http://maxim.org.za/AT91RM9200/2.6/2.6.23-at91.patch.gz

But if I type make source the patch isn?t downloaded ?

What do I have to set, to download and apply this patch ?

Thank you very very much...

Manuel Sahm

-----Urspr?ngliche Nachricht-----
Von: Samuelsson, Ulf [mailto:ulf.samuelsson at atmel.com] 
Gesendet: Sonntag, 13. Januar 2008 22:10
An: Manuel Sahm; 'Ulf Samuelsson'; buildroot at uclibc.org
Betreff: Re: AW: [Buildroot] Buildroot for AT91SAM9260ek ???

It is open source.
You can do whatever modlficatllons
you want.
Due to Bugs in the BootROM
the AT91SAM9260 rev A does
*NOT* support a NAND
flash only system.



Best Regards
Ulf Samuelsson

-----Original Message-----
From: Manuel Sahm
Sent: l?r 2008-01-12 20:07
To: 'Ulf Samuelsson';buildroot at uclibc.org
Subject: AW: [Buildroot] Buildroot for AT91SAM9260ek ???
 
Thanks Mr. Samuelsson,

but I don?t want to use a DataFlashCard.

I only want to use the NAND flash which is on the Board (AT91SAM9260EK).

In the NAND Flash there should be the AT91Bootstrap, The UBoot Env, the
UBoot and the RootFileSystem...

Is it possible with Buildroot, what do I have to do/choose for this ?

Thank you very very much

Manuel Sahm

-----Urspr?ngliche Nachricht-----
Von: Ulf Samuelsson [mailto:ulf at atmel.com] 
Gesendet: Samstag, 12. Januar 2008 13:52
An: Manuel Sahm; buildroot at uclibc.org
Betreff: Re: [Buildroot] Buildroot for AT91SAM9260ek ???

Hello,

 

I?m new in Linux developing, I choose Buildroot to make my Linux
Distribution.

 

First I got Buildroot from 
$ svn co svn://uclibc.org/trunk/buildroot
then
$ make menuconfig

 

->

I go out with Exit
Then I want to enter:
$ make at91sam9260ek_defconfig

But there is no defconfig for the ek, only for pf and dfc ? 
What do I have to choose ?

Thank you very much
Manuel Sahm

==> Use the at91sam9260dfc.
        This is the AT91SAM9260EK running from a dataflash card
(AT45DCB008D).

Best Regards
Ulf Samuelsson
