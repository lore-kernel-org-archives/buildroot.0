From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Sep 2012 09:33:35 +0200
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
In-Reply-To: <50621F05.1070708@mind.be>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <50621F05.1070708@mind.be>
Message-ID: <20120926093335.5397b207@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 25 Sep 2012 23:15:49 +0200, Arnout Vandecappelle wrote:

>   This looks very much like a $(host-autotools-package).  Even if the
> configure is not a proper autoconf script and barfs on all the unknown
> options that buildroot adds, you can still override the
> CONFIGURE_CMDS. But I expect that just setting HOST_QEMU_CONF_OPT
> will be enough.

Still, the package doesn't use the autotools, so we shouldn't use the
autotools-package infrastructure for it. While it may work at current
time t, it may easily break at time t+1 if we make changes to the
autotools-package infrastructure that are relevant for autotools
packages, but that break the subtle assumptions that non-autotools
packages are making in their use of the autotools-package
infrastructure.

So no, let's make things explicit: Qemu doesn't not use the autotools,
they have a custom configure script, custom Makefiles, so we have to
use the generic-package infrastructure here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
