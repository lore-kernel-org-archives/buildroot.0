From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 19 Jun 2020 15:43:44 +0200
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <20200619132043.GA525498@p1g2>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5ABSEJvLkBJGNUtoSgZoBCEZAqkGqLv7wVuffE57zJq+Q@mail.gmail.com>
 <d6c168ae-abe9-26ba-f8f8-d62687ff2592@armadeus.com>
 <20200619132043.GA525498@p1g2>
Message-ID: <6b4eda2b-4095-0c6d-fd6f-b5e0ca483603@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On 6/19/20 3:20 PM, Gary Bisson wrote:
> Hi Sebastien,
> 
> On Mon, Jun 15, 2020 at 04:07:42PM +0200, S?bastien Szymanski wrote:
>> Hi Fabio,
>>
>> On 6/15/20 3:49 PM, Fabio Estevam wrote:
>>> Hi S?bastien,
>>>
>>> On Mon, Jun 15, 2020 at 10:44 AM S?bastien Szymanski
>>> <sebastien.szymanski@armadeus.com> wrote:
>>>
>>>> -FIRMWARE_IMX_BLOBS = sdma vpu
>>>> +FIRMWARE_IMX_BLOBS = sdma epdc
>>>
>>> The commit log does not mention about removing the VPU firmware and
>>> adding the EPDC one.
>>>
>>> What is the reason for not installing the VPU firmware?
>>>
>>
>> I use the FIRMWARE_IMX_BLOBS to list the firmwares that go into
>> /lib/firmware/imx and also for patch 2.
>> The VPU firmwares still get installed in
>> FIRMWARE_IMX_INSTALL_TARGET_CMDS. I have added a cp command for that.
> 
> Yes, but now you are installing all VPU + epdc firmware files for all
> platforms which is unnecessary.

Yes, like it was done before my changes on all i.MX platforms but i.MX8.
SDMA firmware files are also installed for all platforms.

Regards,

> 
> Those should only be selected depending on the platform you are using,
> exactly what you do for easrc.>
> Regards,
> Gary
> 


-- 
S?bastien Szymanski, Armadeus Systems
Software engineer
