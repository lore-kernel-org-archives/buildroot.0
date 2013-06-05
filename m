From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jun 2013 20:00:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-06-04
In-Reply-To: <20130605170058.GA3185@free.fr>
References: <20130605063004.4425352C13E@lolut.humanoidz.org>
 <20130605182924.71a07679@skate> <20130605170058.GA3185@free.fr>
Message-ID: <20130605180011.GD3185@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-05 19:00 +0200, Yann E. MORIN spake thusly:
> On 2013-06-05 18:29 +0200, Thomas Petazzoni spake thusly:
> > On Wed,  5 Jun 2013 08:30:04 +0200 (CEST), Thomas Petazzoni wrote:
> > >                   libbsd-0.4.2 | 12

Patch sent.

> > > dtc-e4b497f367a3b2ae99cc520... | 3 

Gustavo already sent a fix.

> > >                 libiscsi-1.6.0 | 1 

I don't know what to do with this one. It seems like another wrapper
issue:

    /bin/bash ./libtool  --tag=CC   --mode=link
        /home/test/test/1/output/host/usr/bin/mips64el-unknown-linux-gnu-gcc
        -Wall -W -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-align
        -Wwrite-strings -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
        -D_FILE_OFFSET_BITS=64  -pipe -Os  -ldl  -o bin/iscsi-test
        test-tool/bin_iscsi_test-iscsi-test.o
        [--SNIP lots of .o files--]
        test-tool/bin_iscsi_test-1020_bufferoffset_invalid.o lib/libiscsi.la
        -lpopt 
    /home/test/test/1/output/host/usr/bin/mips64el-unknown-linux-gnu-ld:
    src/bin_ld_iscsi-ld_iscsi.o: ABI is incompatible with that of the
    selected emulation
    /home/test/test/1/output/host/usr/bin/mips64el-unknown-linux-gnu-ld:
    failed to merge target specific data of file src/bin_ld_iscsi-ld_iscsi.o
    /home/test/test/1/output/host/usr/bin/mips64el-unknown-linux-gnu-ld:
    lib/.libs/libiscsi_convenience.a(connect.o): ABI is incompatible with
    that of the selected emulation
    [--SNIP--]
    /home/test/test/1/output/host/usr/bin/mips64el-unknown-linux-gnu-ld:
    final link failed: File in wrong format

> > >                   libedit-2.11 | 1 

libedit: no longer available on MIPS, since it depends on libbsd, which
is not available on MIPS.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
