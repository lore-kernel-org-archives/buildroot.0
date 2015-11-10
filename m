From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Tue, 10 Nov 2015 17:10:42 +0000
Subject: [Buildroot] [PATCH v7] board: add support for Intel Galileo Gen
 2
In-Reply-To: <56314C13.5030302@mind.be>
References: <1445359684.18938.6.camel@intel.com> <56314C13.5030302@mind.be>
Message-ID: <1447175442.3010.65.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Humblest apologies for the delay in responding to your email.

>  There is now a v1.2 BSP at Intel that is based on 3.14. Unfortunately, it's in
> a 7z-packed tarball so not exactly easy to integrate...

There is - I am very familiar with it. There is more yocto specific
stuff to strip from this, so I will integrate after I get the base
enabling upstream based on 3.8.7. 

>  Doesn't genimage allow to specify this in a single file?
I tried putting them together - can't remember the issues I had, will
look at it again. 

>  ext2 is completely useless.
Agreed.

>  ext3 could be replaced by ext4.

Agreed.

> > +CONFIG_CRYPTO_CRC32C=y
> 
>  That's probably a leftover of some option you disabled.
Ok - will investigate. 

> > +# CONFIG_VIRTUALIZATION is not set
> > +CONFIG_CRC_T10DIF=y
>  This one too.

Ok - will investigate. 

>  No bashisms here, so /bin/sh

Agreed 

> 
>  Perhaps add a -e to exit on failure.

Agreed 

> > +RET=${?}
> > +exit ${RET}
> 
>  These two lines are redundant.

Agreed 

>  Why not just hard link all of these instead of loading them as modules? The
> drivers that differ between the two modules are so small that it's not going to
> make a significant difference in kernel size.

Ok I will figure out which ones are not model specific and hard link
them.  I seem to have some memory the model specific ones are mutually
exclusive, they shouldn't be loaded at the same time, will need to
verify. 

>  Perhaps add a comment here that this version is needed for the -Wl,... option.
Agreed,

>  Can we use ext4 instead?
Agreed,

> 
> > +BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs.ext2"
> 
>  That's not needed.
Ok.

Ray K
