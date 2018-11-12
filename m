From: Carlos Santos <casantos@datacom.com.br>
Date: Sun, 11 Nov 2018 22:03:10 -0200 (BRST)
Subject: [Buildroot] [PATCH] Add syslinux installer host package
In-Reply-To: <20181111213316.18f86c81@windsurf.home>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-2-alexander.sverdlin@gmail.com>
 <20181111213316.18f86c81@windsurf.home>
Message-ID: <1370627641.1453046.1541980990981.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
> Cc: "buildroot" <buildroot@buildroot.org>, "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Domingo, 11 de novembro de 2018 18:33:16
> Subject: Re: [Buildroot] [PATCH] Add syslinux installer host package

> Hello,
> 
> Thanks for this contribution! I'm adding Carlos Santos, who also uses
> syslinux.
> 
> On Sun, 11 Nov 2018 16:06:47 +0100, Alexander Sverdlin wrote:
>> Add host installer for syslinux bootloader which allows to pre-install
>> syslinux in the generated firmware images. BR2_ROOTFS_POST_IMAGE_SCRIPT
>> can do something like this:
>> 
>> 	${HOST_DIR}/usr/bin/syslinux -d /syslinux/ -i ${IMGFILE}
>> 
>> if the rest of syslinux is installed under /syslinux inside the firmware
>> image.
>> 
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>> ---
>>  package/Config.in.host                    |  1 +
>>  package/syslinux-installer/Config.in.host |  7 +++++++
>>  package/syslinux-installer/syslinux.mk    | 25 +++++++++++++++++++++++
> 
> Instead of making a separate package for this, what about adding a host
> variant of the existing syslinux package ?

host-sylinux makes sense. The package would not build syslinux for the
host, just the installer, but this would not be a real problem, since
host packages are meant to be tools used to generate the target system. 

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
