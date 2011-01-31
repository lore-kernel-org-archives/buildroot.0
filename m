From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 31 Jan 2011 22:18:33 +0100
Subject: [Buildroot] rootfs.ubifs not able to mount by kernel
In-Reply-To: <20110130152021.4073fd79@surf>
References: <20110130014541.ed0f21fc085cea67a12906c6b8e6fb44.9d3b1440ba.wbe@email10.secureserver.net>	<4D453DDE.7000007@googlemail.com>
	<20110130152021.4073fd79@surf>
Message-ID: <4D472729.7000501@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.01.2011 15:20, schrieb Thomas Petazzoni:
> Hello Marcus,
>
> On Sun, 30 Jan 2011 11:30:54 +0100
> Marcus Osdoba<marcus.osdoba@googlemail.com>  wrote:
>
>> Writing a ubiFS on NAND (with RAW u-boot command) and mounting
>> afterwards is not possible. The produced ubiFS must be ubinized to a UBI
>> image.
>
> Correct. But Nataraj did create the UBI volume with U-Boot, and has
> written the UBIFS image inside this UBI volume.
True. I should have read the entire output ;-)
But what I miss is the name of the volume inside the ubiparition. 
Nataraj gave root=ubi0:rootfs on the command line. In my example project 
I set this parameter in ubinize.cfg. But the manual way with u-boot like 
Nataraj did, doesn't show a setting like:
"An ubi-volume named rootfs resides on an mtdpart named data."
I ubinized the image outside u-boot and my kernel accepts the 
root=ubi0:rootfs. As noticed, I hardly see a volume_name definition 
"rootfs" in Nataraj's u-boot log....

May be that's the problem? A mixup of the label "data" for mtdpart name 
and ubi volume name?
"U-Boot> ubi create data" should be
"U-Boot> ubi create rootfs" or "root=ubi0:data"
Without warranty ... but @Nataraj, could you try on of the above?

> Note that since recently, Buildroot is capable of generating a
> ubinize'd UBI filesystem image, thanks to the work done by Julien
> Boibessot from Armadeus. This is available in Buildroot git, and will
> be part of the next Buildroot release.
Good news.
