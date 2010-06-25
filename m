From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Jun 2010 09:24:50 +0200
Subject: [Buildroot] make linux26-force
In-Reply-To: <0D753D10438DA54287A00B02708426976372DCA426@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763716C534F@AUSP01VMBX24.collaborationhost.net>
	<20100624092307.38486bc6@surf>
	<0D753D10438DA54287A00B02708426976372DCA426@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20100625092450.25314ba1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Jun 2010 10:48:09 -0500
H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> No.  Manually adding a new patch or making a change to one of the source
> files will not cause the kernel to be rebuilt.  And, doing a linux26-menuconfig
> also will not cause the rebuild (unless something is changed).

True.

> I'm trying to bring up a new board design so I am always making changes to
> my kernel board init file, either to enable a new feature or test something.
> 
> I know I can force the rebuild by touching the stamp_configured file but
> it's kind of a hassle since I was used to just doing either:
> 
> $ make linux26-force;make
> 
> Of 
> 
> $ make linux26-force;make linux26
> 
> This has worked fine for me since I started using buildroot.  The linux-cleanup
> commit changed that behavior.

I understand.

In general, Buildroot is not really good at allowing people to change
the code of the different components it compiles. We had this
linux26-specific thing, but for all other regular packages, we have
nothing in place.

So, I'd prefer not to add a linux26-specific knob and have a generic
reflexion on how we want to handle this use-case, for all packages. And
in general the use-case of Buildroot being used during *development*
and not only for integration.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
