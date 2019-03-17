From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Mar 2019 22:29:28 +0100
Subject: [Buildroot] Adding custom linux config
In-Reply-To: <HE1PR0702MB36124C2AB07A33712AA60D07CF4A0@HE1PR0702MB3612.eurprd07.prod.outlook.com>
References: <HE1PR0702MB361270F873CC0E92047A60CCCF490@HE1PR0702MB3612.eurprd07.prod.outlook.com>
 <ae958dbb-99f6-ff67-aad9-cd24c45d925e@mind.be>
 <HE1PR0702MB36124C2AB07A33712AA60D07CF4A0@HE1PR0702MB3612.eurprd07.prod.outlook.com>
Message-ID: <6267c4e3-c10e-cada-d9b1-e55f2c3a0f66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Plese don't top-post, but reply inline like I do below. Note that this requires
configuring your mailer to quote replies properly.

On 13/03/2019 15:32, Devashish Bhageerutty wrote:
> Hi,
> 
> Sorry for not being clear enough. What I wanted to say is that I am trying to build an image with a custom linux.config file but I am not able to. 
> 
> I have specified the path in the defconfig file as stated in the manual (Please see attached Heimdal_defconfig for the Buildroot configuration).
> 
> The config file that I want to use for my linux is the linux.config.old (attached in the email) which has specific items for my hardware for example Flash and FPGA). 
> 
> When I build the image and check the .config file (in the /proc/configz), items are missing eg; CONFIG_MTD_M25P80=y or CONFIG_SPI_CADENCE_QSPI=y etc... This is preventing me from reading the flash memory.

 The SPI_CADENCE_QSPI option doesn't exist in the kernel version that you choose.

 M25P80 requires SPI_NOR to be enabled, but it isn't.

 So, I don't know where you got this linux.config.old, but it's not a valid
kernel config (at least not for your kernel version).

 Regards,
 Arnout


[snip]
