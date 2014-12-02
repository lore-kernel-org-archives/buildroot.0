From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 02 Dec 2014 12:53:19 -0300
Subject: [Buildroot] qemu_microblazeel_mmu_defconfig: booting issue
In-Reply-To: <20141202163123.786d02c9@free-electrons.com>
References: <CANQCQpaZmxDtd+vVuvcPF9GDQjqNKOdJ5ddy3kX4wSuxbZf=kw@mail.gmail.com>
 <20141202163123.786d02c9@free-electrons.com>
Message-ID: <547DE06F.5060206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2014 12:31 PM, Thomas Petazzoni wrote:

>> I grabbed the 2014.11 release and did a build using the
>> qemu_microblazeel_mmu_defconfig.  I tried to execute it with "QEMU
>> emulator version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.7)" using the
>> command provided in the "board/qemu/microblazeel-mmu/readme.txt".
>>
>> Spenser, what was the last kernel version you've successfully tested a
>> build against?  I noticed there have been a few sweeping bumps of
>> kernel versions that included this defconfig.
> 
> It was bumped by Gustavo recently, and I know Gustavo always boot
> tests the Qemu defconfigs when doing the bumps. As written in
> readme.txt, you should use Qemu 2.1.2, not Qemu 2.0.0. That's most
> likely the problem.

You can fetch my test images from:
https://www.zacarias.com.ar/buildroot/qemu-images/

Bumps are based on those results, not necessarily a release version of
buildroot and i normally test with the latest available qemu version and
roll back versions in case there's breakage, so older versions might or
might not work for a given config that works with latest.

That being said with 2.1.2 every config works except the mpc8544ds one
which fails silently.

2.2.0 will be out soon and i'll retest everything to see if a single
version can be specified, of course that's temporary because of newer
versions/features, but i like a single version for all when it's possible.

Regards.
