From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 15 Jun 2020 16:07:42 +0200
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <CAOMZO5ABSEJvLkBJGNUtoSgZoBCEZAqkGqLv7wVuffE57zJq+Q@mail.gmail.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5ABSEJvLkBJGNUtoSgZoBCEZAqkGqLv7wVuffE57zJq+Q@mail.gmail.com>
Message-ID: <d6c168ae-abe9-26ba-f8f8-d62687ff2592@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On 6/15/20 3:49 PM, Fabio Estevam wrote:
> Hi S?bastien,
> 
> On Mon, Jun 15, 2020 at 10:44 AM S?bastien Szymanski
> <sebastien.szymanski@armadeus.com> wrote:
> 
>> -FIRMWARE_IMX_BLOBS = sdma vpu
>> +FIRMWARE_IMX_BLOBS = sdma epdc
> 
> The commit log does not mention about removing the VPU firmware and
> adding the EPDC one.
> 
> What is the reason for not installing the VPU firmware?
> 

I use the FIRMWARE_IMX_BLOBS to list the firmwares that go into
/lib/firmware/imx and also for patch 2.
The VPU firmwares still get installed in
FIRMWARE_IMX_INSTALL_TARGET_CMDS. I have added a cp command for that.

Regards,

-- 
S?bastien Szymanski, Armadeus Systems
Software engineer
