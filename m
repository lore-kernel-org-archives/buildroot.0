From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Sat, 13 Feb 2021 13:42:26 +0100
Subject: [Buildroot] [PATCH 2/3] package/wpa_supplicant: Add options to
 disable more features.
In-Reply-To: <c6237102-2340-0536-8fba-424b3d832401@mind.be>
References: <20210210185017.6133-1-nicolas.cavallari@green-communications.fr>
 <20210210185017.6133-2-nicolas.cavallari@green-communications.fr>
 <c6237102-2340-0536-8fba-424b3d832401@mind.be>
Message-ID: <e7f67b95-20f4-b1e7-2173-f422ace8a0f9@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/2021 13:21, Arnout Vandecappelle wrote:
> 
> 
> On 10/02/2021 19:50, Nicolas Cavallari wrote:
> [snip]
>> +config BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
>> +	bool "Enable the Unix-socket control interface"
>> +	help
>> +	  Enable support for the Unix-socket-based API.
>> +
> 
>   I'm surprised that the control interface makes that much of a difference...
> AFAIK it's just a single file, no?

Yes, a single 11 KLOC file :)
And some ap commands are factored between wpasupplicant and hostapd, so 
you can add another KLOC if AP support is enabled. The increase is 
mostly multiplicative with the other options...

> 
> [snip]
>> +ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
>> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_WIRED \
> 
>   This should be written as:
> 
> WPA_SUPPLICANT_CONFIG_DISABLE += \
> 	CONFIG_DRIVER_WIRED \
> 
>   The file contains both styles, but I think we prefer the one-option-per-line
> style for new code.

Will send a new patch monday anyway, because 1/3 exposes build failures 
due to missing options dependencies
