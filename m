From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Feb 2015 16:18:59 +0100
Subject: [Buildroot] [PATCH for next 1/2] toolchain-external: improve
 lib subdirectory matching
In-Reply-To: <20150217112622.GF2302@tarshish>
References: <1424098379-8320-1-git-send-email-patrickdepinguin@gmail.com>
 <1424098379-8320-2-git-send-email-patrickdepinguin@gmail.com>
 <20150217112622.GF2302@tarshish>
Message-ID: <CAAXf6LUZ1kC483yABt9ffq6d=GW1yNTRftuOH50GYD=1dMzpgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, Feb 17, 2015 at 12:26 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas,
>
> On Mon, Feb 16, 2015 at 03:52:58PM +0100, Thomas De Schampheleire wrote:
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index 999a354..e05957c 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -434,13 +434,13 @@ endef
>>
>>  # Returns the sysroot location for the given compiler + flags
>>  define toolchain_find_sysroot
>> -$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?/([^/]*/)?libc\.a::')
>> +$$(echo -n $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
>>  endef
>
> Not directly related to this patch, but the reason we use this convoluted way
> to find sysroot (instead of just -print-sysroot) is to support toolchains
> older than 4.4. Can we get rid of this as part of removing support for AVR32?

What do you mean with '4.4', gcc version 4.4?
In this case I would answer no, because toolchains using gcc older
than 4.4 are still commonly used by buildroot users (at least in my
case), so not supporting them anymore does not seem good.

Best regards,
Thomas
