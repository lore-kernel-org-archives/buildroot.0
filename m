From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sat, 12 May 2012 01:01:36 -0400
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <4FAD9523.3020501@mind.be>
References: <1336560101-29035-1-git-send-email-golubovsky@gmail.com>
 <4FAD9523.3020501@mind.be>
Message-ID: <CADiAo4KofjL+kb8RLbWRwHauYpgqtWefLi_4QwV50sMgf-M+VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, May 11, 2012 at 6:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/09/12 12:41, Dmitry wrote:
> [snip]
>
>> +# This flag to configure should be per target architecture rather than
>> +# autodetected (or it will be per host architecture which may be
>> +# not the same as target).
>> +
>> +X86EMU = $(if $(BR2_i386),n,y)
>
>
> ?This comment was not very clear to me. ?I guess you mean
> # The configure script autodetects the host architecture, so we must
> # pass the target architecture explicitly.

Thanks for your feedback. Indeed, the configure script calls uname -m
by default, that is, assumes host architecture is same as target's.

>
> ?When you use GENTARGETS, you must also specify the install commands.

And if I don't then standard "cd $(@D); make install" or anything
similar will be used? Somehow it works without explicit install
command specification.

> However, you can probably keep using AUTOTARGETS. ?Even when you use
> AUTOTARGETS, it is possible to override the CONFIGURE_CMDS and BUILD_CMDS.

Due to the way v86d configure is written GENTARGETS seems to be more
proper - I got convinced.

> But you don't even need to override the BUILD_CMDS. ?Instead, you can
> pass additional options to the MAKE call, by defining
>
> V86D_MAKE_OPT += CC="$(TARGET_CC) -D__i386__"

What I have in the patch I provided, was tested build-wise on i386 and
x86-64 targets (but the program itself was only tested in 32bit mode).
I tried that Thomas suggested (redefine CFLAGS), it did not work. I
don't see much sense in changing the working command from what is in
my patch.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
