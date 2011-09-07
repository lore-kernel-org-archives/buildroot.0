From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Sep 2011 16:11:21 +0200
Subject: [Buildroot] [PATCH] intltool: use built host libexpat during
 configure
In-Reply-To: <j47s9g$n6q$1@dough.gmane.org>
References: <20110906191020.GA29969@berrier.lan>
 <20110906232416.077d2091@skate> <j47s9g$n6q$1@dough.gmane.org>
Message-ID: <20110907161121.41b2a43b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 07 Sep 2011 07:41:03 -0600,
Wade Berrier <wberrier@gmail.com> a ?crit :

> So, am I correct when guessing the culprit is Expat.so? (missing rpath
> to libexpat.so.1)

Well, here Expat.so has a correct rpath:

$ readelf -d output/host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so | grep RPATH
 0x000000000000000f (RPATH)              Library rpath: [/home/thomas/projets/buildroot/output/host/usr/lib]

Can you check the output of the same command for Expat.so ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
