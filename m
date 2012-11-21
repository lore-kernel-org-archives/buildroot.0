From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 10:53:02 +0100
Subject: [Buildroot] QtWebKit problem
In-Reply-To: <1353490900.77327.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1353490900.77327.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <20121121105302.04d751ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran Djordjevic,

On Wed, 21 Nov 2012 01:41:40 -0800 (PST), Zoran Djordjevic wrote:
> I've built linux with Qt support, and later decided to add
> QtWebKit. I checked it, and rebuild (previously deleting
> stamp.build and stamp.install in ../output/build/qt-4.7.4)
> After building I didn't get QtWebKit in .../sysroot/usr/include.
> Where I go wrong ?

Don't do magic with stamp files, do:

	make qt-reconfigure

Or preferably, a 'make clean all' cycle.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
