From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 13 Jan 2021 09:39:34 +0100
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <CAEyMn7b2VmmNWevK_ZLwDPy+unW5HDqXFhMbMfO-me+TEacz=w@mail.gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
 <636366db-0dd3-4a30-7097-d09423d91aa8@gmail.com>
 <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
 <66568a2a-8730-9d9a-07b4-168bd8eea60b@gmail.com>
 <CAEyMn7b2VmmNWevK_ZLwDPy+unW5HDqXFhMbMfO-me+TEacz=w@mail.gmail.com>
Message-ID: <e6d06607-a462-3ebf-c152-0cef36789418@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

Le 13/01/2021 ? 09:27, Heiko Thiery a ?crit?:
> Hi All,
> 
>> So with your change, the first try fail using "/lib/firmware/vpu_fw_imx53.bin".
>> But "/lib/firmware/vpu/vpu_fw_imx53.bin" succeed.
>>
>> "firmware request failed" message should never appear in your dmesg log.
>>
>> I believe there is a confusion between firmware (such vpu firmware) and imx sdma
>> firmware that require to be installed to "/lib/firmware/imx" directory.
> 
> Not really related to this discussion about vpu fw but I also faced an
> issue with an imx8mq board and the SDMA firmware.
> 
> # dmesg | grep sdma
> [    0.178729] imx-sdma 302c0000.sdma: Direct firmware load for
> imx/sdma/sdma-imx7d.bin failed with error -2
> [    0.178763] imx-sdma 302c0000.sdma: Falling back to sysfs fallback
> for: imx/sdma/sdma-imx7d.bin

based on the log timing, I would say that the rootfs wasn't mounted when the
imx-sdma has been probed.

Try to compile the driver as a module, not bundled into the kernel image.

Best regards,
Romain


> [   60.381850] imx-sdma 302c0000.sdma: external firmware not found,
> using ROM firmware
> [   60.389889] imx-sdma 30bd0000.sdma: external firmware not found,
> using ROM firmware
> # ls /lib/firmware/imx/sdma/^C
> # find / -name sdma-imx7d.bin
> /lib/firmware/imx/sdma/sdma-imx7d.bin
> 
> Has anyone an idea what is going wrong?
> 
> Thank you
> 
