From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 17 Jul 2015 10:00:15 +0200
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: Have Hotspot 2.0 depend
 on nl80211
In-Reply-To: <20150717094532.0e40060c@free-electrons.com>
References: <20150713112947.7e14fd64@free-electrons.com>	<1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>	<1437051754-24060-2-git-send-email-nicolas.cavallari@green-communications.fr>	<20150717064101.GE3147@tarshish>
 <20150717094532.0e40060c@free-electrons.com>
Message-ID: <55A8B60F.2070200@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/07/2015 09:45, Thomas Petazzoni wrote:
> On Fri, 17 Jul 2015 09:41:01 +0300, Baruch Siach wrote:
>>>  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
>>>  	bool "Enable HS20"
>>> +	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
>>
>> Please add the BR2_PACKAGE_LIBNL dependency here as well.
> 
> Not needed since it's a "depends on", so
> BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT will anyway only be visible if
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is enabled, and if
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is enabled, then it has selected
> BR2_PACKAGE_LIBNL.
> 
> Am I missing something?

I was thinking the same thing.
