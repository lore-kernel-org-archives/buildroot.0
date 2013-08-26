From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 11:16:30 +0200
Subject: [Buildroot] [PATCH] elf2flt: upgrade to latest version
In-Reply-To: <1376414751-3447-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376414751-3447-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130826111630.6704aef6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 13 Aug 2013 14:25:51 -0300, Gustavo Zacarias wrote:
> Upgrade to the latest uclinux CVS snapshot, gives us blackfin support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/elf2flt/Config.in.host     |    2 +-
>  package/elf2flt/src/Makefile.in    |   77 +-
>  package/elf2flt/src/README         |    2 +-
>  package/elf2flt/src/compress.c     |  198 ++
>  package/elf2flt/src/compress.h     |   44 +
>  package/elf2flt/src/config.sub     |    8 +-
>  package/elf2flt/src/configure      | 5934 +++++++++++++++++++++++-------------
>  package/elf2flt/src/configure.in   |  112 +-
>  package/elf2flt/src/elf2flt.c      |  699 ++---
>  package/elf2flt/src/elf2flt.ld     |  179 --
>  package/elf2flt/src/elf2flt.ld.in  |  210 ++
>  package/elf2flt/src/flat.h         |    2 +
>  package/elf2flt/src/flthdr.c       |  304 +-
>  package/elf2flt/src/ld-elf2flt.c   |  580 ++++
>  package/elf2flt/src/ld-elf2flt.in  |   38 +-
>  package/elf2flt/src/maketarball.sh |   12 -
>  package/elf2flt/src/stubs.c        |  129 +-
>  package/elf2flt/src/stubs.h        |   75 +
>  18 files changed, 5568 insertions(+), 3037 deletions(-)
>  create mode 100644 package/elf2flt/src/compress.c
>  create mode 100644 package/elf2flt/src/compress.h
>  delete mode 100644 package/elf2flt/src/elf2flt.ld
>  create mode 100644 package/elf2flt/src/elf2flt.ld.in
>  create mode 100644 package/elf2flt/src/ld-elf2flt.c
>  delete mode 100755 package/elf2flt/src/maketarball.sh
>  create mode 100644 package/elf2flt/src/stubs.h

Instead of having the source code within Buildroot, can't we fetch it
from whatever CVS/Git repository it is available from?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
