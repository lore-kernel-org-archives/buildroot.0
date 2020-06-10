From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 10 Jun 2020 15:41:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add valgrind support
In-Reply-To: <CADvTj4poke9OOMZBz6t+vtb7Mb+nRM9oWKyGw_yqQuzgKDKSDQ@mail.gmail.com>
References: <20200428052225.121426-1-james.hilliard1@gmail.com>
 <20200428074521.1142454c@windsurf.home>
 <CADvTj4poke9OOMZBz6t+vtb7Mb+nRM9oWKyGw_yqQuzgKDKSDQ@mail.gmail.com>
Message-ID: <08778ca0-f76f-efbc-7818-f728a5634ad6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James, Thomas,

Le 28/04/2020 ? 07:47, James Hilliard a ?crit?:
> On Mon, Apr 27, 2020 at 11:45 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Mon, 27 Apr 2020 23:22:25 -0600
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>  package/mesa3d/mesa3d.mk | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> Speaking of mesa3d/valgrind, we have this:
>>
>>   http://autobuild.buildroot.net/results/1b5/1b58d73ecbbe1af2c3e140563d696cf32d1c4a5a/build-end.log
>>
>> Seems like mesa3d is trying to link with some static libraries from
>> valgrind, which are not built with -fPIC. Have you looked into this?
> Yeah, I had added this trying to fix that but it didn't seem to help.

I spent some time investigating this issue but the problem is that mesa try to
link with libcoregrind-<arch>-linux.a to build libgbm.so. But even by hacking
the valgrind build system, the build is still failing.

I tried with several toolchain (glibc and uclibc).

Out of curiosity, what's your use case that require valgrind in mesa3d ?

Note: The valgrind support is enabled in archlinux and fedora

https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa

https://src.fedoraproject.org/rpms/valgrind/blob/master/f/valgrind.spec

But no problem on their side ?

Any idea ? otherwise we have to revert this patch because the build is still
failing in the autobuilder.

Best regards,
Romain


>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
