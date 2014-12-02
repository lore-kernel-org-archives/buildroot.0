From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 2 Dec 2014 10:02:26 -0600
Subject: [Buildroot] qemu_microblazeel_mmu_defconfig: booting issue
In-Reply-To: <547DE06F.5060206@zacarias.com.ar>
References: <CANQCQpaZmxDtd+vVuvcPF9GDQjqNKOdJ5ddy3kX4wSuxbZf=kw@mail.gmail.com>
 <20141202163123.786d02c9@free-electrons.com>
 <547DE06F.5060206@zacarias.com.ar>
Message-ID: <CANQCQpZgYOSRVa45N+_rLo-6BcdAoffrz2i_uCphnO2y4WdFzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Dec 2, 2014 at 9:53 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 12/02/2014 12:31 PM, Thomas Petazzoni wrote:
>
>>> I grabbed the 2014.11 release and did a build using the
>>> qemu_microblazeel_mmu_defconfig.  I tried to execute it with "QEMU
>>> emulator version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.7)" using the
>>> command provided in the "board/qemu/microblazeel-mmu/readme.txt".
>>>
>>> Spenser, what was the last kernel version you've successfully tested a
>>> build against?  I noticed there have been a few sweeping bumps of
>>> kernel versions that included this defconfig.
>>
>> It was bumped by Gustavo recently, and I know Gustavo always boot
>> tests the Qemu defconfigs when doing the bumps. As written in
>> readme.txt, you should use Qemu 2.1.2, not Qemu 2.0.0. That's most
>> likely the problem.

Good to know.  Gustavo, I appreciate the testing.

>
> You can fetch my test images from:
> https://www.zacarias.com.ar/buildroot/qemu-images/
>
> Bumps are based on those results, not necessarily a release version of
> buildroot and i normally test with the latest available qemu version and
> roll back versions in case there's breakage, so older versions might or
> might not work for a given config that works with latest.
>
> That being said with 2.1.2 every config works except the mpc8544ds one
> which fails silently.

Thanks, it worked once I bumped to 2.1. Sorry about that I overlooked
the qemu version it was tested against.

>
> 2.2.0 will be out soon and i'll retest everything to see if a single
> version can be specified, of course that's temporary because of newer
> versions/features, but i like a single version for all when it's possible.

Good to know.

>
> Regards.
>
