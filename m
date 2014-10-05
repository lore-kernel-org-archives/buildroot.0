From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 5 Oct 2014 19:31:34 +0200
Subject: [Buildroot] [PATCH] libbsd: Add missing arch
In-Reply-To: <20141005192904.5ced946e@free-electrons.com>
References: <1412529445-5931-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141005192904.5ced946e@free-electrons.com>
Message-ID: <CAGduivyVA3ZBfHeiYCZWJ4MzSpC1O3NFo8+2sRz3Vx8DoBCV1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Sun, Oct 5, 2014 at 7:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun,  5 Oct 2014 19:17:25 +0200, Maxime Hadjinlian wrote:
>> Match the list of architecture to the comments above.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  package/libbsd/Config.in | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
>> index e22226a..470d6e5 100644
>> --- a/package/libbsd/Config.in
>> +++ b/package/libbsd/Config.in
>> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBBSD
>>       bool "libbsd"
>>       # libbsd requires a.out.h, which is only available for those
>>       # architectures: arm, m68k, x86 (and alpha, but we don't care.)
>> -     depends on ( BR2_i386 || BR2_x86_64 )
>> +     depends on ( BR2_i386 || BR2_x86_64 || BR2_arm || BR2_m68k)
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>>       depends on BR2_TOOLCHAIN_USES_GLIBC
>>       help
>> @@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBBSD
>>         http://libbsd.freedesktop.org/
>>
>>  comment "libbsd needs an (e)glibc toolchain w/ threads"
>> -     depends on ( BR2_i386 || BR2_x86_64 )
>> +     depends on ( BR2_i386 || BR2_x86_64 || BR2_arm || BR2_m68k)
>>       depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
>
> Does it actually work on m68k ?
>
> m68k is marked broken in Buildroot, so for the time being, I'm not sure
> we care that much about libbsd on m68k, do we?
>
> I know Waldemar is doing some m68k work, hopefully he'll have some
> patches at some point to re-enable m68k in Buildroot.
I honestly don't know, I trusted the comments. Do you want me to
remove it for the time being ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
