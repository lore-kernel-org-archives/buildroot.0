From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 09:12:49 +0200
Subject: [Buildroot] Asking a favor
In-Reply-To: <20140413212851.GA6582@free.fr>
References: <ea83c79e30b1bba43b6fe3de6096e8e7@paravisioner.com>
 <20140413212851.GA6582@free.fr>
Message-ID: <20140414091249.09b2db65@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Apr 2014 23:28:51 +0200, Yann E. MORIN wrote:

> On 2014-04-14 01:23 +0430, Parsa Panahi spake thusly:
> > I have a problem with buildroot configuration file. when I create the .config file and make it, I face an error in the terminal
> > that :
> > 
> > linux/linux.mk:69: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_USE_INTREE_DTS /
> > BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings.  Stop.
> > 
> > I searched the whole Internet !!! and found nothing useful ! I don't know what causing this problem !! I've commented these
> > variables ( BR2_LINUX_KERNEL_USE_INTREE_DTS, BR2_LINUX_KERNEL_USE_CUSTOM_DTS) in the .config file but when I make the new file it
> > gives another error for another variable !!

Well, the message says it all: you have told Buildroot to generate a
Device Tree blob for you by enabling the BR2_LINUX_KERNEL_DTS_SUPPORT
option, but you didn't provide any reference to which Device Tree you
wanted to compile.

Can you share your Buildroot .config file so we can check that this is
actually what's going on?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
