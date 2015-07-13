From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 13 Jul 2015 15:35:32 -0500
Subject: [Buildroot] [PATCH 1/1] ntfs-3g: fix incorrect comment
	dependency
In-Reply-To: <20150713223221.0693722c@free-electrons.com>
References: <1436819277-48747-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <20150713223221.0693722c@free-electrons.com>
Message-ID: <CAMQcK5KfKK9wOV+wG5NU7=HtP6bUH02yAE6V53W2M0i741+TFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jul 13, 2015 at 3:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ryan Barnett,
>>
>>  comment "ntfs-3g needs a toolchain w/ wchar, threads, dynamic library"
>>       depends on BR2_USE_MMU
>> -     depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS)
>> +     depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS)
>
> I personally prefer:
>
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
>
> I think we do that for most packages, and it's somewhat easier to understand.

OK - I really don't have a preference but I agree for consistency
across buildroot it would be better to change to what you suggested.

I will submit a v2 here.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
