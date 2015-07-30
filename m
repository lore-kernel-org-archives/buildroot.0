From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 30 Jul 2015 16:54:55 -0500
Subject: [Buildroot] [PATCH v4 2015.08 0/4] Generate package size
	statistics
In-Reply-To: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAMQcK5JjmneoRgJri0C3Lx5agSgmr+dquPs6oaPca6es==dMmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 25, 2015 at 4:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Thomas Petazzoni (4):
>   pkg-generic: add step_pkg_size global instrumentation hook
>   support/scripts: add size-stats script
>   Makefile: implement a size-stats target
>   docs/manual: add section about size graphing
>
>  Makefile                     |   9 ++
>  docs/manual/common-usage.txt |  39 +++++++
>  package/pkg-generic.mk       |  32 ++++++
>  support/scripts/size-stats   | 238 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 318 insertions(+)
>  create mode 100755 support/scripts/size-stats

We have been rebasing your patch on top of the latest master and since
around July 23rd (that is when we jumped to from June) it doesn't
appear the graph generation is working anymore. I think it has to do
with how you are treating the filesystem skeleton now as a package but
really don't know if that is the case or not.

Here is the error that is happening when we try to get the package stats:

umask 0022 && make -C /tmp/linux/buildroot
O=/tmp/linux/build/test-build/. size-stats
usage: size-stats [-h] --builddir BUILDDIR [--graph GRAPH]
                  [--file-size-csv FILE_SIZE_CSV]
                  [--package-size-csv PKG_SIZE_CSV] --skeleton-path
                  SKELETON_PATH
size-stats: error: argument --skeleton-path/-s: expected one argument
make[4]: *** [size-stats] Error 2
make[3]: *** [_all] Error 2
Failed to graph the package size statistics

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
