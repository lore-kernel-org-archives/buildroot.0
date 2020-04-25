From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2020 10:24:33 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix xtensa PR ld/25861
In-Reply-To: <20200423233221.28e17e3a@windsurf.home>
References: <20200423031145.18873-1-jcmvbkbc@gmail.com>
 <20200423233221.28e17e3a@windsurf.home>
Message-ID: <a547d3fe-ff67-d2d9-4059-f0f4dee414e8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max, All,

Le 23/04/2020 ? 23:32, Thomas Petazzoni a ?crit?:
> On Wed, 22 Apr 2020 20:11:45 -0700
> Max Filippov <jcmvbkbc@gmail.com> wrote:
> 
>> Handle link-time relaxation of full 16-bit difference values correctly
>> in xtensa linker. This fixes the following kind of build errors:
>>
>> .../five-point.cpp:338:(.debug_line+0x3b12):
>>        	dangerous relocation: overflow after relaxation
>>
>> Backported from:
>> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=30ce8e47fad9b057b6d7af9e1d43061126d34d20
>> Fixes:
>> http://autobuild.buildroot.net/results/67a5545779bbe8ca2b21da1f3ff2002053710ce1/
>> http://autobuild.buildroot.net/results/87f38998d2d60b6bce3128589973187ef9596e28/
>>
>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>> ---
>>  .../2.31.1/0019-xtensa-fix-PR-ld-25861.patch  | 376 +++++++++++++++
>>  .../2.32/0008-xtensa-fix-PR-ld-25861.patch    | 432 ++++++++++++++++++
>>  .../2.33.1/0005-xtensa-fix-PR-ld-25861.patch  | 432 ++++++++++++++++++
>>  3 files changed, 1240 insertions(+)
>>  create mode 100644 package/binutils/2.31.1/0019-xtensa-fix-PR-ld-25861.patch
>>  create mode 100644 package/binutils/2.32/0008-xtensa-fix-PR-ld-25861.patch
>>  create mode 100644 package/binutils/2.33.1/0005-xtensa-fix-PR-ld-25861.patch
> 
> Applied to master, thanks.

Thanks for your work on xtensa!

There is a new a build issue while building qemu_xtensa defconfigs:

https://gitlab.com/buildroot.org/buildroot/-/jobs/526035785

https://gitlab.com/buildroot.org/buildroot/-/jobs/526035783

Probably due to this patch.

Can you have a look?

Best regards,
Romain


> 
> Thomas
> 
