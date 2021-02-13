From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Feb 2021 13:46:14 +0100
Subject: [Buildroot] [PATCH 1/3] package/wpa_supplicant: Fix options to
 actually disable features.
In-Reply-To: <20210210185017.6133-1-nicolas.cavallari@green-communications.fr>
References: <20210210185017.6133-1-nicolas.cavallari@green-communications.fr>
Message-ID: <c060de3b-d436-4f61-4ef6-76537b9ddb17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/02/2021 19:50, Nicolas Cavallari wrote:
[snip]
>  
> -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
> -WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_HS20 \
> +ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
 Actually, we prefer to "ifeq" way of writing this condition:

ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),)


 I've fixed all occurrences of that, I've also rewrapped the multiline
assignments, and I've extended the commit message of the first patch a little.
With all that, applied to next, thanks!

 Regards,
 Arnout

[snip]
