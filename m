From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 21:00:34 +0200
Subject: [Buildroot] [PATCH 2/3] boards/freescale/common: Introduce
 template_no_boot_part
In-Reply-To: <92e649a9-01cc-4d44-1dce-ddc6df982b5e@gmail.com>
References: <20190609145749.28766-1-offougajoris@gmail.com>
 <20190609145749.28766-2-offougajoris@gmail.com>
 <846ee132-b3e6-e60f-50a7-39cf34a9bb1b@mind.be>
 <92e649a9-01cc-4d44-1dce-ddc6df982b5e@gmail.com>
Message-ID: <ad33ba2d-ea04-9fce-6bd0-7112bdce7ca5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 20:43, Joris Offouga wrote:
> Hi Arnoud,
> 
> Le 10/06/2019 ? 00:17, Arnout Vandecappelle a ?crit?:
>> On 09/06/2019 16:57, Joris Offouga wrote:
[snip]
>>> diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
>>> new file mode 100644
>>> index 0000000000..9e19b4ee3e
>>> --- /dev/null
>>> +++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
>>> @@ -0,0 +1,23 @@
>>> +# Minimal SD card image for the Freescale boards Template
>>> +#
>>> +# We mimic the .sdcard Freescale's image format:
>>> +# * the SD card must have 1 kB free space at the beginning,
>>  Is this one going to be used by anything in practice? I expect that anything
>> that uses this kind of layout is *not* going to use the .imx format, since
>> that's considered kind of deprecated...
> 
> It depends on the targets, imx7dpico has migrated to the SPL and so its u-boot
> has gone from .imx to .img,
> 
> Example of the warp7 on 2019.01 it's still .imx.

 OK, let me rephrase it then: does U-Boot 2019.01 have any configuration without
boot FAT partition, but which uses the .imx format instead of SPL?

 In any case, I think this enimage.cfg.template_no_boot_part should only be
introduced when there is something that actually uses it. Now it is just dead code.

 Regards,
 Arnout

[snip]
