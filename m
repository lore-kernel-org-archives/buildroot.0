From: hacklinux <pipiliu_wangk@hotmail.com>
Date: Sun, 6 Oct 2013 10:00:30 +0000
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <20130829105047.6fa8f30c@skate>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>,
 <521C5ABF.4000301@relinux.de>, <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>,
 <521C70CE.4060101@relinux.de>, <BAY167-W54738C29151963CCC2605944B0@phx.gbl>,
 <521EDAF9.1080609@mind.be>, <20130829101214.61597274@skate>,
 <BAY167-W75821A694A0D0A49BAA27394340@phx.gbl>, <20130829105047.6fa8f30c@skate>
Message-ID: <BAY167-W376D289F5F577292244E6994120@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear 
thomas:
i got buildroot-2013.08.1 package and created the local.mk file, the content of the file is as follow:
BUSYBOX_OVERRIDE_SRCDIR = /home/wangk/busybox-1.21.1UCLIBC_OVERRIDE_SRCDIR = /home/wangk/uClibc-0.9.33.2
when i tried the make cmd the compile error occured which is as follow:
ROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include   -fpic -g -DIN_LIBGCC2 -fbuilding-libgcc -fno-stack-protector   -fpic -I. -I. -I../.././gcc -I../../../libgcc -I../../../libgcc/. -I../../../libgcc/../gcc -I../../../libgcc/../include  -DHAVE_CC_TLS  -DUSE_TLS -o _gcov_execv.o -MT _gcov_execv.o -MD -MP -MF _gcov_execv.dep -DL_gcov_execv -c ../../../libgcc/libgcov.c../../../libgcc/generic-morestack-thread.c:41:21: fatal error: pthread.h: No such file or directorycompilation terminated.make[2]: *** [generic-morestack-thread.o] Error 1make[2]: *** Waiting for unfinished jobs....make[2]: Leaving directory `/home/wangk/buildroot-2013.08.1/output/build/host-gcc-intermediate-4.7.3/build/i686-buildroot-linux-uclibc/libgcc'make[1]: *** [all-target-libgcc] Error 2make[1]: Leaving directory `/home/wangk/buildroot-2013.08.1/output/build/host-gcc-intermediate-4.7.3/build'make: *** [/home/wangk/buildroot-2013.08.1/output/build/host-gcc-intermediate-4.7.3/.stamp_built] Error 2
i knew the reason for this error is miss of pthread.h, but how should i config the busybox to solve the problem.
Best regards.
> Date: Thu, 29 Aug 2013 10:50:47 +0200
> From: thomas.petazzoni at free-electrons.com
> To: pipiliu_wangk at hotmail.com
> CC: uclibc.org buildroot at uclibc.org
> Subject: Re: [Buildroot] wanna compile busybox and uclib with self modified code, please help
> 
> Dear hacklinux,
> 
> Please do not reply to me directly, keep the Buildroot mailing list in
> Cc.
> 
> On Thu, 29 Aug 2013 08:42:26 +0000, hacklinux wrote:
> > > Also, note that both linux-headers and uclibc became real packages
> > > *after* the 2013.05 release. So if anyone is using 2013.05 or earlier,
> > > those aren't packages, and the override source directory feature cannot
> > > be used.
> > 
> > it seems right to me, i tried the override source feature in my environment and failed to compile from the given source. for the before 2013.05 version, is there any way to solve the problem, please help.
> 
> It depends for which package you want to use the override source
> directory feature.
> 
> That said, the override source directory feature is just an additional
> "help". You can also make your source modifications separately, create
> some patches, and import those patches in Buildroot once you're done
> doing your changes. For components that are simple to build outside of
> Buildroot (like Busybox), it's probably the easiest option.
> 
> > there is another problem confusing me that i wanna compile linux2.4 version with buildroot. i put 2.4.tar.gz under dl directory and made changes through menuconfig, however, all that failed. so i wonder if buildroot suppoprt linux2.4
> > version?
> 
> We do not support Linux 2.4. Linux 2.6 itself is almost 10 years old.
> If you're still stuck at Linux 2.4, I believe that the absence of
> Buildroot support for it will be the smallest of your problem. A lot of
> userspace libraries and components will most likely use new system
> calls or Linux kernel features that were not available in Linux 2.4, so
> you would also have to use very old userspace components.
> 
> > a personal question concerning linux kernel please help, i tried to joining the linux kernel mailing list through hotmail, however the mailing system cann't recongnize the applying mailing, i personlly figure out it should be something wroong with my email format, the mail i used is hotmail, is there anything wrong with my application?
> 
> I have no idea. Maybe because your e-mails are all base64 encoded
> instead of being plain text e-mails? Or something else. I don't use
> hotmail, so I have no idea, sorry.
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131006/5703dc27/attachment-0001.html>
