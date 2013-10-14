From: Jason Kridner <jkridner@beagleboard.org>
Date: Mon, 14 Oct 2013 15:23:10 -0400
Subject: [Buildroot] [PATCHv3] beaglebone: add BeagleBone Black support
In-Reply-To: <20131014193312.6b20bda3@skate>
References: <1381522187-16334-1-git-send-email-jkridner@beagleboard.org>
 <CACG401qNSaRhMFhhmz3w55So+YT_7e-APcaw-Nwm82sP0muBKA@mail.gmail.com>
 <20131014193312.6b20bda3@skate>
Message-ID: <CA+T6QPmjdeg1b-2EsoJBMWBEsPrar8wZs1GXh09uZAo0hxSvSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 14, 2013 at 1:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Jesse Cobra,
>
> On Mon, 14 Oct 2013 13:29:41 -0400, Jesse Cobra wrote:
>
>> One quick question as the device tree stuff is new to me. Do I need to
>> manually put the correct dtb file for BBB and BB_white respectively on
>> /uSD/boot/*.dtb or does the system have a way to pick the correct dtb file
>> for each platform during boot time?
>>
>> To restate, I cant just put both am335x-bone.dtb & am335x-boneblack.dtb on
>> /boot can I?
>
> All this logic is done by the U-Boot scripts integrated in the U-Boot
> environment, so you'll have to look at these scripts to see which DTB
> they load at boot time. You can of course adjust these scripts to
> ensure they load the right DTB.
>
> Best regards,
>
> Thomas

Jesse,

You'll notice in my commit notes the 'uenvcmd' with 'run findfdt'.
That has the magic to pick out which .dtb to load. If you try it out,
I hope you'll give me a "Tested-by" and help me get this finally
committed. Not sure what else is needed to get this into buildroot.

Regards,
Jason
