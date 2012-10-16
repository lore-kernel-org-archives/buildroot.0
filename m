From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 17 Oct 2012 01:57:27 +0300
Subject: [Buildroot] [PATCH] macchanger: new package
In-Reply-To: <507DAD97.6090003@mind.be>
References: <1350412488-17233-1-git-send-email-spdawson@gmail.com>
 <507DAD97.6090003@mind.be>
Message-ID: <507DE657.1010409@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

16.10.2012 21:55, Arnout Vandecappelle kirjoitti:
> On 16/10/12 20:34, spdawson at gmail.com wrote:
>> From: Simon Dawson<spdawson@gmail.com>
>>
>> Signed-off-by: Simon Dawson<spdawson@gmail.com>
> [snip]
>> diff --git a/package/macchanger/Config.in b/package/macchanger/Config.in
>> new file mode 100644
>> index 0000000..e26faa7
>> --- /dev/null
>> +++ b/package/macchanger/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_MACCHANGER
>> +    bool "macchanger"
>> +    help
>> +      A GNU/Linux utility for viewing/manipulating the MAC address of
>> +      network interfaces
>> +
>> +      http://www.alobbs.com/macchanger
>
>  Just for my info, what does this do that 'ip link set address
> xx:xx:xx:xx:xx:xx'
> doesn't?
>

Not much.

Besides setting MAC address to some specific value, it will let you to
autogenerate random
MAC address from within same device vendor, same physical device
category or completely random, bogust
MAC address.

So if you need to spoof MAC address when using aircrack-ng (which BTW, i
have as buildroot package here) or some
similar cracking tool then this might come handy.

But then again, and like you noted, there are already zillion of other
ways to change NIC MAC address ...

Best regards
Stefan

>> diff --git a/package/macchanger/macchanger.mk
>> b/package/macchanger/macchanger.mk
>> new file mode 100644
>> index 0000000..b1b9fff
>> --- /dev/null
>> +++ b/package/macchanger/macchanger.mk
>> @@ -0,0 +1,11 @@
>> +#############################################################
>> +#
>> +# macchanger
>> +#
>> +#############################################################
>> +MACCHANGER_VERSION = 1.5.0
>> +MACCHANGER_SITE = ftp://ftp.gnu.org/gnu/macchanger
>
> MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger
>
>  With this amendment:
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  (build-test with a WCHAR-only internal powerpc toolchain)
>
>> +MACCHANGER_LICENSE = GPLv2
>> +MACCHANGER_LICENSE_FILES = COPYING
>> +
>> +$(eval $(autotools-package))
