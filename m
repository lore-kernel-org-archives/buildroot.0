From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2012 11:45:51 -0300
Subject: [Buildroot] [RFC] Firmware handling in BR
In-Reply-To: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
References: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <762cdfbf5b114b07f588cf658d200d46@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-01-24 11:12, yegorslists at googlemail.com wrote:

> So I made the first attempt to add binary firmware images to BR. I
> placed the stuff under "Hardware handling" in the configuration menu,
> but I think it would be better to place this menu direct under
> "Package selection for the target".

Rename it to linux-firmware to match upstream?
"firmware" sounds too generic and other sources for firmware != 
linux-firmware could be added in the future.
Also making options somewhat more granular would be nice, as in the 
different devices for Realtek/TI firmwares being selected to avoid bloat 
in the target.
Just add up the common and known ones for an embedded target, for 
instance the qlogic FC firmwares are probably not that interesting for 
buildroot users.

> Some more issues:
>
> 1. at the time firmware script creates /lib/firmware folder itself:
> should it be included in skeleton?

Yeah i'd go for the skeleton for the reason stated above (other 
firmwares).

> 2. /lib/firmware will be used by firmware package and by udev at
> build/config time: should we introduce a env variable for this?

I'd say we keep it hardcoded to /lib/firmware for now which is the 
expected/standard directory.
If the need arises it could be revised later.
Regards.
