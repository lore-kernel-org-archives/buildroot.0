From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 1 Jul 2010 08:22:55 +1000
Subject: [Buildroot] Kernel build process
In-Reply-To: <20100630185824.095c6ad0@surf>
References: <002401cb1843$dc1e2670$945a7350$@pauljones.id.au>
	<20100630185824.095c6ad0@surf>
Message-ID: <000f01cb18a2$d4f5fad0$7ee1f070$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Thursday, 1 July 2010 2:58 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Kernel build process
> 
> >
> > 3)      Add code to ignore copying config file if "Configuration file
> > path" is still blank and just continue compiling the kernel with the
> > default options.
> >
> > That way it should be obvious to any beginners what the options do,
> > and if they are not set (ie left as default) the build will still be
> > able to continue.
> 
> I'm not sure about this last part, though. What kind of "default options"
will
> the kernel select ? Just a random set of options for the architecture
selected
> ? Yes for x86 this will do something more or less sensible, but for other
> embedded architectures such as ARM, there's no such thing as a "default
set
> of options that makes sense".
> 
> So I'd prefer to detect the fact that the configuration file path option
has
> been left empty, and abort the build by showing an explicit and clear
error
> message about this.
> 
> Same could be done for the defconfig option.
> 
> What do you think ?

Good point. I guess if we tell the user to run "make linux26-menuconfig"
that would be just as good.



Paul.
