From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Nov 2012 10:09:10 +0100
Subject: [Buildroot] [PATCH 2/7] support/scripts: add a script to add a
	new package
In-Reply-To: <5091D7B6.8070703@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <5091D7B6.8070703@mind.be>
Message-ID: <20121101100910.0cfe5b84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 01 Nov 2012 03:00:22 +0100, Arnout Vandecappelle wrote:

> > +$ ./support/script/pkg-new
> > +Name of the package: libfoo
> > +
> > +1) none
> > +2) multimedia
> > +3) java
> > +4) x11r7
> > +5) games
> > +Category of your package: 1
> 
>   I would skip this question and always create it in
> packages/libfoo.  The subdirectories are rare, we want to get rid of
> them, and anyway you can easily move the generated directory to a
> different place after the fact.

Agreed. However, I also wonder if it is a good idea to make this script
ask questions, as compared to a more conventional script that takes
command line arguments. But it's true that a script asking questions is
more like a wizard, probably easier to use.

> > +		define ${PKG_NAME}_INSTALL_TARGET_CMDS
> 
>   Putting a sample
> 	install -D -m 0644 $(@D)/... $(TARGET_DIR)/...
> isn't a bad idea.

Not sure I agree here. People too often do manual installation in
generic packages, while they should use 'make install', possibly after
tunning/patching the Makefile.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
