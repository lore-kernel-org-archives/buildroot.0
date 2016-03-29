From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 Mar 2016 16:12:36 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <127322ee36893ff22f57884a111b3434@idefix.lespocky.dyndns.org>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
 <127322ee36893ff22f57884a111b3434@idefix.lespocky.dyndns.org>
Message-ID: <56FA8D54.2050605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei Alexander,

thanks for your review! See below by replies.

However, when replying to a mail on the mailing list, please reply to
all. This helps involved people to follow the discussion. Typically an
e-mail sent directly is seen sooner that one on a mailing list only.

On 29/03/2016 13:30, Alexander Dahl wrote:
> Hei hei,
> 
> Am 2016-03-29 00:08, schrieb Luca Ceresoli:
>> The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
>> instantiate a console on tty1, which appears on HDMI. Add a console on
>> the serial port (ttyAMA0) to be more consistent with other defconfigs
>> and provide a better out-of-the-box experience to users used to have a
>> serial console from Buildroot defconfigs.
> 
> I ran in the very problem last week. So +1 for the idea.
> 
>> This requires two changes:
>>  1. have two 'console=' entries in the kernel command line;
>>  2. add a new getty process to the generated inittab.
> 
> Then why not split up those two changes in two patches? ;-)

Because change 1 alone is almost useless. It just outputs kernel booting
and early init messages on UART, but no console. I see adding a UART
console as a self-contained change, but of course that's only my opinion.

> 
>> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> 
> +1
> 
>> diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
>> index 38aa3782621b..155a54693bff 100644
>> --- a/package/rpi-firmware/cmdline.txt
>> +++ b/package/rpi-firmware/cmdline.txt
>> @@ -1 +1 @@
>> -root=/dev/mmcblk0p2 rootwait
>> +root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
> 
> +1
> 
> Not sure about the post build script though, maybe someone with more
> experience in buildroot could comment on that.

That's OK if you don't feel confident enough to give your official
Acked-by or Reviewed-by tag. Still, you can test the patch on a real
board and report back the outcome. If it works, you can add your
Tested-by tag. Otherwise, please report what went wrong. More details on:

http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

Cheers,
-- 
Luca
