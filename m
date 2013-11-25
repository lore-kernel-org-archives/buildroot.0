From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Nov 2013 10:25:13 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-22
In-Reply-To: <20131123201745.GA3927@tarshish>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
 <20131123201745.GA3927@tarshish>
Message-ID: <CAAXf6LVd6RsHBkMdBkVFB-=gmrG7LdUTGOYGviwAW6r-hGFmFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 23, 2013 at 9:17 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas,
>
> On Sat, Nov 23, 2013 at 02:11:43PM +0100, Thomas De Schampheleire wrote:
>> On Sat, Nov 23, 2013 at 8:30 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Build statistics for 2013-11-22
>> > ===============================
>> >
>> >         success : 68
>> >        failures : 34
>> >        timeouts : 0
>> >           TOTAL : 102
>> >
>> [..]
>>
>> >       sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/8dc9bca5969d455cc30206fc1ae6e1d3ba6eb6ca/
>>
>> Error is:
>>
>> In file included from src/FPEnvironment_C99.cpp:37:0,
>>                  from src/FPEnvironment.cpp:48:
>> include/Poco/FPEnvironment_C99.h:56:30: error: 'FE_DOWNWARD' was not
>> declared in this scope
>> include/Poco/FPEnvironment_C99.h:57:30: error: 'FE_UPWARD' was not
>> declared in this scope
>> make[2]: *** [/home/test/test/2/output/build/poco-1.4.6p1/Foundation/obj/Linux/sh4a/release_shared/FPEnvironment.o]
>> Error 1
>> make[2]: Leaving directory
>> `/home/test/test/2/output/build/poco-1.4.6p1/Foundation'
>> make[1]: *** [Foundation-libexec] Error 2
>> make[1]: Leaving directory `/home/test/test/2/output/build/poco-1.4.6p1'
>> make: *** [/home/test/test/2/output/build/poco-1.4.6p1/.stamp_built] Error 2
>>
>> The same build failure has been discussed a long time ago here:
>> http://lists.busybox.net/pipermail/buildroot/2011-September/046013.html
>> when the poco package was introduced. Then, the fpenvironment was
>> disabled when the C library is uclibc.
>> In the current failure, the C library seems to be glibc.
>> I'm including Baruch on this one, who was involved in the above
>> thread. Baruch: any idea?
>
> I see the following comment in glibc sysdeps/sh/sh4/fpu/bits/fenv.h:
>
> /* The SH FPU supports two of the four defined rounding modes: round to nearest
>    and round to zero.  We use again the bit positions in the FPU control word
>    as the values for the appropriate macros.  */
>
> I don't know enough about fenv to know what the right solution here would be.
> The easiest one is to add --no-fpenvironment for sh4a. Is this acceptable?

I couldn't tell you. We already pass this option in one situation, at
first sight it would be acceptable to pass it in another.

Best regards,
Thomas
