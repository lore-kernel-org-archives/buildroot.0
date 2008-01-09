From: Joe <zentrale.at.work@gmail.com>
Date: Wed, 09 Jan 2008 08:35:15 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
In-Reply-To: <01ce01c8524a$65be7fa0$080514ac@atmel.com>
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>
	<01ce01c8524a$65be7fa0$080514ac@atmel.com>
Message-ID: <47847933.2010902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're using a custom RM9200 board (parallel flash) also with buildroot, 
and i would like to specify some of the "limitations" Ulf mentioned if 
on parallel flash:

- Kernel won't work created by buildroot. We've moved to build one using 
the buildroot toolchain, sources are vanilla + the victor patches + some 
small fixes concerning the PHY
- U-Boot is the same, but for you are on a custom board, you'll always 
have to "tune" the bootloader, i think.
- I would suggest to stick with the OABI. We've given EABI more than 
just a try and kept running into a whole lotta trouble.
- Most "standard apps" will work: bash, busybox, gcc - for evereything 
else, we compile in-target here.

Hope that  helps a little, Joe

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at gmail.com

watch out for:
www.rocksociety.de
