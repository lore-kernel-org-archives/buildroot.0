From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:06:54 +0200
Subject: [Buildroot] [PATCH 2/5] linux: support unpacked kernel source
 tree
In-Reply-To: <1344330577-25159-2-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120811200654.35b80b74@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 7 Aug 2012 17:09:34 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Point the kernel build system to the unpacked source tree.
> Allow the building folder differ from the source folder.
> 
> LINUX_DIR still refers to the building folder, while LINUX_SOURCE_DIR
> refers to the customer specified source folder.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

I know Mike implemented this a while ago, but we don't want this in
Buildroot. The reason is that we don't want a per-package specific
mechanism to handle such a thing, but rather something at the package
infrastructure level.

At the moment, what we have to offer is the local.mk mechanism: you can
create a local.mk in which you write:

LINUX_OVERRIDE_SRCDIR = /path/to/linux/sources

and then Buildroot will use the sources of Linux from this directory
instead of doing the normal download/extract/patch strategy.

This mechanism is implemented at the package infrastructure level, and
therefore works for all packages, not only Linux.

We're definitely open to improving things at the package infrastructure
level, but we clearly don't want to add package-specific mechanisms
such as the one being proposed here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
