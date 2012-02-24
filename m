From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2012 21:31:31 +0100
Subject: [Buildroot] Compile Linux with Buildroot for i.MX28 EVK
In-Reply-To: <63D6870D443E63419AC4A0C97B86C092030FCA28@MBXCLUSTER.mdh.local>
References: <20120223171716.GA5622@tarshish>
 <63D6870D443E63419AC4A0C97B86C092030FCA22@MBXCLUSTER.mdh.local>
 <CAGm1_kut30F-BRwP8pwxbonFGJkJATSKBcJpisE0C1=QY9Ld9Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA23@MBXCLUSTER.mdh.local>
 <CAGm1_ksrQ9Hp6LL4YiETokRf5gvJDpx3hmLqEUdSMg8eFE_xVA@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA24@MBXCLUSTER.mdh.local>
 <CAGm1_kuoq9uoEPVDUftFeUS9xfrtri_GTf-r9R0fuoZ1=woH3Q@mail.gmail.com>
 <63D6870D443E63419AC4A0C97B86C092030FCA25@MBXCLUSTER.mdh.local>
 <20120224154055.GB6613@game.jcrosoft.org>
 <63D6870D443E63419AC4A0C97B86C092030FCA26@MBXCLUSTER.mdh.local>
 <20120224163510.GC6613@game.jcrosoft.org>
 <63D6870D443E63419AC4A0C97B86C092030FCA28@MBXCLUSTER.mdh.local>
Message-ID: <20120224213131.4fe770e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Feb 2012 17:46:55 +0100,
Mikael ?sberg <mikael.asberg@mdh.se> a ?crit :

> Maybe I can de-compress a zImage to a "raw" Image, is that what you
> did?

On ARM, arch/arm/boot/Image is the raw uncompressed version of the
kernel. You can try to load it and jump to the beginning of it. You can
turn it into an uImage by calling mkimage on it.

However, as suggested by Jean-Christophe, you should really try LZO. It
is a very good trade-off between kernel size and decompression time.
Remember that using an uncompressed kernel means that you have a *lot*
more data to load from flash to RAM, which allows take time. Usually
LZO is a great compromise here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
