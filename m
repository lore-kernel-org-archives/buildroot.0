From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Feb 2018 09:36:42 +0100
Subject: [Buildroot] [PATCH v2 3/3] add support iMX8MQ-evk board
In-Reply-To: <CAPP7BN0vqy-J=6GE+S5cEqwwEhC-yiJLjvrZttqEC7c2XFLMJQ@mail.gmail.com>
References: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519293778-5185-4-git-send-email-karl.erik.larsson@gmail.com>
 <20180223104331.GB6998@t450s.lan>
 <CAPP7BN0vqy-J=6GE+S5cEqwwEhC-yiJLjvrZttqEC7c2XFLMJQ@mail.gmail.com>
Message-ID: <06002b0f-b4ec-f35b-79c6-2c9cfb016516@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-02-18 05:15, Erik Larsson wrote:
> Hi Gary,
> 
> 2018-02-23 11:43 GMT+01:00 Gary Bisson <gary.bisson@boundarydevices.com>:
>> Hi Erik,
>>
>> On Thu, Feb 22, 2018 at 11:02:58AM +0100, Erik Larsson wrote:
>>> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
>>> ---
>>>  .../common/imx/genimage.cfg.template_imx8          |  40 ++
>>>  board/freescale/common/imx/post-image.sh           |  10 +-
>>>  board/freescale/imx8mqevk/linux-4.9.config         | 625 +++++++++++++++++++++
>>>  configs/freescale_imx8mqevk_defconfig              |  37 ++
>>
>> Why do we copy the defconfig in board folder although it present in the
>> kernel tree directly?
> The reason I add the kernel defconfig into the board folder is that
> NXP removed all defconfigs and renamed the valid one to 'defconfig' in
> the kernel. This makes it impossible (at least I think so) to use an
> in tree defconfig.
> 
> $ ls -l arch/arm64/configs/
> total 16
> -rw-r--r-- 1 erik erik 14337 dec 15 02:52 defconfig
> 
> Copying it into the board folder was the best solution available.

 You should be able to use that in-tree defconfig with
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
