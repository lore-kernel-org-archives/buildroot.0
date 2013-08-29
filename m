From: hacklinux <pipiliu_wangk@hotmail.com>
Date: Thu, 29 Aug 2013 09:01:56 +0000
Subject: [Buildroot] wanna compile busybox and uclib with self modified
 code, please help
In-Reply-To: <20130829105047.6fa8f30c@skate>
References: <BAY167-W75F3A55D10B8CCC0F96A74944A0@phx.gbl>,
 <521C5ABF.4000301@relinux.de>, <BAY167-W23A3ABEDF04D72F595092D944A0@phx.gbl>,
 <521C70CE.4060101@relinux.de>, <BAY167-W54738C29151963CCC2605944B0@phx.gbl>,
 <521EDAF9.1080609@mind.be>, <20130829101214.61597274@skate>,
 <BAY167-W75821A694A0D0A49BAA27394340@phx.gbl>, <20130829105047.6fa8f30c@skate>
Message-ID: <BAY167-W21E4A8A7EE6D1ABA35A2CD94340@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thx indeed.

best regards
wang

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130829/6478e470/attachment.html>
