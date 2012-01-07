From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jan 2012 10:42:07 +0100
Subject: [Buildroot] [PATCH] Improved git download method performance.
In-Reply-To: <201201061740.10676.minimod@morethan.org>
References: <54DB0A5039192D48A770D406992C75BC28EC825859@DFW1MBX21.mex07a.mlsrvr.com>
 <201201061740.10676.minimod@morethan.org>
Message-ID: <20120107104207.1a874edc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 6 Jan 2012 17:40:08 -0600,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> > Also the $($(PKG)_SOURCE) default is changed to .tar instead
> > of .tar.gz. This removes unneeded compression and decompression.
> 
> But some parts of the world charge per/byte still.

The move to .tar only changes the fact that tarball are saved
uncompressed in the $(DL_DIR). It does not change anything to the
amount of data transferred over the network, if I understand correctly.
But it's true that the size difference of a Linux kernel tarball
uncompressed and compressed is quite significant.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
