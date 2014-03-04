From: Martin Bark <martin@barkynet.com>
Date: Tue, 04 Mar 2014 09:56:43 +0000
Subject: [Buildroot] Linux won't build any more?
In-Reply-To: <20140304090918.5eef0cd5@skate>
References: <531584D4.3060301@freescale.com> <20140304090918.5eef0cd5@skate>
Message-ID: <5315A35B.30204@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 04/03/14 08:09, Thomas Petazzoni wrote:
> Dear Vincent Stehl?,
>
> On Tue, 4 Mar 2014 08:46:28 +0100, Vincent Stehl? wrote:
>
>> FYI I wonder if the recent commits on the master branch have not broken
>> linux kernel build in some cases. For example:
>>
>>     $ make freescale_imx6sabresd_defconfig
>>     $ make
>>     linux/linux.mk:171: *** Configuration file
>> '/arch/arm/configs/imx6_defconfig' not found..  Stop.
>>
>> Same with qemu_arm_vexpress_defconfig.
>>
>> Git bisect points at commit b4cacbf5b15db06132b5f401d39b4c8d4e79158e,
>> "linux: check the configuration file exists". If I revert this commit
>> build will indeed still complain about the config but will go further.
>
> Thanks for the report. Do you still see this problem with the current
> Git head, including commits
> http://git.buildroot.net/buildroot/commit/?id=477c28cf1d637b224b819dd278103a05fb6f9dbb
> and
> http://git.buildroot.net/buildroot/commit/?id=4ad1ea59a59f951fad072dcb19429e6f468abf05 ?
>
> If you still see it, then I believe I'll just revert Yann's patches,
> they have caused too much troubles already.
>
> Again, thanks for your report!
>
> Thomas
>

I see this issue still, those two commit did not fix it.  I noticed the 
issue using raspberrypi_defconfig

	$ make raspberrypi_defconfig
	$ make
	linux/linux.mk:171: *** Configuration file 
'/arch/arm/configs/bcmrpi_quick_defconfig' not found.. Stop.

Thanks

Martin
