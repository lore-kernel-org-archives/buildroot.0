From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 00:58:32 +0300
Subject: [Buildroot] svn At revision 20289 breakage
In-Reply-To: <0c5901c811c6$8aecca30$01c4af0a@Glamdring>
References: <4717A47F.4000908@asist.si> <4717C93A.3080401@promwad.com>
	<0c3501c811c4$63522850$01c4af0a@Glamdring>
	<4717D0BA.1050300@promwad.com>
	<0c5901c811c6$8aecca30$01c4af0a@Glamdring>
Message-ID: <4717D708.3040902@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>>> Key question:
>>>
>>> What does
>>>
>>> $ cp a
>>>
>>> do?
>>>
>>> Best Regards
>>> Ulf Samuelsson
>>>
>> target/linux/Makefile.in : line 148
>>
>> $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
>>        cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
>>        $(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
>>
>>
>> and LINUX26_KCONFIG is "" because BR2_PACKAGE_LINUX_KCONFIG=""
>>
>>
> 
> Gotcha!
> 
> Why not try the "Advanced Linux configuration" recently added
> This should allow you to do "make xconfig" to create the needed file.
> 
> 
>> BR,
>> Ivan
>>
> 
> 
> Best Regards
> Ulf Samuelsson
> 

That's because I have generic arm .config:

BR2_arm=y
BR2_arm920t=y

BR2_ARM_TYPE="ARM920T"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"

BR2_KERNEL_HEADERS_2_6_22=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.22.9"

# BR2_KERNEL_none is not set
BR2_KERNEL_LINUX=y
# BR2_KERNEL_HURD is not set
# BR2_PACKAGE_LINUX is not set

And it was always building OK without any creation of .config for kernel.
Seems some defconfig for arm920t was broken/changed.


BR,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
