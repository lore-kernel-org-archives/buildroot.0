From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 26 Oct 2011 10:57:36 -0500
Subject: [Buildroot] Syslinux host and target build
In-Reply-To: <85632AA8828446C5B830EBF9A14700E5@beraninstruments.com.local>
References: <85632AA8828446C5B830EBF9A14700E5@beraninstruments.com.local>
Message-ID: <201110261057.38848.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed October 26 2011, Will Moore wrote:
> I use a syslinux host build to generate a bootable USB flash drive on to which I
> install the buildroot built kernel and rootfs.
> 
> I also build syslinux for the target that I include in the buildroot rootfs to
> allow the target device, as booted from the USB flash drive, to generate
> bootable PATA (aka IDE) flash drives - a sort of self installer.
> 
> I would like to get buildroot to build the host and target syslinux for me.  I
> am just not sure how to go about it!  I have tried adjusting the existing
> syslinux.mk to make the SYSLINUX_BUILD/INSTALL_CMDS build for the target, added
> HOST_SYSLINUX_BUILD/INSTALL_CMDS for a host build and added $(eval $(call
> GENTARGETS,boot,syslinux,host)) but the host build doesn't seem to get run.  I
> conclude I don't know what I am doing :)
>
Try:
$(eval $(call GENTARGETS,host))

I think the recent infrastructure change included GENTARGETS.

Mike 
> I also believe that we are currently just calling "make" where as the syslinux
> /doc/distrib.txt requests that we call "make clean" "make installer" instead.
>  
> Regards,
> 
>  
> 
> Will
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
