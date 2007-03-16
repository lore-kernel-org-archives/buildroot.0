From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 16 Mar 2007 22:47:48 +0100
Subject: [Buildroot] AT91SAM9260-EK dev Board.
References: <0EC1BDC1699B7C42A43B634A17463A7701A682@VENUS.DaitoEng.com><c88e466f0701100043k65779458pf360d6e4a6051fda@mail.gmail.com><45B376D8.2070902@indiana.edu><c88e466f0701260203n1de23d51x2a8ffb2794cdab27@mail.gmail.com>
	<5fb065d90703160611h790be65dl2c5c57e9af6cbc86@mail.gmail.com>
Message-ID: <00ea01c76815$66bd1c60$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello all
> 
> I'm just reading this thread of mail and making rootfs step by step
> using all the indication given by Michel Benoit.
> But there is something strange with my rootfs.arm.ext2. Indeed, its
> size is about 40MB due to lib files? Is there any possibility to have
> a real embedded rootfs using buildroot (with a size that is about
> 5MB)?
> 
> kind of regards
> 
> Frederic
> 


Yes it is possible
Check that you are not including a gcc toolset in your root file system.

Otherwise, you have to do make menuconfig and remove everything,
and then successively add things.
Beware, that once you add something to your root file system,
buildroot will not remove it, even if you "remove" the package
using make menuconfig.

The buildroot mailing list is more appropriate for these questions.


Best Regards
Ulf Samuelsson
