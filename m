From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:09:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/uclibc: fix termios
 redefinition issue for PowerPC
In-Reply-To: <20190908072959.2526-1-vadim4j@gmail.com>
References: <20190908072959.2526-1-vadim4j@gmail.com>
Message-ID: <20190915220912.1322cc3e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Sep 2019 10:29:59 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Fix redefinition of 'struct termios' by syncing termios powerpc headers
> from glibc, the commit which fixed the same issue in glibc:
> 
>     d4795e4a43e6f0c221bc5dc64c612206a21a177b PowerPC: Fix termios definitions
> 
>     https://sourceware.org/git/?p=glibc.git;a=commit;h=d4795e4a43e6f0c221bc5dc64c612206a21a177b
> 
> it fixed the following bug request:
> 
>     https://bugzilla.redhat.com/show_bug.cgi?id=1122714
> 
> In case of Buildroot it fixes flashrom build for PowerPC.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/797dde5cbf0e94162c7cc7b557841605c78ac2f3/
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

I've applied, thanks!

> P.S.
> It is funny that buildroot patch was applied to uclibc:
> 
>     https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=14c36638c1a125b1c2d06857c7e7c44f266d0e8e
> 
> I dont understand how it was happened, I also sent notes about it to the devel at uclibc-ng.org.

The bogus patch was reverted in
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=8bcbb7f3188e3322d6063343ada991b29198092d,
but interestingly, I don't see the correct patch being applied. Weird.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
