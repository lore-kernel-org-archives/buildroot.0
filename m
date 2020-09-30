From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Sep 2020 23:04:22 +0200
Subject: [Buildroot] [PATCH 2/2] linux: Disable
 -ftree-loop-distribute-patterns when building for microblaze with gcc >= 10
In-Reply-To: <20200930225921.39dbe8a5@windsurf.home>
References: <20200926191330.96074-1-romain.naour@gmail.com>
 <20200926191330.96074-2-romain.naour@gmail.com>
 <20200930225921.39dbe8a5@windsurf.home>
Message-ID: <2efd6cda-edbf-bb5e-d7d7-89ca4491f0f0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 30/09/2020 ? 22:59, Thomas Petazzoni a ?crit?:
> On Sat, 26 Sep 2020 21:13:30 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> +# https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208
>> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10)$(BR2_microblaze),yy)
>> +LINUX_KCFLAGS += -fno-tree-loop-distribute-patterns
>> +endif
> 
> I am wondering if this is the right approach. If the
> -ftree-loop-distribute-patterns breaks stuff for the kernel, presumably
> it could also break stuff for user-space software. So I guess we should
> instead disable it entirely in TARGET_CFLAGS.
> 
> The gotcha being of course that we don't pass TARGET_CFLAGS to the
> Linux package...

Indeed, I have no ideas if the userspace built with this toolchain is really
working... except for busybox which was used by qemu_microblazeel_mmu_defconfig

Best regards,
Romain

> 
> Thomas
> 
