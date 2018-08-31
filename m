From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Fri, 31 Aug 2018 17:00:52 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <20180814224717.02d57e06@windsurf>
References: <20180726171524.479-1-m.niestroj@grinn-global.com>
 <20180814224717.02d57e06@windsurf>
Message-ID: <875zzqfumz.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> <snip>
>
> I have added a reference to the Buildroot bug report being fixed by
> this, and I've applied to master.
>
> Two questions:
>
>  (1) Could you try to push this forward in terms of upstreaming
>      acceptance ? I know you have submitted the patch, but I looked
>      today and apparently you haven't received any feedback.

I was not available to do it earlier. I will take care of pushing it
forward.

>
>  (2) It would be nicer if the availability of symbol versioning could
>      be auto-detected. Is there a compile-time test that can be done to
>      verify if symbol versioning is available ? This would perhaps help
>      make the patch even more acceptable upstream.

Unfortunately I don't know how to check that. Symbol versioning is
something that runtime linker is aware of (glibc) or not (uclibc). So in
case of cross-compiling we are not able to check if library loads
properly. I have also not found any flags in libc libraries that
enable/disable symbol versioning, so external compiled against them
would know if that is supported.

For glibc and uclibc we could write some logic around __GLIBC__ and
__UCLIBC__ macros, but musl on the other hand does not allow to detect
it with any macro (which is done on purpose in musl).

>
> Thanks!
>
> Thomas

-- 
Regards,
Marcin
