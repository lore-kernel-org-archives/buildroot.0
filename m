From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 7 Jan 2014 08:15:04 -0600
Subject: [Buildroot] [PATCH 1/1] python-posix-ipc: new package
In-Reply-To: <20140107141723.0d5b6f4c@skate>
References: <1389043097-30018-1-git-send-email-mlweber1@rockwellcollins.com>
 <20140107141723.0d5b6f4c@skate>
Message-ID: <OF6343FCB9.35517AA9-ON86257C59.004D5C27-86257C59.004E48DB@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 01/07/2014 
12:17:23 AM:

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 01/07/2014 12:17 AM
> Subject: Re: [Buildroot] [PATCH 1/1] python-posix-ipc: new package
> 
> Dear Matt Weber,
> 
> On Mon, 6 Jan 2014 15:18:17 -0600, Matt Weber wrote:
> 
> > diff --git a/package/python-posix-ipc/Config.in b/package/python-
> posix-ipc/Config.in
> > new file mode 100644
> > index 0000000..2fbc7a7
> > --- /dev/null
> > +++ b/package/python-posix-ipc/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_PYTHON_POSIX_IPC
> > +   bool "python-posix-ipc"
> > +   depends on BR2_PACKAGE_PYTHON
> 
> I see #include <pthread.h> in the C code of the module, so maybe this
> Python module should depend on BR2_TOOLCHAIN_HAS_THREADS?

Good catch, that would make sense as it's using mutex and lock 
functionality.

> 
> > +PYTHON_POSIX_IPC_VERSION = 0.9.6
> > +PYTHON_POSIX_IPC_SOURCE = 
posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
> > +PYTHON_POSIX_IPC_SITE = http://semanchuk.com/philip/posix_ipc/
> > +PYTHON_POSIX_IPC_LICENSE = BSD-2c
> 
> License is BSD-3c, not BSD-2c.

Ok, he had the link to the BSD-2c (
http://opensource.org/licenses/bsd-license.php)
on his website.  However since the source actually had BSD-3c 
and is more restrictive, I'll update to that.

> 
> > +PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
> > +PYTHON_POSIX_IPC_SETUP_TYPE = distutils
> 
> Other than that, looks good to me (but I haven't tested).

Thanks!
Matt Weber
mlweber1 at rockwellcollins.com
