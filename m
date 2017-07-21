From: daggs <daggs@gmx.com>
Date: Fri, 21 Jul 2017 12:59:44 +0200
Subject: [Buildroot] img layout
In-Reply-To: <87vammoyqg.fsf@dell.be.48ers.dk>
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
 <20170721092626.57bf9db2@windsurf>
 <trinity-6a261bc1-46e9-4b2a-9e53-ec32e5d148b0-1500628795781@3capp-mailcom-bs09>
 <87vammoyqg.fsf@dell.be.48ers.dk>
Message-ID: <trinity-87e7b58a-c039-4b11-8d40-18e2768a46c0-1500634784758@3capp-mailcom-bs02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

> Sent: Friday, July 21, 2017 at 1:44 PM
> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: daggs <daggs@gmx.com>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, buildroot at buildroot.org
> Subject: Re: [Buildroot] img layout
>
> >>>>> "daggs" == daggs  <daggs@gmx.com> writes:
> 
> Hi,
> 
>  > well latest uboot supports the odroidc2 boards but there is a need to
>  > insert their signed blobs into the image.
>  > as I don't know how the image's layout is, I'm not sure the dd
>  > specified in the uboot docs will work. I've never got it to boot. it
>  > maybe something else.
> 
>  > this is what they write:
>  > DEV=/dev/your_sd_device
>  > dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
>  > dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
>  > dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97
> 
>  > how can I be sure that the offsets above are the same in uboot generated image?
> 
> That looks very similar to the logic we already have in
> board/hardkernel/odroid2c2/post-image.sh, isn't that working for you?
> 
> -- 
> Bye, Peter Korsgaard

the original script won't work because it doesn't needs to address the signed bins because they are included.
it uses a uboot 2005 based git fork that already includes it. without adding the signed bins, the system will not boot.

Thanks,

Dagg.
