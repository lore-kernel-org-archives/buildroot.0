From: Paul Archer <ptarcher@gmail.com>
Date: Thu, 28 May 2009 16:14:48 +1000
Subject: [Buildroot] GCC-4.3.3 in toolchain fails to compile
In-Reply-To: <87iqjqfg2c.fsf@macbook.be.48ers.dk>
References: <56ea0bb80905212032x1e01cdfbt4c427fc85c9b72e3@mail.gmail.com>
	<87iqjqfg2c.fsf@macbook.be.48ers.dk>
Message-ID: <56ea0bb80905272314k37d90aaep7af8de9aa846b1f9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Peter,

Thanks for the reply

Peter> You have:
Peter>
Peter> BR2_ARM_EABI=y
Peter> BR2_GNU_TARGET_SUFFIX="linux-uclibc"
Peter>
Peter> Which doesn't make sense. The correct target suffix for eabi is
Peter> "linux-uclibcgnueabi". With that change the toolchain builds.
Making this change let me build the toolchain, and by using the
snapshot-20090522 I was able to build and boot. Thank you for the
change.

Peter> How did you get to that config? Is is based on any defconfig in
Peter> buildroot?
It was a mixture of the def config in the buildroot along with some
changes from linux4sam.com at
http://www.linux4sam.org/twiki/pub/Linux4SAM/BuildRootGet/buildroot-v23434.patch.
Finally I tried to remove most things.

Peter> and that there's no at91sam9g20ek support in
Peter> u-boot (well, there is now in u-boot git after the 2009.03 release,
Peter> but not in any released versions)
With regards to u-boot, I have u-boot working brilliantly with
u-boot-2009.06-rc1, however I was having trouble with the u-boot tools
for reading the enviroment from linux. I had trouble building this run
on the target, I constantly got can't find file
'/usr/bin/fw_printenv', but thats another story.

Thanks for your help peter.


-- 
----
Regards
Paul Archer
ptarcher at gmail.com
