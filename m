From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 30 Dec 2019 15:16:54 +0100
Subject: [Buildroot] [PATCH] board/qemu/sh4-r2d: fix sh4 kernel bug with
 Binutils 2.33
In-Reply-To: <20191230145324.4eb78299@windsurf>
References: <20191230133640.9702-1-romain.naour@gmail.com>
 <20191230145324.4eb78299@windsurf>
Message-ID: <417a5a05-f317-fc27-c183-0682b0e3320c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 30/12/2019 ? 14:53, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Mon, 30 Dec 2019 14:36:40 +0100
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Remove the Binutils patch reverting [1] that trigger a sh4 kernel bug
>> with Binutils >= 2.33.
>> Add two kernel patch provided by Alan Modra [2] that fix alignment of rodata.
>>
>> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
>> [2] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Thanks a lot for those fixes. Have the kernel patches been submitted
> upstream, and accepted?

Not yet, I replied to Alan Modra to do so [1].

> 
> One issue with your change is of course that now the fix only works
> when building the specific qemu_sh4 defconfigs. When not using one of
> those defconfigs, but simply building the regular Linux kernel for SH4,
> will lead to a kernel that no longer boots.

Indeed but I don't think is great to keep the non-upstream patch I've made
reverting [2] for Binutils >= 2.33 for all architectures just to workaround a
sh4 kernel bug. At the time I didn't know that was a sh4 kernel bug...

The two sh4 kernel patches are probably easy to backport as soon as a sh4
toolchain using Binutils >= 2.33 is used.

[1] https://www.sourceware.org/ml/binutils/2019-12/msg00386.html
[2]
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e

Best regards,
Romain

> 
> Thomas
> 
