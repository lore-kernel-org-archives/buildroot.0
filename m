From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 08:26:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: Fix dependency for
 selecting uclinux as TARGET_OS
In-Reply-To: <CAFRkauDiWLMrTHn6coC-D+Dpfmdr0MGKNznHy758bvzRf0n8rg@mail.gmail.com>
References: <1378262598.32360.5.camel@phoenix> <20130905234414.45a8106a@skate>
 <CAFRkauDiWLMrTHn6coC-D+Dpfmdr0MGKNznHy758bvzRf0n8rg@mail.gmail.com>
Message-ID: <20130906082632.5cc5c87b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Fri, 6 Sep 2013 10:21:55 +0800, Axel Lin wrote:

> > So it looks like the arm-<something>-uclinux* tuple should not be used,
> > if I understand this correctly. Do you have more details about why
> > arm-<something>-uclinux* should be used?
> 
> Somehow, I thought noMMU ARM platforms that using FLAT binary format needs to
> select uclinux as TARGET_OS.
> But since you mentioned the release notes of gcc 4.7, I'm not 100% sure.

I am not sure either.

> I check my build, the result is I have arm-buildroot-uclinux-uclibcgnueabi-gcc.
> And the build log shows it checks target system type as:
> checking target system type... arm-buildroot-uclinux-uclibcgnueabi
> 
> Does buildroot automatically convert arm*-*-uclinux* to arm*-*-uclinux*eabi?
> 
> I also check host-gcc-final-4.5.4/gcc/config.gcc and libgcc/config.host.
> Looks like it also expects arm*-*-uclinux* for ARM ucLinux and arm*-*-linux* for
> ARM GNU/Linux with ELF.

Can you check in more recent gcc versions such as 4.7 or 4.8 ? Looking
at the most recent versions is important to see what is the current
tuple accepted for this situation.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
