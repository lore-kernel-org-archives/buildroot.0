From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Mar 2019 00:14:55 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/elf2flt: bump version to fix
 build with Binutils >= 2.32
In-Reply-To: <20190312225644.21b59dea@windsurf>
References: <20190310104428.11398-1-romain.naour@smile.fr>
 <20190312225644.21b59dea@windsurf>
Message-ID: <36c243e2-181e-2bae-add6-e481219fc7e3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 12/03/2019 ? 22:56, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Sun, 10 Mar 2019 11:44:27 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> From: Romain Naour <romain.naour@gmail.com>
>>
>> Binutils added bfd_stdint.h to bfd.h [1], so elf2flt must create a
>> symlink for this header.
>>
>> Bump the elf2flt version that include the upstream fix [2].
>>
>> Keep our local patch 0001-ld-elf2flt-behave-properly-when-called-with-a-name-d.patch
>> that was not integrated with the recent project activity [3].
>>
>> Fixes:
>> [armv7m-uclibc]
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356410
>>
>> [m68k-coldfire-uclibc]
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356412
>>
>> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2d5d5a8f0a8b5a03454bf168b7fa7024bb1ebbd8
>> [2] https://github.com/uclinux-dev/elf2flt/commit/429521f695c6f4212d809a141bfa4417b733f395
>> [3] https://github.com/uclinux-dev/elf2flt/pull/8
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> I've applied both patches. I have pinged on the elf2flt pull request as
> well.

Thanks!

> 
> Regarding binutils, we now support 5 versions, which is not good, we
> should get back to just 3 versions, and move to binutils 2.31 as the
> default. Do you think you could send patches doing that ?

Done.

We postponed the removal of binutils 2.28 due to ARM thumb bug IIRC [1].
binutils 2.30 is the only remaining one with this bug, I updated the comment in
linux/Config.in accordingly.

Now binutils 2.31 and 2.32 are out we can remove binutils 2.28 and 2.29.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=21458

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
