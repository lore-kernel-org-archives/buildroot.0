From: David Picard <dplamp@gmx.com>
Date: Wed, 9 Jan 2019 09:00:32 +0100
Subject: [Buildroot] linux-firmware package : files not copied to
 TARGET_DIR
In-Reply-To: <20190108153907.2b18149f@windsurf>
References: <c5319275-53e0-f7df-3fdb-a9699160bd1f@gmx.com>
 <20190108134921.26e793a6@windsurf>
 <6de3a002-7c43-9658-507b-5a44f57386d0@gmx.com>
 <20190108153907.2b18149f@windsurf>
Message-ID: <402abc51-ddd3-b3ec-206f-5960e9249f54@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, if I can solve the issue with my video driver, I'll certainly do it.

Le 08/01/2019 ? 15:39, Thomas Petazzoni a ?crit?:
> Hello,
>
> On Tue, 8 Jan 2019 14:17:24 +0100, David Picard wrote:
>
>> I am using the CONFIG_E100 kernel driver, which needs
>> e100/d102e_ucode.bin from package linux-firmware for chipset Intel
>> 82551IT Fast Ethernet Controller.
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/e100
>>
>> I selected BR2_PACKAGE_LINUX_FIRMWARE in Buildroot, but none of the
>> options in the submenu. The file I need is actually present in the
>> package build directory, but is not installed.
> Well, if you don't enable any of the options in the linux-firmware
> submenu, then no firmware gets installed.
>
>> I was thinking of making a custom patch for linux-firmware.mk to copy
>> just the one file I need. What do you think ?
> That's what you need to do: add an option in
> package/linux-firmware/Config.in for your firmware, and add the
> necessary code in package/linux-firmware/linux-firmware.mk to add the
> firmware to the LINUX_FIRMWARE_FILES variable when the option is
> enabled. Don't forget to update LINUX_FIRMWARE_ALL_LICENSE_FILES
> accordingly if needed. And to submit the resulting patch!
>
> Best regards,
>
> Thomas
