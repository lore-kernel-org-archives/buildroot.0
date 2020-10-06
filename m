From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2020 20:46:04 +0200
Subject: [Buildroot] [PATCH 2/2] linux: Disable
 -ftree-loop-distribute-patterns when building for microblaze with gcc >= 10
In-Reply-To: <20201001100616.2cb75cc9@windsurf.home>
References: <20200926191330.96074-1-romain.naour@gmail.com>
 <20200926191330.96074-2-romain.naour@gmail.com>
 <20200930225921.39dbe8a5@windsurf.home>
 <2efd6cda-edbf-bb5e-d7d7-89ca4491f0f0@gmail.com>
 <20201001100616.2cb75cc9@windsurf.home>
Message-ID: <bf99ed13-4c83-4500-7abf-fc301ae11e2e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/10/2020 10:06, Thomas Petazzoni wrote:
> On Wed, 30 Sep 2020 23:04:22 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>>> The gotcha being of course that we don't pass TARGET_CFLAGS to the
>>> Linux package...  
>>
>> Indeed, I have no ideas if the userspace built with this toolchain is really
>> working... except for busybox which was used by qemu_microblazeel_mmu_defconfig
> 
> I think we should be passing this flag in TARGET_CFLAGS. What bothers
> me is that passing it in TARGET_CFLAGS would not resolve the Linux
> build issue, as Linux isn't built with TARGET_CFLAGS...

 If it's something needed to "fix the compiler", then it should be in the
toolchain wrapper (i.e. TOOLCHAIN_WRAPPER_OPTS).

 Regards,
 Arnout
