From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:06:27 +0100
Subject: [Buildroot] [git commit] Makefile: respect strip exclusions for
 special libraries
In-Reply-To: <CANQCQpYFv3Gt_dkg_T_7ppb1Fiy8JmXsHX6pDrGvJzZrZOvRhg@mail.gmail.com>
References: <20190204155559.02D428385C@busybox.osuosl.org>
 <CANQCQpYFv3Gt_dkg_T_7ppb1Fiy8JmXsHX6pDrGvJzZrZOvRhg@mail.gmail.com>
Message-ID: <20190204210627.4fe621fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 4 Feb 2019 12:58:08 -0600
Matthew Weber <matthew.weber@collins.com> wrote:

> > +# Special stripping (only debugging symbols) for libpthread and ld-*.so.
> > +STRIP_FIND_SPECIAL_LIBS_CMD = \
> > +       $(STRIP_FIND_COMMON_CMD) \
> > +       \( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \  
> 
> The answer to you question about needing to strip libpthread for only
> glibc is true.  I did poke around a bit and checked if libthread_db
> needed symbols and verified it can be stripped.  Do you think a noted
> should be added to state the libpthread stripping detail?

So basically thread debugging on musl/uclibc works even if libc.so is
stripped ?

In any case, thanks for you investigation on this. I'm not sure adding
a note here is really useful: uclibc/musl simply don't have any
libpthread, and it's OK to not do anything special for uclibc/musl here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
