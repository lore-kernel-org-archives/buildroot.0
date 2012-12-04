From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 4 Dec 2012 14:43:06 -0200
Subject: [Buildroot] Qt library difference between E.so and just .so
In-Reply-To: <CADKZYY+KTeh1qdbnzzj1th=n5TrwuzT+2RhvxzaK6-Wp8JN88w@mail.gmail.com>
References: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
 <CAExDhvZF6ZwmdpdWdgcmPp-pHFHkKZtT9SFeS1fC9W1qekxmjA@mail.gmail.com>
 <CADKZYY+KTeh1qdbnzzj1th=n5TrwuzT+2RhvxzaK6-Wp8JN88w@mail.gmail.com>
Message-ID: <CAExDhvYjO4Aa5Jupd98wVMG+4tXhNznTi2C6zzyr43AEWY4jsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Dec 1, 2012 at 11:44 PM, Santhosh Ramani <srcoolz@gmail.com> wrote:
> Hello Thiago,
>
> Thanks a lot for your response, I thought about it too. I actually changed
> the qk.mk to copy all the E version files, instead to see if the the example
> would run, and then I got this error:
>
> error while loading shared libraries: libgthread-2.0.so.0: cannot open
> shared object file: No such file or directory
>
> Any pointers on this one??

I guess you mean you changed it to copy the binaries from TI SDK?
Other system libraries won't match, such libgthread in this case.

> Also I'm thinking when I compile my Qt applications, I'm gonna use the new
> 4.8.2 library so that the applications don't use the TI version. Would this
> approach work?
>

Yeah, assuming TI didn't have to change Qt itself, a simple rebuild
using buildroot should work. Actually this has more chances of working
then transfering the binaries.

Kind Regards,
     Thiago A. Correa
