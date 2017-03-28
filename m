From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 18:54:40 +0200
Subject: [Buildroot] [git commit] fs/ext2: Remove support for
 auto-calculation of rootfs size
In-Reply-To: <87vaqt4pwu.fsf@dell.be.48ers.dk>
References: <20170325134226.A8E8C8211A@busybox.osuosl.org>
 <87vaqt4pwu.fsf@dell.be.48ers.dk>
Message-ID: <20170328185440.5a680d0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Mar 2017 13:11:13 +0200, Peter Korsgaard wrote:

>  > +# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
>  >  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
>  > -	int "exact size in blocks (leave at 0 for auto calculation)"
>  > -	default 0
>  > +	int "exact size in blocks"
>  > +	default 61440  
> 
> It would be good with some help text explaining what a block is / what
> the size of a block is.
> 
> I believe genext2fs uses a block size of 1024 and we (currently) don't
> override it.

True. However:

 - The option already existed, was already using the "blocks" unit
   without mentioning how big a block is

 - The following patches in the series change this option to be a
   "size" rather than a number of blocks, which makes a lot more sense
   IMO. Especially since forcing 1KB blocks is really crappy.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
