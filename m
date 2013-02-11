From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Feb 2013 16:54:09 +0100
Subject: [Buildroot] [RFC] Python 3 external packages support
In-Reply-To: <CAHXCMMJnMGN5+2HbWkLoDwE37C=u5bHsZQm=2XPpAmJhJ2qTsQ@mail.gmail.com>
References: <1360594442.60393.YahooMailNeo@web171801.mail.ir2.yahoo.com>
 <20130211160908.2da60098@skate>
 <CAHXCMMJnMGN5+2HbWkLoDwE37C=u5bHsZQm=2XPpAmJhJ2qTsQ@mail.gmail.com>
Message-ID: <20130211165409.2160e0cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 11 Feb 2013 16:45:58 +0100, Samuel Martin wrote:

> > Then, Python external modules would have to depend on
> > BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 is they support both,
> > BR2_PACKAGE_PYTHON if they support Python 2 only, and
> > BR2_PACKAGE_PYTHON3 is they support Python 3 only.
> 
> Also, keep in mind, that having a symlink python pointing to python3
> may/will break some build system,
> like scons (which does not yet support python3) and some other
> per-package ones.

It will only break if you allow such packages to be enabled when
Python3 is enabled. But true, some non-python related packages only need
the host python package, and for the host python package, we may want
to be able to build version 2, even if the target python is python 3.

The problem seems complex...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
