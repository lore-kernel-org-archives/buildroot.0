From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2011 23:29:14 +0100
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111122232914.76a86e7d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Nov 2011 16:11:45 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> EtherCAT.  I think it should have some kernel modules, be built
> against the kernel source, etc.  A command like 'make modules_install
> install' can be part of building for Linux PC.
> 
> Generally what I am doing is building EtherCAT and pointing it to the
> buildroot directory for the kernel sources.  Then when EtherCAT build
> finishes, I go back into BuildRoot and run make and the filesystem
> has been updated.
> 
> But when I try and run, I get a modules not found error.  So the
> thought is I need to do a make install type of command.

Ok. I guess the EtherCAT stuff is not open-source, unfortunately.

What you should do is create a Buildroot package that builds EtherCAT
against the Linux kernel built by Buildroot. Within a package, you can
access the location of the built kernel tree using the $(LINUX_DIR)
variable. Remember to depend on the "linux" package to make sure it is
built before your "ethercat" package. I would happily help you with
more details, but without access to the EtherCAT source code, it's
going to be a bit difficult.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
