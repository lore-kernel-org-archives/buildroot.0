From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 5 Nov 2020 07:26:41 +0100
Subject: [Buildroot] [PATCH] package/lzma-alone: new package
In-Reply-To: <df98e4e7-163c-bdd3-04a9-ef88bd166e70@gmail.com>
References: <20201026213433.4309-1-zajec5@gmail.com>
 <20201027101855.6e23b1ca@windsurf.home>
 <df98e4e7-163c-bdd3-04a9-ef88bd166e70@gmail.com>
Message-ID: <e8613fbe-0796-6555-5c4b-bce6ef6cdabb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 27.10.2020 15:33, Rafa? Mi?ecki wrote:
> On 27.10.2020 10:18, Thomas Petazzoni wrote:
>> On Mon, 26 Oct 2020 22:34:33 +0100
>> Rafa? Mi?ecki <zajec5@gmail.com> wrote:
>>
>>> From: Rafa? Mi?ecki <rafal@milecki.pl>
>>>
>>> This new package provides "lzma_alone" host binary based on the original
>>> LZMA SDK. It provides few extra options when compared to the LZMA Utils
>>> project "lzma" binary (already packaged as the "lzma").
>>>
>>> This tool is required for preparing firmware images for some home
>>> routers with picky bootloaders. It's main advantage is support for
>>> specifying dictionary size and lc/lp/pb LZMA values.
>>>
>>> Broadcom CFE bootloader for MIPS BCM47xx devices is known to fail to
>>> boot images using LZMA compression with dictionary.
>>> Broadcom cferam bootloader for ARM64 BCM4908 devices is known to fail to
>>> boot images without uncompressed size specified.
>>> Broadcom CFE for BCM63xx DSL devices has even different requirements.
>>>
>>> Packaging LZMA SDK "lzma" as "lzma_alone" is how it's handled in the
>>> Arch, Debian and Ubuntu.
>>>
>>> Signed-off-by: Rafa? Mi?ecki <rafal@milecki.pl>
>>
>> I am a bit confused by all the different lzma projects out there.
>>
>> The Debian source package lzma (https://tracker.debian.org/pkg/lzma)
>> produces the lzma, lzma-alone and lzma-dev packages, and its source
>> package is apparently referring to what you suggest to use here.
>>
>> The Buildroot package lzma points to https://tukaani.org/lzma/, which
>> says "Users of LZMA Utils should move to XZ Utils." and where the
>> latest release is from 2008.
>>
>> And then, there is the LZMA SDK at https://www.7-zip.org/sdk.html,
>> where the latest release is 19.00, from 2019, at
>> https://www.7-zip.org/a/lzma1900.7z. This seems to be the same files
>> provided at
>> https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/, but you're
>> using the lzma922 version.
>>
>> Do you have some clarifications about this (apparent) mess ?
> 
> I wasn't fully aware of Debian solution. So it seems that Debian
> developers:
> 1. Switched from LZMA Utils to the LZMA SDK
> 2. Kept "lzma" CLI from the LZMA Utils project
> 
> They did that by patching LZMA SDK sources (see
> lzma_9.22-2.1.debian.tar-1.xz and its "patches"). They ported lzmp.cpp
> from the LZMA Utils.
> 
> Advantages:
> 1. Single code base
> 2. Using the latest LZMA core code
> 
> Disadvantages:
> 1. Some missing tools like lzmainfo
> 
> To make things worse, there is also a XZ Utils project that also
> provides binaries lzma (with CLI like in LZMA Utils), unlzma & lzmainfo.
> 
> 
> What strategy should buildroot follow in this case?

Any opinion on that?
