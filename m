From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 3 Nov 2013 22:32:24 +0200
Subject: [Buildroot] [PATCH 1/5] liburcu: bump to version 0.8.0
In-Reply-To: <20131102184145.1846e69a@skate>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
 <20131102184145.1846e69a@skate>
Message-ID: <CALdGsk+aXB9zNzYFONQ8MD9Fh+=Gc9-vcXrP-uLRmK97eqsA-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

With the upstream patch compilations still fails, because the doc makefile
tries to use the host linker (/usr/bin/ld) to link against the target
liburcu.

Making all in doc
make[3]: Entering directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc'
Making all in examples
make[4]: Entering directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples'
/usr/bin/make -f dist-files/Makefile AM_CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../../../urcu/ -I../../../"
AM_CFLAGS='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os ' AM_LDFLAGS=' -L../../../.libs/
-Wl,-rpath="/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples/../../.libs/"'
all
make[5]: Entering directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples'
/usr/bin/make -C hlist
make[6]: Entering directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples/hlist'
/usr/bin/make -f Makefile.cds_hlist_add_head_rcu
make[7]: Entering directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples/hlist'
cc  -g -O2 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I../../../urcu/ -I../../../ -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  \
        -c -o cds_hlist_add_head_rcu.o cds_hlist_add_head_rcu.c
cc -g -O2 -Wall  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -L../../../.libs/
-Wl,-rpath="/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples/../../.libs/"
\
        -o cds_hlist_add_head_rcu cds_hlist_add_head_rcu.o -lurcu
/usr/bin/ld: skipping incompatible ../../../.libs//liburcu.so when
searching for -lurcu
/usr/bin/ld: skipping incompatible ../../../.libs//liburcu.a when searching
for -lurcu
/usr/bin/ld: cannot find -lurcu
collect2: error: ld returned 1 exit status
make[7]: *** [cds_hlist_add_head_rcu] Error 1
make[7]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples/hlist'
make[6]: *** [all] Error 2
make[6]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples/hlist'
make[5]: *** [all] Error 2
make[5]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples'
make[4]: *** [all-local] Error 2
make[4]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc/examples'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0/doc'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/incognito/buildroot-new/output/build/liburcu-0.8.0'
make: ***
[/home/incognito/buildroot-new/output/build/liburcu-0.8.0/.stamp_built]
Error 2

Regards

Olivier Schonken


On Sat, Nov 2, 2013 at 7:41 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Olivier Schonken,
>
> On Wed, 30 Oct 2013 22:20:08 +0200, Olivier Schonken wrote:
> > Also added a patch to keep liburcu from trying to build examples in doc
> directory,
> > which breaks cross-compilation when enabled.
> >
> > Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> > ---
> >  .../liburcu/0001-Removed-Examples-from-doc.patch   | 22
> ++++++++++++++++++++++
> >  package/liburcu/liburcu.mk                         |  3 ++-
> >  2 files changed, 24 insertions(+), 1 deletion(-)
> >  create mode 100644 package/liburcu/0001-Removed-Examples-from-doc.patch
>
> Can you instead integrate the upstream fix for the examples build
> problem? See
>
> http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=3343c545bbc5154d42dd37cd3ae869ef97555e00
> for the patch.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131103/20737be2/attachment.html>
