From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 10:54:17 +0200
Subject: [Buildroot] [PATCH 5/5] configs/nitrogen8m: Add new defconfig
In-Reply-To: <20180726085138.GB31169@t450s.lan>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-6-gary.bisson@boundarydevices.com>
 <20180719101000.2b07e7f8@windsurf> <20180719082344.GA26603@g751.home>
 <032f83a9-e8b8-4644-c8d4-da8de3b6bf1f@mind.be>
 <20180726085138.GB31169@t450s.lan>
Message-ID: <cdda14b0-f9b8-55f2-8714-df81347de079@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-07-18 10:51, Gary Bisson wrote:
> Hi Arnout,
> 
> On Thu, Jul 26, 2018 at 10:20:32AM +0200, Arnout Vandecappelle wrote:
>>
>>
>> On 19-07-18 10:23, Gary Bisson wrote:
>>> Hi,
>>>
>>> On Thu, Jul 19, 2018 at 10:10:00AM +0200, Thomas Petazzoni wrote:
>>>> Hello,
>>>>
>>>> On Thu, 19 Jul 2018 09:32:53 +0200, Gary Bisson wrote:
>>>>> NXP i.MX8MQ based SBC with 2GB of LPDDR4 and 8GB eMMC.
>>>>>
>>>>> More details on the platform here:
>>>>> https://boundarydevices.com/product/nitrogen8m
>>>>>
>>>>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>>>>> ---
>>>>>  configs/nitrogen8m_defconfig | 54 ++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 54 insertions(+)
>>>>>  create mode 100644 configs/nitrogen8m_defconfig
>>>>
>>>> DEVELOPERS entry + .gitlab-ci.yml update are missing.
>>>
>>> DEVELOPERS should be fine since I have:
>>> F:	configs/nitrogen*
>>>
>>> .gitlab-ci.yml was forgotten indeed, I'll add it to V2.
>>>
>>>>> +# System
>>>>> +BR2_TARGET_GENERIC_GETTY=y
>>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>>>>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
>>>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
>>>>> +BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-nitrogen8m.dtb"
>>>>
>>>> UBOOT_DIR is properly going to be expanded by the post-build script ?
>>>
>>> My understanding is that the Makefile is expanding it already. What I
>>> know for sure is that I receive the proper value in the script.
>>  Too late because it's already commitfed, but - you should use $(), not ${}.
>> With ${} it looks as if it's an environment variable, but it's actually a make
>> variable.
> 
> Should I submit a patch or can it wait until next version bump?

 It can wait, but if you do it in a version bump people might complain that it's
an independent issue you're fixing in the same patch :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
