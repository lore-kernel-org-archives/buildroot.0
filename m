From: Jan Heylen <heyleke@gmail.com>
Date: Thu, 2 Apr 2015 09:26:36 +0200
Subject: [Buildroot] [PATCH 1/1] elfutils: Add a --{enable,
 disable}-backends option
In-Reply-To: <20150402092305.4778c30b@free-electrons.com>
References: <1427911925-7424-1-git-send-email-heyleke@gmail.com>
 <20150401214323.4e340217@free-electrons.com>
 <CAGszK3hLApL5Pu383ywUppoApVSwZWDp026dZ11_tphCQ3469A@mail.gmail.com>
 <20150402092305.4778c30b@free-electrons.com>
Message-ID: <CAGszK3hnCmo9bxZVpbVJvfRzO=6zENZ=+MRJGf9Frt+q448sDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I immediately consulted the manual, but I admit, I am RTFMed :-s

Jan

On Thu, Apr 2, 2015 at 9:23 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Jan Heylen,
>
> On Thu, 2 Apr 2015 09:12:53 +0200, Jan Heylen wrote:
>
>> > Patches should have a description and a Signed-off-by line.
>> Ah, I didn`t realise that on that level it was required, I'll fix it
>
> Yes, we also require a description + SoB *inside* patches for packages.
> See
> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.
>
>> > Also, could you submit this patch upstream? I'd like to see if upstream
>> > is willing to accept such a patch, since it is more or less a "feature"
>> > patch, and we prefer to not have to carry such patches forever.
>> This is based on 0002-disable-progs.patch, so it belongs in buildroot?
>> I'll try to upstream it to the elfutils package.
>
> Agreed that 0002-disable-progs.patch is basically the same sauce. It
> would be great to upstream these patches.
>
>> > This explanation seems weird: why would you link against libelf and not
>> > use it?
>>
>> The backends are plaform specific implementations, for every supported
>> platform. And, e.g. perf package which sources come with the Linux
>> kernel has a compile time dependency on it.On older kernels (<= 3,7),
>> the perf package requires libelf, from the eflutils package. But for
>> plenty of the features of perf, elfutils backends (libebl) are not
>> required at runtime. As backporting patches for not depending on
>> elfutils for all former kernel version is obviously not the best
>> method, I believe making it possible to not compile/install the
>> backends of libebl in your rootfs is a legitimate option (saves >300K
>> (stripped)).
>
> Ok, understood.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
