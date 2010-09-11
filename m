From: S W <sw18@hotmail.co.jp>
Date: Sun, 12 Sep 2010 03:09:02 +0900
Subject: [Buildroot] Build error "cannot find -lc"
In-Reply-To: <20100911105201.176d1396@surf>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>,
	<20100911105201.176d1396@surf>
Message-ID: <KAW101-W3400321E421A55939E3C979B750@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas

 

Thank you so much for your prompt response!

I am using Fedora 12, which I installed from a live CD.

 

I will try it on Monday. And I will post my results once

I have update information.


 Thanks!

Terry
> Date: Sat, 11 Sep 2010 10:52:01 +0200
> From: thomas.petazzoni at free-electrons.com
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Build error "cannot find -lc"
> 
> Hello,
> 
> On Sat, 11 Sep 2010 07:16:46 +0900
> S W <sw18@hotmail.co.jp> wrote:
> 
> > I am using Buildroot-2010.08 to create a arm-linux kernel,
> > but I encountered an error message like
> > /usr/bin/ld: cannot find -lc
> > 
> > And I attached the whole output message with this email.
> > 
> > Would anyone please give me any advice?
> 
> Which distro are you using ?
> 
> Here, host-module-init-tools is trying to link statically the insmod
> program, so it needs the static version of the C library, which does
> not seem to be avaible on your system.
> 
> Some distributions (especially RPM based distro it seems, like
> RedHat, Fedora, Mandriva and OpenSuse) ship this as a separate package,
> sometimes named "glibc-static" or something similar. Anyhow, you should
> have a "libc.a" file, either in /lib or /usr/lib, for this to work.
> Just find the package of your distro that contains it.
> 
> Can you check this out, and report to us, so that we can implement
> something to warn out users about this ?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100912/b121e367/attachment.html>
