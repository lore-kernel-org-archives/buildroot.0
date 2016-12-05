From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 4 Dec 2016 19:29:44 -0800
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-12-02
In-Reply-To: <20161204151145.0a309442@free-electrons.com>
References: <20161203073024.3586721D20@mail.free-electrons.com>
 <20161203233249.08ff4c7b@gmx.net> <20161204151145.0a309442@free-electrons.com>
Message-ID: <CAMo8BfLA_AhbWe7dkGXCAUompw4aJyCpPBDjFGgw1GfW+DNB7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 4, 2016 at 6:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Adding in Cc: Waldemar for Microblaze, and Max for Xtensa.
>
> On Sat, 3 Dec 2016 23:32:49 +0100, Peter Seiderer wrote:
>
>> +#if defined(__alpha__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__mips__) || defined(__sh__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64)
>> +#  define GST_HAVE_UNALIGNED_ACCESS 0
>> +#elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64)
>> +#  define GST_HAVE_UNALIGNED_ACCESS 1
>> +#else
>> +#  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
>> +#endif
>>
>> Time to add defines for microblazeel and xtensa, any hint which defines and at
>> unaligned acess yes/no?

For xtensa it would be __xtensa__, but there's currently no easy way to tell
if the core supports unaligned access or not, so should default to "no".

> Do you think there would be a problem to simply assume by default that
> the architecture doesn't support unaligned accesses? I mean, if a new
> architecture by chance supports unaligned accesses, but we tell
> GStreamer that we don't support such unaligned accesses, what can go
> wrong? Possibly the code is slightly less efficient, but there should
> be no runtime issue.
>
> So what about instead doing:
>
> #if defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64)
> #  define GST_HAVE_UNALIGNED_ACCESS 1
> #else
> #  define GST_HAVE_UNALIGNED_ACCESS 0
> #endif
>
> and be done with it?

+1 to this.

-- 
Thanks.
-- Max
