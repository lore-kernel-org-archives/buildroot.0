From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2011 08:48:50 +0200
Subject: [Buildroot] Getting Kconfig menu right
In-Reply-To: <CAMkyJgDML5mip30tPA9962uOjHnzAWFVWTKRr8RZei3LG6W1ew@mail.gmail.com>
References: <CAMkyJgDML5mip30tPA9962uOjHnzAWFVWTKRr8RZei3LG6W1ew@mail.gmail.com>
Message-ID: <20110728084850.180f50a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 28 Jul 2011 00:30:22 +0300,
Avishay Orpaz <avishorp@gmail.com> a ?crit :

> I'm trying to add python-fuse to buildroot. I have the makefile
> working, but there is only one little problem left. I would like the
> option for python-fuse to show up as a sub-item of libfuse, only when
> libfuse is checked. It should be similar, for example, to lua - when
> selected, some relevant sub-options appear as sub-items in the
> xconfig menu. I looked very closely on the lua Config.in, but found
> nothing that tells Kconfig to show all the options as a sub-items.
> How can I do this?

If python-fuse is a separate package of libfuse, then there is no way
python-fuse can be a suboption of libfuse. You can only make
python-fuse not visible when libfuse is disabled and make it visible
when libfuse is visible. You'd need a package/python-fuse/Config.in
file that looks like this :

config BR2_PACKAGE_PYTHON_FUSE
	bool "python-fuse"
	depends on BR2_PACKAGE_LIBFUSE
	depends on BR2_PACKAGE_PYTHON
	help
	  This is python-fuse blabla.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
