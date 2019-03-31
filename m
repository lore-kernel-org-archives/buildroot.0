From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:10:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/scons: remove python from SCONS
In-Reply-To: <CAPi7W80cGNfGwAoZ-Zxw4jTy4qeSx+xENNQQ+qH7jzmb439J4A@mail.gmail.com>
References: <20190331121810.28608-1-fontaine.fabrice@gmail.com>
 <20190331142524.71fb464c@windsurf>
 <CAPi7W80cGNfGwAoZ-Zxw4jTy4qeSx+xENNQQ+qH7jzmb439J4A@mail.gmail.com>
Message-ID: <20190331151031.1ea749cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 14:39:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Hm, don't we have a problem when BR2_PACKAGE_PYTHON3=y ? In this case,
> > scons being a host-python-package, it will be installed for
> > host-python3, i.e in /usr/lib/python3/.../, so how can it then work to
> > call it using python2 ?  
> I tested it with the defconfig from the alljoyn autobuild falures
> (which have BR2_PACKAGE_PYTHON3=y) and it works because scons script
> is installed in $(HOST_DIR)/bin/scons and scons libraries are
> installed in $(HOST_DIR)/lib/scons-$(SCONS_VERSION) because we pass
> this path through --install-lib in scons.mk.

Hm, OK, so it means that running scons with python3 works even if it
has been installed for python2. Interesting.

I'm not sure what to do here. We could pick your patch as-is and rely
on this interesting behavior.

Or introduce two versions of scons, one for each python version, like
we did for python-setuptools. I'm not sure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
