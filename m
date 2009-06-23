From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 23 Jun 2009 22:14:15 +0200
Subject: [Buildroot] How to rebuild following .config change?
In-Reply-To: <h1rchh$9du$1@ger.gmane.org>
References: <h1rchh$9du$1@ger.gmane.org>
Message-ID: <20090623201415.GC22116@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 23, 2009 at 08:05:06PM +0000, Grant Edwards wrote:
>Several times in the past week, I've gotten things terminally
>broken: where it's impossible to build after doing a "make
>menuconfig" or "make uclibc-menuconfg" and changing a
>configuration setting.
>
>It appears that you can't reliably make a configuration change
>and then do a "make".
>
>Doing a "make clean" doesn't appear to be enough either, since
>often a "make" still fails or doesn't rebuild certain things.
>
>You can do a "distclean", but then all the sources get
>re-downloaded and toolchains re-built -- which takes a _long_
>time.

if you set your DL_DIR != down then they are not wiped.
Alternatively you can rm -rf ${yourarch}_*, e.g.
rm -rf powerpc_nofpu_nommu_*
(or maybe not, not sure if Peter picked that convenience up already).
>
>How does one re-build appropriate packages after a
>configuration change.

My tree (search archives) has quite some improvements in this area,
perhaps you want to distill those out and submit it for review and
inclusion?

TIA and cheers,
