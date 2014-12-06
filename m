From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 6 Dec 2014 16:24:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: need dynamic library
	support
In-Reply-To: <20141206161900.77525f04@free-electrons.com>
References: <1417871738-13421-1-git-send-email-s.martin49@gmail.com>
 <1417871738-13421-2-git-send-email-s.martin49@gmail.com>
 <20141206161900.77525f04@free-electrons.com>
Message-ID: <CAHXCMMJRb4sTn8ym+ctc3FTWMj8ZAwaaN0iwuP2i=ahNUTe1_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 6, 2014 at 4:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sat,  6 Dec 2014 14:15:38 +0100, Samuel Martin wrote:
>> Fixes:
>>   http://autobuild.buildroot.net/results/e01733c4b8c23f62e2081f0c4aadc16e22c4a2c4/
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/libnss/Config.in | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/libnss/Config.in b/package/libnss/Config.in
>> index 690f928..d57c7a2 100644
>> --- a/package/libnss/Config.in
>> +++ b/package/libnss/Config.in
>> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBNSS
>>       depends on BR2_LARGEFILE
>>       depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
>>       depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
>> +     depends on !BR2_PREFER_STATIC_LIB
>
> What about the reverse dependencies, such as ecryptfs-utils?

oops! I missed that. I'll respin the patch

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Samuel
