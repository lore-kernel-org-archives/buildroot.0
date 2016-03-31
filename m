From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 31 Mar 2016 06:20:51 +0300
Subject: [Buildroot] [PATCH 0/2] xtensa noMMU support
In-Reply-To: <20160331035749.2a03ba86@free-electrons.com>
References: <1458228424-10330-1-git-send-email-jcmvbkbc@gmail.com>
 <20160331035749.2a03ba86@free-electrons.com>
Message-ID: <CAMo8Bf+D8=R3bhnpqqPGmchKeE-QitgewSr59DDkv7tNJ1WsAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 31, 2016 at 4:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 17 Mar 2016 18:27:02 +0300, Max Filippov wrote:
>> this series enables noMMU support for xtensa.
>> noMMU xtensa uses FLAT binaries and linuxthreads.
>> This series assumes elf2flt support for Xtensa.
>
> Is this actually the case?

The following patch would switch to elf2flt version that has xtensa support:
  https://patchwork.ozlabs.org/patch/599708/
and it was on the list before I sent this series.

But I realize that elf2flt build is not enabled for xtensa, even with the
above patch. I'll send a fix that enables it.

>> Max Filippov (2):
>>   gcc: add xtensa uClinux support
>>   uclibc: enable linuxthreads for xtensa
>
> Applied, thanks!
>
> Is it possible to boot a noMMU Xtensa system under Qemu ?

It is possible to run noMMU kernel and userspace on MMUv3 cores
with the mainline QEMU. Real noMMU cores need a fix that wasn't
accepted to the QEMU mainline:
  http://qemu.11.n7.nabble.com/PATCH-0-3-target-xtensa-xtfpga-support-cores-without-MMU-td358668.html
I probably need to get back to it and make suggested changes.

-- 
Thanks.
-- Max
