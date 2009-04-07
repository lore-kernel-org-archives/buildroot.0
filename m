From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2009 08:35:40 -0700
Subject: [Buildroot] JFFS2 / MTD suggestions
Message-ID: <20090407083540.15437e75@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When selecting jffs2 as the output filesystem, mtd-utils gets compiled
both on the host and on the target. I think that generating a jffs2
filesystem image should *not* trigger the compilation/installation of
mtd-utils inside the target since this is not necessary.

Moreover, the compilation of host mtd-utils fails with "lzo/lzo1.h not
found" if the liblzo-dev package is not installed on the host. We
should probably add a test checking this and telling the user to
install liblzo-dev, because the current state is quite confusing.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
