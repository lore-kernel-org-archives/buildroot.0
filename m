From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 23 Mar 2015 10:43:51 +0800
Subject: [Buildroot] [PATCH 1/2] bfin: remove the dependency of flat
 shared mode to shared library
In-Reply-To: <20150320224508.73c0c84b@free-electrons.com>
References: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
 <20150320224508.73c0c84b@free-electrons.com>
Message-ID: <CAJxxZ0OGa0OcPUXSJapo51ft0juQVWPYOJxM5Xx0aTCxFriVqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Mar 21, 2015 at 5:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Wed, 18 Mar 2015 16:59:15 +0800, Sonic Zhang wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Blackfin flat shared library isn't generated and linked in the same way
>> as the ELF shared library. So, don't mark it depend on the static library
>> only.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>>  arch/Config.in |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/Config.in b/arch/Config.in
>> index 16ad8be..6179960 100644
>> --- a/arch/Config.in
>> +++ b/arch/Config.in
>> @@ -295,7 +295,6 @@ config BR2_BINFMT_FLAT_SEP_DATA
>>
>>  config BR2_BINFMT_FLAT_SHARED
>>       bool "Shared binary"
>> -     select BR2_BINFMT_SUPPORTS_SHARED
>
> If you don't select BR2_BINFMT_SUPPORTS_SHARED, then the only available
> option amongst: static libs, static libs + shared libs, shared libs is
> "static libs", which means that the "-static" flag is always passed. If
> that's OK, then I'm fine with the patch.
>
Yes, -static is OK in the link flag for FLAT shared mode.

> The second sentence of your commit log is confusing however. You say
> "don't mark it depend on the static library only". But it is exactly
> what your patch is doing: since it's no longer select
> BR2_BINFMT_SUPPORTS_SHARED, it means that after your patch is applied,
> when BR2_BINFMT_FLAT_SHARED is used, the *only* possibility is static
> library only.

Sorry for the typo error. Should be "mark it depend on the static
library only"".

Regards,

Sonic
