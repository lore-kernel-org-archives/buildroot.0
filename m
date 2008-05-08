From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 8 May 2008 15:16:29 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmellinux
In-Reply-To: <004401c8b130$9f5fc760$dfc4af0a@Glamdring>
References: <20080416224548.D5D8F3C617@busybox.net>
	<d6cda7730805080743v4a298223m5ed424b4ee6c80a4@mail.gmail.com>
	<004401c8b130$9f5fc760$dfc4af0a@Glamdring>
Message-ID: <d6cda7730805081116s4c3424e0yf1e468a72888bdde@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It would still be possible to do that by choosing the custom config.

You might have your reasons to want names with timestaps, but for most
of us, it's nor required or desired. Forcing your way on everyone
isn't quite the best approach.

As I've said before, changing the kernel name every time I build
requires me to change u-boot, others will have to change their grub
config, or what ever bootloader they use.


On Thu, May 8, 2008 at 2:22 PM, Ulf Samuelsson <ulf@atmel.com> wrote:
>
>
>>> @@ -153,29 +149,16 @@
>>>  # BZIMAGE
>>>  ifeq ($(LINUX26_FORMAT),bzImage)
>>>  LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
>>> -KERNEL_EXT:=
>>> +KERNEL_EXT:=.bz
>>>  endif
>>
>> I have never seen any distro doing this. Why?
>>
>>>  #
>>> -----------------------------------------------------------------------------
>>>  # File name for the Linux kernel binary
>>> -ifeq ($(LINUX26_FORMAT),uImage)
>>> -LINUX26_KERNEL_NAME:="uImage"
>>> -endif
>>> -ifeq ($(LINUX26_FORMAT),bzImage)
>>> -LINUX26_KERNEL_NAME:="bzImage"
>>> -endif
>>> -ifeq ($(LINUX26_FORMAT),vmlinux)
>>> -LINUX26_KERNEL_NAME:="vmlinux"
>>> -endif
>>> -ifeq ($(LINUX26_FORMAT),zImage)
>>> -LINUX26_KERNEL_NAME:="zImage"
>>> -endif
>>> -ifeq ($(LINUX26_FORMAT),custom)
>>>
>>>
>>> LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
>>> -endif
>>
>> Why on Earth did you remove John's changes from May 6?
>
> One of the reasons I had to create the advanced linux configuration in
> buildroot
> was that I wanted to be able to store multiple kernel images in the same
> directory.
> John's patch makes this impossible and also makes the image name
> incompatible
> with the automatically generated scripts which downloads the kernel to the
> target.
>
> $(BOARD_NAME) needs to be changed to $(PROJECT) though.
>
> Best Regards
> Ulf Samuelsson
>
>
