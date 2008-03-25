From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 16:12:06 +0100
Subject: [Buildroot] question about /tftpboot
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
	<47E3F85A.7000608@eclis.ch>
	<071301c88e62$eced8f30$070514ac@atmel.com>
	<47E8DBA5.3040304@eclis.ch>
Message-ID: <00da01c88e8c$9254dd60$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> There is a symbol BR2_LINUX_COPYTO to adjust that. Some time ago I found 
>>> it broken by the target/linux/Makefile.in.advanced file and I proposed a 
>>> patch in this bug report: http://bugs.uclibc.org/view.php?id=2384
>>> 
>>> Maybe the situation is better now.
> >
> >The linux kernel should possibly be copied several times, and
> >you cannot use a single symbol for this.
> 
> Thanks Ulf for your hint, but did you have a more precise example ? I 
> observed that only the Atmel targets uses a second symbol 
> BR2_TARGET_ATMEL_COPYTO.
> 
> I have updated my two proposed patchs 
> http://bugs.uclibc.org/view.php?id=2384 and 
> http://bugs.uclibc.org/view.php?id=2394 to match the current SVN head. 
> There don't change the fact that there is two symbols, there only make 
> the COPYTOP symbols possibly work if the tftpboot directory is anything 
> other than "/tftpboot" like this is more and more the case on the new 
> distributions.
> 
> The idea to use only one symbol cam after I see that there is two of 
> them for Atmel targets. I still don't see why something would go wrong 
> if the BR2_TARGET_ATMEL_COPYTO will be replaced by the BR2_LINUX_COPYTO. 

Not running Linux on my laptop at the moment, so I cannot check the svn
but as I see it, you want to be able to copy the linux image to

1) BINARIES_DIR
2) root file system (option)
3) A place where it is easy to download to the target using tftp,
    which defaults to "/tftpboot".
    It is OK, to make this programmable as long the default is used.
    As an option, we could add a shell symbol "BUILDROOT_TFTP_DIR"
    which overrides the menuconfig.



Best Regards
Ulf Samuelsson
