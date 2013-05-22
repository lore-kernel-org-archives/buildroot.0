From: Bryan Hundven <bryanhundven@gmail.com>
Date: Wed, 22 May 2013 00:46:42 -0700
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <20130522094234.59449f3e@skate>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <20130520165204.0269d05a@skate>
 <CADwac6CnLFHP5=yDsnF5xfB4GOMSQsCi3=J2QVPukdy=kTS+QA@mail.gmail.com>
 <20130520192543.3b61d666@skate> <519C636D.9010805@mind.be>
 <20130522090137.721cbaac@skate> <519C6E91.3080905@mind.be>
 <CAJ+oik3VTj=CwO9n1HH5uZmdtcd7aEuk_nsFKeZA2uD7ZzmWug@mail.gmail.com>
 <20130522094234.59449f3e@skate>
Message-ID: <CAJ+oik1Sg5aBvebzkfTV0dLg35i4zJO+m6aL8MtKWQ0FtgpZmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 22, 2013 at 12:42 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bryan Hundven,
>
> On Wed, 22 May 2013 00:29:57 -0700, Bryan Hundven wrote:
>
>> >  Hm. Does dlopen() still work when e.g. libc is linked statically? I guess
>> > not, because the dlopen()en library  would probably need some symbols from
>> > libc. Therefore, packages that dlopen() should depend on
>> > !BR2_PREFER_STATIC_LIB.
>>
>> When implementing static toolchain support in crosstool-ng, I avoided
>> building libc statically like the plague.
>
> With glibc, sure. However, uClibc was, as far as I know, designed from
> the ground up to allow static linking, which is needed for some non-MMU
> platforms.
>
>> But gcc and binutils being built statically for the host was a win.
>> GDB also dislikes being built statically, because of dlopen().
>
> In this case, gdb for the target would have to be
> 'depends on !BR2_PREFER_STATIC_LIB'. I don't believe it's a problem:
> it's unlikely that anyone will want to run a full-blown gdb on a
> non-MMU platform. Non-MMU platform users are reasonable people: they
> use cross-gdb + gdbserver :)

Fair enough. And your right, I think the only problem I had with gdb
was with python support on the target. Just adding my ad-lib. ;)

-Bryan

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
