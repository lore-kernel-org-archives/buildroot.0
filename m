From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jul 2010 15:44:15 +0200
Subject: [Buildroot] BR:Qt doesn't compile
In-Reply-To: <L5LNV3$BD4F538B66E3CB48DC7DF51A238DA643@aruba.it>
References: <L5LNV3$BD4F538B66E3CB48DC7DF51A238DA643@aruba.it>
Message-ID: <20100715154415.0e3ab363@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Jul 2010 14:54:39 +0200
"Luca Ceresoli" <list@lucaceresoli.net> wrote:

> > Creating qmake. Please wait...
> > make[1]: Entering directory
> > `/home/noy/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
> > make[1]: Leaving directory
> > `/home/noy/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
> > MySQL support cannot be enabled due to functionality tests!
> >  Turn on verbose messaging (-v) to ./configure to see the final
> > report. If you believe this message is in error you may use the
> > continue switch (-continue) to ./configure to continue.
> > make: ***
> > [/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
> > Error 101
> 
> Have a look to this bug report, I suspect it's the same problem you
> hit. There's a patch that could work.
> 
> https://bugs.busybox.net/show_bug.cgi?id=2221

I'm currently looking at this problem (that I managed to reproduce).
The patch in 2221 is almost correct, but not sufficient. The dependency
is on "mysql_client" and not "mysql", and even after that, there are
build issues due to the fact that mysql headers and libraries are
installed in $(STAGING_DIR)/usr/include/mysql and
$(STAGING_DIR)/usr/lib/mysql.

I'm currently looking into this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
