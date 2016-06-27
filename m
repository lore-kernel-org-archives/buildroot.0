From: Sebastien Van Cauwenberghe <svancau@gmail.com>
Date: Mon, 27 Jun 2016 17:29:41 +0200
Subject: [Buildroot] [PATCH] Add support for Digilent Zybo (Xilinx
 Zynq-7000)
In-Reply-To: <20160627133905.435b0f16@free-electrons.com>
References: <526113c1-b1c6-f391-4c9f-1e84b4f2d6d1@gmail.com>
 <f38581f1-c8ca-d8ac-0630-065bea29dc01@gmail.com>
 <20160627133905.435b0f16@free-electrons.com>
Message-ID: <d176c910-4922-0eb6-e428-77820017dbb3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, list,

>>> Also, why do you use an initramfs for the rootfs rather than the more
>>> traditional ext4 partition next to the FAT partition? This would be the
>>> preferred method for the defconfig in Buildroot.
>>>  
>> I will go to ext4 but (as a beginner), I'll first investigate what is wrong with ext4
>> not booting (maybe mmc/ext4 compiled as a module).
>>
Inadequate bootargs were used, now it works without changing defconfig.

>>>> +There is a patch attached that redefines the U-Boot's environment
>>>> +to work with Buildroot out-of-the-box.  
>>>
>>> Why do you patch the U-Boot built-in environment instead of providing
>>> an uEnv.txt file?
>>>
>> I saw loading uEnv.txt was a board specific stuff and should be subject to patch anyways
>> so I added the environment in there so I can use the board without sd card but with 
>> the flash memory.
> 
> So the default environment is not already loading a uEnv.txt file or
> executing some default script from the MMC ?
> 
> If that's the case, then indeed, you need to patch the default
> environment.
> 
I'll give a try to use uEnv.txt as it's also in the common Zynq configurations.
I just hope it's not loaded too late, otherwise, patch it will be :).

>>>
>>> Can you try to use zImage instead, which is now the standard format on
>>> ARM?
>>>  
>> Apparently the uImage is all I can use easily with the Zynq, maybe with another
>> defconfig in U-boot for this board, I'll be able to use zImages ?
> 
> Hum, you really don't have the "bootz" command in U-Boot? For a modern
> U-Boot, this seems weird.
It's in U-boot but not enabled in the defconfig for this board, so I don't know which
is better, change the defconfig U-boot or just live with the uImage instead of zImage.
Or maybe FIT image ? I just don't know what to use...

Thanks for your time
S?bastien
