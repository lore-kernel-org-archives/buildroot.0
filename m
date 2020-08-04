From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Tue, 4 Aug 2020 08:03:49 +0000
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: add dependency to host
 python3
In-Reply-To: <20200804075801.de6wbhgm7a7s36j6@falbala.internal.home.lespocky.de>
References: <20200804071733.114835-1-eugen.hristev@microchip.com>
 <20200804075801.de6wbhgm7a7s36j6@falbala.internal.home.lespocky.de>
Message-ID: <2b25ad5a-f28f-eebe-3db1-de7b395b2c94@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04.08.2020 10:58, Alexander Dahl wrote:

> Hello Eugen,
> 
> On Tue, Aug 04, 2020 at 10:17:33AM +0300, Eugen Hristev wrote:
>> Starting with version 3.9.3, AT91Bootstrap adds dependency for host
>> python3.
>> Python2 was deprecated so moving to Python3.
>> AT91Bootstrap only requires Python3 at boot time, for some scripts that
>> generate specific metadata.
> 
> Did you mean 'build time'?
> 

Yes, sorry, build time. I made a typo/error


> Greets
> Alex
> 
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
>> ---
>>   boot/at91bootstrap3/at91bootstrap3.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
>> index 5cf865c681..a601f35a4b 100644
>> --- a/boot/at91bootstrap3/at91bootstrap3.mk
>> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
>> @@ -6,6 +6,8 @@
>>
>>   AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
>>
>> +AT91BOOTSTRAP3_DEPENDENCIES += host-python3
>> +
>>   ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
>>   AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
>>   AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
>> --
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>   X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
