From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 31 May 2018 23:30:34 +0200
Subject: [Buildroot] [PATCH v3 3/5] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <cbd8c4a2-c772-5c90-c10e-0ad4e1f8fc7f@mind.be>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-4-git-send-email-luca@lucaceresoli.net>
 <20180528224912.539b05f6@windsurf.home>
 <a61417d4-fa49-cbbb-c51f-a88f72dcb30e@lucaceresoli.net>
 <cbd8c4a2-c772-5c90-c10e-0ad4e1f8fc7f@mind.be>
Message-ID: <90212283-0896-e6d7-df8d-172e9f8ee1d2@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 30/05/2018 22:43, Arnout Vandecappelle wrote:
> 
> 
> On 29-05-18 22:45, Luca Ceresoli wrote:
>> Hi Thomas,
>>
>> On 28/05/2018 22:49, Thomas Petazzoni wrote:
> [snip]
>>> Since this really looks like a specialized patching step, I'm not sure
>>> it really makes sense to add this. Unless you can convince me
>>> otherwise :-)
>>
>> The psu_init files are special because they contain
>> automatically-generated code to configure the SoC peripherals: enable
>> devices, set pinmuxes etc, which is not otherwise done at runtime. Have
>> a look at a few examples: [0] [1].
>  Regards,
>  Arnout
>>
>> This file will change whenever the hardware *or* the configuration
>> changes (e.g. to enable peripherals).
>>
>> It is perfectly fine if one wants to use a mainline U-Boot release or a
>> Xilinx release, unmodified, that works fine... *except* for the psu_init
>> file. With your proposed workflow all users will be forced to use a
>> custom git tree, just because they have a slightly different psu_init
>> file. With my patch these users can just use a "standard" U-Boot
>> (downloaded straight from the Internet), throw a psu_init file in their
>> Buildroot boards/ dir and change their Buildroot config to point to it.
>>
>> Even though it's technically code, you can consider the psu_init
>> somewhat like a configuration file.
> 
>  Yeah, I guess you could say it's a kind of dts but as a .c file instead of a
> .dts file. Right?

Right, in that they both contain some configuration data. But with the
difference that a dtb is usually a separate file from the kernel, while
the psu_init is compiled and linked in the bootloader binary. psu_init
is more similar to an appended DTB.

-- 
Luca
