From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 15 Jan 2019 10:19:07 +0000
Subject: [Buildroot] [PATCH v4 1/3] arch: add support for RISC-V 32-bit
 (riscv32) architecture
In-Reply-To: <20190114214408.77e95ac8@windsurf>
References: <20181021191203.2148-1-mark.corbin@embecosm.com>
 <20190114214408.77e95ac8@windsurf>
Message-ID: <16304021-961d-8211-c988-3cf230900a1a@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 14/01/2019 20:44, Thomas Petazzoni wrote:
> Hello Mark,
>
> On Sun, 21 Oct 2018 20:12:01 +0100, Mark Corbin wrote:
>> This enables a riscv32 system to be built with a Buildroot generated
>> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
>>
>> This requires a custom version of glibc 2.26 from the riscv-glibc
>> repository. Note that there are no tags in this repository, so the
>> glibc version just consists of the 40 character commit id string.
>>
>> Thanks to Fabrice Bellard for pointing me towards the 32-bit glibc
>> repository and for providing the necessary patch to get it to build.
>>
>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
>> ---
>> Changes v3 -> v4:
>>   - added choice for selecting 32-bit or 64-bit in Config.in.riscv
>>     This provides a new variable BR2_RISCV_32
> I'm sure you noticed through the autobuilder e-mails, but I wanted to
> point out that riscv32 is causing a number of build issues:
>
>   http://autobuild.buildroot.net/?arch=riscv32
Yes, I've seen these. I have re-checked the default qemu build and that
still seems to work without any problems.
>
> Most of the ones I looked at are due to missing mcontext_t definition
> in glibc. Is this something you could have a look at ?
I'll take a look as soon as I can.

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
