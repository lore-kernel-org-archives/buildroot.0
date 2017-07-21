From: daggs <daggs@gmx.com>
Date: Fri, 21 Jul 2017 12:57:31 +0200
Subject: [Buildroot] img layout
In-Reply-To: <20170721114653.16e88cb7@windsurf>
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
 <20170721092626.57bf9db2@windsurf>
 <trinity-6a261bc1-46e9-4b2a-9e53-ec32e5d148b0-1500628795781@3capp-mailcom-bs09>
 <20170721114653.16e88cb7@windsurf>
Message-ID: <trinity-3f5802c7-1ac0-4e24-99dd-7277897cbbf3-1500634651202@3capp-mailcom-bs02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas

> Sent: Friday, July 21, 2017 at 12:46 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: daggs <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] img layout
>
> Hello,
> 
> On Fri, 21 Jul 2017 11:19:55 +0200, daggs wrote:
> 
> > well latest uboot supports the odroidc2 boards but there is a need to insert their signed blobs into the image.
> > as I don't know how the image's layout is, I'm not sure the dd specified in the uboot docs will work. I've never got it to boot. it maybe something else.
> > 
> > this is what they write:
> > DEV=/dev/your_sd_device
> > dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
> > dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
> > dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97
> > 
> > how can I be sure that the offsets above are the same in uboot generated image?
> 
> Use genimage, you can specify at which offset which image should be
> placed. See board/engicam/icorem6/genimage.cfg for example.
> 
> Best regards,
> 
> Thomas
> -- 

interesting, I'll look into it, thanks.
