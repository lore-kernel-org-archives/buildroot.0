From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 23:52:09 +0800
Subject: [Buildroot] New Kernel Module
In-Reply-To: <6d75f7d2.479c831d.52cc004b.8b1f5@o2.pl>
References: <6d75f7d2.479c831d.52cc004b.8b1f5@o2.pl>
Message-ID: <20140107235209.1a53413a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pawel,

On Tue, 07 Jan 2014 14:25:31 +0100, makowski.pawel wrote:

> &gt; 1. I put?an example?c file with well know hello_world example?to?/output/build/linux_xyz/samples/mykmod directory.

Don't do this. output/build is a temporary directory created only for
the duration of the build. The next time you will do "make clean", it
will be completely removed, and you will loose your changes.

Doing changes in output/build is OK is those are just for quickly
testing if a change fixes something. But any sort of development should
*NOT* be done by changing stuff in output/build.

> &gt; 2. I create Makefile for it: obj-$(CONFIG_SAMPLE_MYKMOD) += mykmod.o
> &gt; 3. I add the new section to KConfig in samples directory.
> ?
> When I run the make linux-menuconfig a new module is visible. So, I check it to the build.
> After issued the make command there is visible that my module is built.
> I download Kernel image and RootFs to the target and I can't find the?module file.
> Where can I find this file ? How can I menage this module ?

Check in output/target/lib/modules/<version>/ if it is there.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
