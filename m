From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 24 Nov 2020 15:46:15 +0100
Subject: [Buildroot] [PATCH v4 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <CA+h8R2pOAr8qXM23Na9KeB+a-vLyY2QaM21dK114DUfM7SAVOQ@mail.gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-4-christian@paral.in>
 <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
 <CA+h8R2pOAr8qXM23Na9KeB+a-vLyY2QaM21dK114DUfM7SAVOQ@mail.gmail.com>
Message-ID: <df06db36-3e78-9303-e811-bdc1c5cf095a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 24/11/2020 ? 00:07, Christian Stewart a ?crit?:
> Hi Romain,
> 
> On Thu, Nov 19, 2020 at 5:40 AM Romain Naour <romain.naour@smile.fr> wrote:
>>> +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
>>> +BR2_TOOLCHAIN_BUILDROOT=y
>>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>>> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>>> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>>> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>>> +BR2_BINUTILS_VERSION_2_32_X=y
>>> +BR2_GCC_VERSION_7_X=y
>>
>> This means that you are not working on Buildroot master because gcc 7 has been
>> removed already.
>>
>> This is anoying... either the latest NVIDIA SDK (jetpack 4.4.1) is already out
>> of date because it require an old gcc version or gcc is moving too fast for such
>> sdk.
> 
> I have tested this against GCC 8 and Buildroot 2020.08.x:
> 
> BR2_TOOLCHAIN_BUILDROOT=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_BINUTILS_VERSION_2_32_X=y
> BR2_GCC_VERSION_8_X=y
> BR2_USE_MMU=y
> 
> ... and all works fine. Why do you think it won't work with GCC 8?

Cuda libraries requires a specific gcc version, see the tegra-demo-distro layer
[1]. I guess nivida only use gcc 7 (or maybe gcc 8) because they are using
ubuntu on this platform.

Also, the kernel you use come from github OE4T [2] where ~20 kernel patches have
been backported to fix gcc >= 8 issues. But this is not really the kernel from
Nvidia SDK.

I understand that the nvidia sdk is difficult to package into Buildroot or
Yocto. My review is absolutely not a no-go for merging this BSP. You did a great
job since you're able to use it with Buildroot :)

[1]
https://github.com/OE4T/tegra-demo-distro/blob/master/layers/meta-tegrademo/conf/distro/tegrademo.conf#L58
[2] https://github.com/OE4T/linux-tegra-4.9

Best regards,
Romain

> 
> Best,
> Christian
> 
