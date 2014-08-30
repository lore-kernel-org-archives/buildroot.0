From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Aug 2014 09:28:06 +0200
Subject: [Buildroot] About i386 Architecture and Grub2
In-Reply-To: <1408871597.42022.YahooMailNeo@web141705.mail.bf1.yahoo.com>
References: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
 <20140820141013.24de59df@free-electrons.com>
 <1408588309.32587.YahooMailNeo@web141705.mail.bf1.yahoo.com>
 <20140821150337.3bc770ae@free-electrons.com>
 <1408871597.42022.YahooMailNeo@web141705.mail.bf1.yahoo.com>
Message-ID: <20140830092806.6e5ff4cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear lee choon gay,

On Sun, 24 Aug 2014 02:13:17 -0700, lee choon gay wrote:

> I took a look at the /boot/grub/grub.cfg from my PC, it also need initrd to boot up.

> I also saw some article from internet saying initrd is a must and the
> kernel init process is the one that responsible to switch from ram
> file system to real file system.

This is wrong. Don't believe what you read on "the Internet". An initrd
is an *optional* mechanism. Basically, you have several choices:

 1/ The kernel directly mounts the real root filesystem, as indicated
    by the root= kernel parameter. There is no initrd involved
    whatsoever.

 2/ There is an initrd, but it never switches to another root
    filesystem. This is sometimes used for very small systems: it allows
    the entire filesystem (contained in the initrd) to be loaded in RAM
    by the bootloader. I typically use this when I do kernel
    development: this way the root filesystem (contained in the initrd)
    can be used by the kernel without the need of any network or
    storage driver.

 3/ There is an initrd, which does a part of the system initialization,
    and then switches to the real root filesystem. This is what is used
    by most desktop/server Linux distributions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
