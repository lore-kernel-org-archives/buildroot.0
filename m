From: daggs <daggs@gmx.com>
Date: Fri, 21 Jul 2017 11:19:55 +0200
Subject: [Buildroot] img layout
In-Reply-To: <20170721092626.57bf9db2@windsurf>
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
 <20170721092626.57bf9db2@windsurf>
Message-ID: <trinity-6a261bc1-46e9-4b2a-9e53-ec32e5d148b0-1500628795781@3capp-mailcom-bs09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Friday, July 21, 2017 at 10:26 AM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: daggs <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] img layout
>
> Hello,
> 
> On Fri, 21 Jul 2017 08:48:36 +0200, daggs wrote:
> 
> > I have a question about the image layout, if I dd some data into a
> > final image, can I extrapolate what pre image creation file it
> > touches and at what offset?
> 
> Not easily at all, as it depends on the filesystem and its internal
> structure.
> 
> The big question is why you would want to do this.
> 
> Best regards,
> 
> Thomas

well latest uboot supports the odroidc2 boards but there is a need to insert their signed blobs into the image.
as I don't know how the image's layout is, I'm not sure the dd specified in the uboot docs will work. I've never got it to boot. it maybe something else.

this is what they write:
DEV=/dev/your_sd_device
dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97

how can I be sure that the offsets above are the same in uboot generated image?

Dagg.
