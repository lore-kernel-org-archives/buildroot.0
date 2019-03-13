From: Devashish Bhageerutty <db@windarphotonics.com>
Date: Wed, 13 Mar 2019 14:32:52 +0000
Subject: [Buildroot] Adding custom linux config
In-Reply-To: <ae958dbb-99f6-ff67-aad9-cd24c45d925e@mind.be>
References: <HE1PR0702MB361270F873CC0E92047A60CCCF490@HE1PR0702MB3612.eurprd07.prod.outlook.com>
 <ae958dbb-99f6-ff67-aad9-cd24c45d925e@mind.be>
Message-ID: <HE1PR0702MB36124C2AB07A33712AA60D07CF4A0@HE1PR0702MB3612.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry for not being clear enough. What I wanted to say is that I am trying to build an image with a custom linux.config file but I am not able to. 

I have specified the path in the defconfig file as stated in the manual (Please see attached Heimdal_defconfig for the Buildroot configuration).

The config file that I want to use for my linux is the linux.config.old (attached in the email) which has specific items for my hardware for example Flash and FPGA). 

When I build the image and check the .config file (in the /proc/configz), items are missing eg; CONFIG_MTD_M25P80=y or CONFIG_SPI_CADENCE_QSPI=y etc... This is preventing me from reading the flash memory.

If I do a "make linux-update-defconfig" in the Buildroot folder, my linux.config will get overwritten by a generic one instead of doing a merge and will still be missing the specific items I had before. I have attached this as linux.config in the email. 

Finally here is a link for a difference check between my linux.config (on the right) and the linux.config that is generated my Buildroot when I do a linux-update-defconfig.(on the left) https://www.diffchecker.com/421xxn9X

Thank you for your help. 

Best Regards,

Deva


-----Original Message-----
From: Arnout Vandecappelle <arnout@mind.be> 
Sent: 12 March 2019 23:22
To: Devashish Bhageerutty <db@windarphotonics.com>; buildroot at busybox.net
Subject: Re: [Buildroot] Adding custom linux config



On 12/03/2019 16:09, Devashish Bhageerutty wrote:
> Hi,
> 
> ?
> 
> I am building an image with an out of tree configuration. I have 
> specified the path to my custom config file in the defconfig and my 
> linux.config is in the folder structure as shown on the Buildroot 
> template. But when I am building or if I do ?make 
> linux-update-(def)config?, my config file is getting overwritten by a 
> generic one. I have checked the /proc/configz on a running system to 
> verify this. This configuration was working before on Buildroot 2015 
> with linux kernel
> 3.10 but now I am using Buildroot 2018.02 and kernel 4.14.73. I would 
> be grateful if I could be pointed to what could be causing this or any 
> tests I can make to figure out why this is happening.

 Can you do 'make savedefconfig' and share the resulting defconfig file? Your explanation is not very clear I'm afraid...

 Regards,
 Arnout

> 
> ?
> 
> Best Regards,
> 
> ?
> 
> Deva
> 
> ?
> 
> windar_logo_email_sig
> 
> Devashish Bhageerutty
> 
> Embedded Software Engineer
> 
> Windar Photonics A/S
> 
> E-mail: db at windarphotonics.com <mailto:db@windarphotonics.com>
> 
> Web: www.windarphotonics.com
> 
> ?
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux.config
Type: application/octet-stream
Size: 3512 bytes
Desc: linux.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190313/8d5b880b/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux.config.old
Type: application/octet-stream
Size: 3969 bytes
Desc: linux.config.old
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190313/8d5b880b/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: heimdal_defconfig
Type: application/octet-stream
Size: 2243 bytes
Desc: heimdal_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190313/8d5b880b/attachment-0002.obj>
