From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Thu, 16 Oct 2014 12:57:54 +0200
Subject: [Buildroot] [PATCH v2 8/8] package/mpd: fix zeroconf support
In-Reply-To: <20141016115003.43eceeab@free-electrons.com>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>	<1413379134-28918-8-git-send-email-jkrause@posteo.de>
 <20141016115003.43eceeab@free-electrons.com>
Message-ID: <543FA4B2.5030102@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/16/2014 11:50 AM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Wed, 15 Oct 2014 15:18:54 +0200, J?rg Krause wrote:
>
>>   # Some options need an explicit --disable or --enable
>> -ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
>> +
>> +# Zeroconf support depends on libdns_sd from avahi.
>> +ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
>>   MPD_DEPENDENCIES += avahi
>>   else
>>   MPD_CONF_OPTS += --with-zeroconf=no
> It doesn't seem really obvious for the user that
> BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY should be enabled to get avahi
> support in mpd. So, in such situations, I would suggest to add a
> Config.in option to explicitly enable the Avahi support in mpd:
>
> config BR2_PACKAGE_MPD_AVAHI_SUPPORT
> 	bool "avahi support"
> 	depends on ... # all the dependencies of avahi
> 	select BR2_PACKAGE_AVAHI
> 	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
> 	help
> 	  Some help text

Looks good!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141016/a1d76809/attachment-0001.html>
