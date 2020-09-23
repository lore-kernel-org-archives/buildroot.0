From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 14:21:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-11
In-Reply-To: <CA+h8R2qENZw1QQKcW628FCHf-tS7JHRrNPa4NMV7QUGE=RKFrg@mail.gmail.com>
References: <5f5c7475.1c69fb81.de413.a4f5SMTPIN_ADDED_MISSING@mx.google.com>
 <CA+h8R2qENZw1QQKcW628FCHf-tS7JHRrNPa4NMV7QUGE=RKFrg@mail.gmail.com>
Message-ID: <20200923142158.7383c841@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Sep 2020 00:18:34 -0700
Christian Stewart <christian@paral.in> wrote:

> I think host-go always fails on mips64, due to:
> 
> tmp/go-link-094754572/go.o: in function `internal/cpu.Initialize':
> /srv/storage/autobuild/run/instance-3/output-1/host/lib/go/src/internal/cpu/cpu.go:137:(.text+0x14):
> relocation R_MIPS_26 against `a local symbol' cannot be used when
> making a shared object; recompile with -fPIC
> 
> Not familiar with mips - is this something with cflags? Need -fPIC
> here for position-independent code conditional on mips?

It's difficult to really say as there's not much output from how
host-go is building the target libraries. However, everything that goes
into a shared library indeed needs to be built with -fPIC, and MIPS is
particularly picky about this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
