From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Jun 2015 18:36:50 -0300
Subject: [Buildroot] [PATCH] configs/acmesystems_aria_g25: new config
In-Reply-To: <20150629221332.30296de3@free-electrons.com>
References: <1435595496-8627-1-git-send-email-gustavo@zacarias.com.ar>
 <20150629221332.30296de3@free-electrons.com>
Message-ID: <5591BA72.2040903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/15 17:13, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
>
> On Mon, 29 Jun 2015 13:31:36 -0300, Gustavo Zacarias wrote:
>
>> diff --git a/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config b/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
>> new file mode 100644
>> index 0000000..f4c12a7
>> --- /dev/null
>> +++ b/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
>> @@ -0,0 +1,9 @@
>> +CONFIG_AT91SAM9X5_ARIA=y
>> +CONFIG_BUS_SPEED_100MHZ=y
>> +CONFIG_RAM_128MB=y
>
> So, 128 MB ?
>
>> +CONFIG_SDCARD=y
>> +CONFIG_LOAD_LINUX=y
>> +CONFIG_LINUX_ZIMAGE=y
>> +CONFIG_LINUX_KERNEL_ARG_STRING="mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
>
> Or 256 MB ?

Ouch, i'll send V2 with two configs (got 256MB hardware here, with the 
128MB config the memory is reduced as expected).

> Also, could you review the patch from Angelo adding support for another
> board from ACME:
>
>    http://patchwork.ozlabs.org/patch/485319/

The Arietta is a stripped down Aria, i'll take a look but i have no way 
of testing it since i don't have one.
Having get that out of the way, it'll probably work just fine on the 
Aria i think.
Regards.
