From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Jun 2014 11:46:00 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v213
In-Reply-To: <20140604093947.GA2414@pc-eric>
References: <1401833204-32300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140604085129.70751c98@free-electrons.com>
 <20140604093947.GA2414@pc-eric>
Message-ID: <20140604114600.123cfc95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed, 4 Jun 2014 11:39:49 +0200, Eric Le Bihan wrote:

> Though a Makefile.am is changed, an autoreconf is not needed, as the configure
> script features "AM_MAINTAINER_MODE([enable])", so make will rebuild the
> associated Makefile.in by calling automake.

Correct, but that makes the assumption that 'automake' is installed on
the host system, because systemd does not depend on host-automake.
Therefore, it will fail to build on the autobuilders, which don't have
automake installed.

That's precisely why, as soon as an Makefile.am is changed, we have to
use <pkg>_AUTORECONF = YES, which will ensure
host-{autoconf,automake,libtool} are built.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
