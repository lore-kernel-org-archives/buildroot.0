From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 4 Apr 2021 20:35:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/iproute2: Bump version to 5.11.0
In-Reply-To: <20210404155259.196253ae@windsurf.home>
References: <20210323181004.25172-1-petr.vorel@gmail.com>
 <20210404155259.196253ae@windsurf.home>
Message-ID: <YGoG2Tqk6SVPHNpJ@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
> Hello Petr,

> On Tue, 23 Mar 2021 19:10:04 +0100
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi,

> > NOTE: this should not be applied until uclibc based toolchains are
> > regenerated. But posted for people who don't use uclibc and would like
> > to have iproute2 sync with kernel version.

> I think they have all been updated now. However, your patch doesn't
> apply: it assumes that Buildroot master has iproute2 5.8.0, but we have
> 5.7.0. And the patch we have in package/iproute2/ doesn't apply to
> 5.11.0. Could you have a look and respin?

Sure, I'll send fixed version, sorry for error.

But I tried to build on updated package and it looks like error still exists.
What do I do wrong?

br-test-pkg/bootlin-armv5-uclibc/host/bin/arm-linux-gcc -Wall -Wstrict-prototypes  -Wmissing-prototypes -Wmissing-declarations -Wold-style-definition -Wformat=2 -O2 -pipe -I../include -I../include/uapi -DRESOLVE_HOSTNAMES -DLIBDIR=\"/usr/lib\" -DCONFDIR=\"/etc/iproute2\" -DNETNS_RUN_DIR=\"/var/run/netns\" -DNETNS_ETC_DIR=\"/etc/netns\" -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -DXT_LIB_DIR=\"/usr/lib/xtables\" -DHAVE_SETNS -fPIC   -c -o mpls_pton.o mpls_pton.c
fs.c:204:7: warning: implicit declaration of function ?open_by_handle_at? [-Wimplicit-function-declaration]
  204 |  fd = open_by_handle_at(mnt_fd, fhp, 0);
      |       ^~~~~~~~~~~~~~~~~
fs.c:172:7: warning: unused variable ?fh_buf? [-Wunused-variable]
  172 |  char fh_buf[sizeof(struct file_handle) + sizeof(__u64)] = { 0 };

Kind regards,
Petr

> Thanks a lot!

> Thomas
