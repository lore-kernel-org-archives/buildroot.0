From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 16:44:13 +0200
Subject: [Buildroot] regression for microblaze architecture
In-Reply-To: <20170527085122.GB24800@waldemar-brodkorb.de>
References: <20170527085122.GB24800@waldemar-brodkorb.de>
Message-ID: <20170527164413.5cba5b05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 10:51:22 +0200, Waldemar Brodkorb wrote:

> Buildroot and OpenADK have samples to create a Linux system to be
> bootup in Qemu system emulation for microblaze architecture.
> 
> With gcc 6.3 and 7.1 the samples are not working anymore, 
> because the Linux system userland does not boot.
> Qemu 2.9.0:
> Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> (with glibc, musl and uClibc-ng toolchains)
> 
> I bisected gcc source code and found the bad commit:
> 6dcad60c0ef48af584395a40feeb256fb82986a8

Nice, great work!

> When reverting the change, gcc 6.3 and 7.1 produces working
> Linux rootfs again.
> 
> What can we do about it?

 1. Add a revert of this commit in Buildroot for gcc 6.x and 7.x

 2. Report the bug upstream, pointing to the problematic commit

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
