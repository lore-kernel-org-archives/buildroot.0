From: Nathan Lynch <ntl@pobox.com>
Date: Tue, 07 May 2013 21:09:15 -0500
Subject: [Buildroot] [PATCH 2/6] package/libbsd: new package
In-Reply-To: <76440f71466575498fd576fc04cbbdc7cda8d6f3.1360433324.git.yann.morin.1998@free.fr>
References: <cover.1360433324.git.yann.morin.1998@free.fr>
 <76440f71466575498fd576fc04cbbdc7cda8d6f3.1360433324.git.yann.morin.1998@free.fr>
Message-ID: <1367978955.3081.49.camel@orca.stoopid.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 2013-02-09 at 19:09 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in        |    1 +
>  package/libbsd/Config.in |   10 ++++++++++
>  package/libbsd/libbsd.mk |   21 +++++++++++++++++++++
>  3 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 package/libbsd/Config.in
>  create mode 100644 package/libbsd/libbsd.mk

This is a few months old by now, but for what it's worth:

Acked-by: Nathan Lynch <ntl@pobox.com>

I happen to use libbsd for a mips target but hadn't gotten around to
submitting it myself.

I see you've posted patches adding libbsd a few times over the last few
months; it looks like it was related to your qemu efforts but not
committed so far.  Are you still working on having it included?

Any ideas on this libbsd build error with mips (which seems to lack an
a.out.h)?  I've hacked around it locally by just hacking nlist.c out of
the build, but that's not exactly satisfactory.  The error can be
recreated by using the following config and setting BR2_PACKAGE_LIBBSD=y
on current master with your patch applied:

http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-mipsel-o32-full.config

libbsd 0.4.2 Building
PATH="/home/nathanl/devel/buildroot.git/output/host/bin:/home/nathanl/devel/buildroot.git/output/host/usr/bin:/home/nathanl/devel/buildroot.git/output/host/usr/sbin/:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/nathanl/.local/bin:/home/nathanl/bin" PERLLIB="/home/nathanl/devel/buildroot.git/output/host/usr/lib/perl"  /usr/bin/make -j16  -C /home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2/
make[1]: Entering directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2'
/usr/bin/make  all-recursive
make[2]: Entering directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2'
Making all in include
make[3]: Entering directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2/include'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2/include'
Making all in man
make[3]: Entering directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2/man'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2/man'
Making all in src
make[3]: Entering directory `/home/nathanl/devel/buildroot.git/output/build/libbsd-0.4.2/src'
  CC     arc4random.lo
  CC     bsd_getopt.lo
  CC     closefrom.lo
  CC     dehumanize_number.lo
  CC     err.lo
  CC     expand_number.lo
  CC     fgetln.lo
  CC     flopen.lo
  CC     fmtcheck.lo
  CC     getpeereid.lo
  CC     fpurge.lo
  CC     md5.lo
  CC     md5hl.lo
  CC     humanize_number.lo
  CC     heapsort.lo
  CC     inet_net_pton.lo
  CC     merge.lo
  CC     nlist.lo
  CC     pidfile.lo
  CC     progname.lo
  CC     radixsort.lo
  CC     readpassphrase.lo
In file included from nlist.c:42:0:
/home/nathanl/devel/buildroot.git/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/include/a.out.h:1:25: fatal error: linux/a.out.h: No such file or directory
compilation terminated.
