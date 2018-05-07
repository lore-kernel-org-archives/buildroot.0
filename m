From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 13:28:50 +0200
Subject: [Buildroot] [PATCH 2/4] skeleton-custom: install /bin, /lib,
 and /sbin
In-Reply-To: <1990732966.12593.1525691808010.JavaMail.zimbra@datacom.com.br>
References: <20180506213116.25084-1-casantos@datacom.ind.br>
 <20180506213116.25084-3-casantos@datacom.ind.br>
 <20180507090811.18489751@windsurf>
 <1990732966.12593.1525691808010.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180507132850.6149ac14@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 7 May 2018 08:16:48 -0300 (BRT), Carlos Santos wrote:

> > Of course, I am fine with checking that the skeleton complies with the
> > BR2_ROOTFS_MERGED_USR option, but preventing the skeleton from
> > having /bin, /lib and /sbin looks weird. So much that it needs to be
> > mentioned in the documentation.  
> 
> Notice that I used ?should? in the documentation, not ?must?. It is
> still OK to have /bin, /lib and /sbin in custom skeletons and rootfs
> overlays if BR2_ROOTFS_MERGED_USR is not set.

Ah, OK, but then the explanation should be worded differently. What
about something like:

"""

When +BR2_ROOTFS_MERGED_USR+ is enabled, then the custom skeleton must
not contain the +/bin+, +/lib+ or +/sbin+ directories, as Buildroot
will create them as symbolic links to the relevant folders in +/usr+.
In such a situation, should the skeleton have any programs or
libraries, they should be placed in +/usr/bin+, +/usr/sbin+ and
+/usr/lib+.

"""

Or something along those lines.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
