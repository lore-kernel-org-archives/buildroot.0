From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:12:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: disable examples
In-Reply-To: <20200914220015.3544577-1-fontaine.fabrice@gmail.com>
References: <20200914220015.3544577-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919211243.24fb53ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 00:00:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Do not build examples to avoid a build failure on rtop example which
> depends on ncurses and has been added in version 4.11.0 with
> https://sourceforge.net/p/perfmon2/libpfm4/ci/7d1ec562ddbb2af2d6b7af8cec78b03213a3e4ce
> 
> /tmp/instance-0/output-1/host/bin/arm-linux-gcc   -I. -I/tmp/instance-0/output-1/build/libpfm4-4.11.0/perf_examples/../include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -I. -D_GNU_SOURCE -pthread -o rtop  rtop.o perf_util.o /tmp/instance-0/output-1/build/libpfm4-4.11.0/perf_examples/../lib/libpfm.a  -lpthread -lncurses -ltinfo -lm
> /tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find -ltinfo
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8ad23a82bcf32cd22256f9984a8f4cfa45951eee
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libpfm4/libpfm4.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
