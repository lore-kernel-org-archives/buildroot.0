From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Jun 2015 15:32:36 +0200
Subject: [Buildroot] [PATCH 1/4] defconfig for warpboard
In-Reply-To: <20150621005619.GC23827@arthur-debian>
References: <1434727794-9419-1-git-send-email-lambertarthur22@gmail.com>
 <55848E49.1030304@mind.be> <20150621005619.GC23827@arthur-debian>
Message-ID: <5586BCF4.4070405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/21/15 02:56, Arthur LAMBERT wrote:
> Le Friday 19 Jun 2015 ?? 23:48:57 (+0200), Arnout Vandecappelle a ?crit :
>> On 06/19/15 17:29, Arthur LAMBERT wrote:
[snip]
>>> +BR2_LINUX_KERNEL_PATCH="board/freescale/warpboard/linux/"
>>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/warpboard/linux-4.0.config"
>>
>>  You forgot to include this file in the patch. Please make sure that it's a
>> defconfig, not a full config.
>>
> 
> This file is present later in a different email.
> git send email command send a mail per commit. Do I use the good process to provide my patch ? Do you prefer to put all the patch in the same email ?

 Yes, you should use 'git rebase -i origin/master' to rebase your changes on top
of the buildroot master, and then squash everything into a single commit. For
this case, I don't see a reason to split it into separate commits.

 Remember to add a changelog to the commit message, like so:

...
Signed-off-by: ...
---
Changes v2: ....


[snip]

>>  We also usually add a readme.txt file with an explanation of how to put
>> everything on an SD card.
>>
> 
> There is no sdcard port available on warpboard. The only way to flash it is to used dfu/imx_usb_loader.
> But you right, I will add in a README a process to flash the board.

 In that case, it's definitely important to have a readme file. And you probably
also want to add BR2_PACKAGE_HOST_IMX_USB_LOADER=y to the defconfig.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
