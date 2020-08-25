From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 10:08:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: new package
In-Reply-To: <CALFsTFUuBM9uJKo9Gz4jx2PV3TwwuJs5gcKySrTJih21ZHyt7Q@mail.gmail.com>
References: <20200824214857.4090659-1-joseph.kogut@gmail.com>
 <CALFsTFUuBM9uJKo9Gz4jx2PV3TwwuJs5gcKySrTJih21ZHyt7Q@mail.gmail.com>
Message-ID: <20200825100821.49937320@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

Thanks for reviewing!

On Tue, 25 Aug 2020 09:41:28 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> > +       bool "python-pycups"
> > +       depends on BR2_PACKAGE_CUPS  
> Since this package wraps the CUPS API and uses the cups package, you
> should select BR2_PACKAGE_CUPS instead of depending on it (and add the
> additional "depends on" sections from cups).

I perhaps wouldn't be so strict on this. When a dependency is
"obvious", it is quite OK to have a "depends on". In this case, I
believe the user who wants python-pycups will realize that CUPS is
needed in the system, so I find a "depends on" dependency to be quite
OK in this case. Using "depends on" has the advantage that we don't
have to replicate the "depends on" from BR2_PACKAGE_CUPS.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
