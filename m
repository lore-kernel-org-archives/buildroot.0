From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 12 Sep 2013 09:13:21 +0800
Subject: [Buildroot] [PATCH] gcc-initial: Add host-elf2flt dependency
	when BR2_PACKAGE_HOST_ELF2FLT=y
In-Reply-To: <52305E98.7040202@zacarias.com.ar>
References: <1378307915.5313.1.camel@phoenix> <20130904181958.36251b69@skate>
 <52305E98.7040202@zacarias.com.ar>
Message-ID: <CAFRkauDMtOvQj0dx0Xxz2KhWxeHBFERvvU6cohSmpwv5ydRtiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/11 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 09/04/2013 01:19 PM, Thomas Petazzoni wrote:
>
>> Dear Axel Lin,
>>
>> On Wed, 04 Sep 2013 23:18:35 +0800, Axel Lin wrote:
>>> It's needed for some uClibc combination, link-flat.so which uses elf2flt
>>> pulls in libgcc according to uclibc/Makerules (used in uclibc/libc/Makefile.in).
>>> Thus pull it in for gcc-initial.
>>>
>>> This also ensures elf2flt is ready when BR2_PACKAGE_HOST_ELF2FLT=y before
>>> building other packages.
>>>
>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>
>> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Actually pulling in host-elf2flt should depend on BINFMT_FLAT rather
> than the package being selected, as per the patch i've just sent.

Either looks ok to me. (I don't see the difference here.)

Probably not directly related to this topic, but I have a question about
the dependency between BR2_BINFMT_FLAT & BR2_PACKAGE_HOST_ELF2FLT.

Why not just make BR2_PACKAGE_HOST_ELF2FLT depend on BR2_BINFMT_FLAT
rather than "depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc"?

I'm not familiar with sparc.
But according to current dependency setting, it's not possible to select
BR2_BINFMT_FLAT for sparc but it's possible to select BR2_PACKAGE_HOST_ELF2FLT
for sparc.

Regards,
Axel
