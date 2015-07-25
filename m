From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 25 Jul 2015 15:22:08 +0200
Subject: [Buildroot] [PATCH v7 1/1] rtl8821au: new package
In-Reply-To: <20150725101601.GB3662@free.fr>
References: <1437777122-28383-1-git-send-email-christian@paral.in>
 <20150725101601.GB3662@free.fr>
Message-ID: <55B38D80.9070605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Christian, Luca, All,
>
> Luca, a licensing question for you... ;-)
>
> On 2015-07-24 15:32 -0700, Christian Stewart spake thusly:
>> This patch adds the rtl8821au wifi driver. The driver is sourced from
>> ulli-kroll's work on GitHub, which includes various fixes and better LED
>> handling. Currently USB3 support is broken in this driver - it will
>> only connect to the EHCI controller in a USB3 port.
>>
>> Signed-off-by: Christian Stewart <christian@paral.in>
> [--SNIP--]
[...]
>> --- /dev/null
>> +++ b/package/rtl8821au/rtl8821au.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# rtl8821au
>> +#
>> +################################################################################
>> +
>> +RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
>> +RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
>> +RTL8821AU_CFLAGS_ENDIAN = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
>
> You forgot the licensing information:
>
>      RTL8821AU_LICENSE = GPLv2
>      RTL8821AU_LICENSE_FILES = COPYING
>
> Luca:
>
> Also, two firmware blobs are installed, and we have no licensing info
> for those two; usually it's a proprietary license.
>
> I wonder if/how we can reflect this in the licensing info above.

I can't think of any option other than:

   RTL8821AU_LICENSE = GPLv2, proprietary (firmware blobs)

-- 
Luca
