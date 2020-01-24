From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 24 Jan 2020 08:37:48 +0100
Subject: [Buildroot] Package can create LINUX_FINAL_RECURSIVE_DEPENDENCIES
Message-ID: <CAEyMn7b_ESWcZ8ZBQAVYHxyXNQHrQUGx--8QGD1C6jj+F1=2gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a custom package (MYPACKAGE) in my BR2_EXTERNAL. This package
uses the "$(eval $(kernel-module))". In addition this package also
adds a kernel patch hook via BR2_EXTERNAL/linux-ext-MYPACKAGE.mk.

As far as I see MYPACKAGE depends on linux (due to kernel-module) and
LINUX depends on MYPACKAGE due to the dependency created to
LINUX_PATCH_DEPENDENCIES.

----
# make linux-legal-info
linux/linux.mk:578: *** Recursive variable
'LINUX_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).
Stop.
make: *** [Makefile:23: _all] Error 2
----

Is having a package that does both (linux kernel module and kernel
patching) allowed? Can this be fixed? I think linux only need the
dependency to the MYPACKAGE_EXTRACT because the patch is not a result
of the build of this package.

What do you think?

BR
--
Heiko
