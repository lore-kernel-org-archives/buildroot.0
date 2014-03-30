From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Mar 2014 00:19:07 +0200
Subject: [Buildroot] [PATCH 1/1] mysql: fix build failure on MIPS
In-Reply-To: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
References: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
Message-ID: <20140331001907.58b9e8c1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcelo Guti?rrez,

On Sun, 30 Mar 2014 18:48:51 -0300, Marcelo Guti?rrez wrote:
> Fixes:
> http://autobuild.buildroot.net/results/6b61f90d1a36ba43ff568933bb74975128380516/
> 
> Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
> ---
>  .../mysql-0006-fix_build_failure_on_MIPS.patch     |  115 ++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 package/mysql/mysql-0006-fix_build_failure_on_MIPS.patch

Wouldn't it be simpler to just not build mysql with -Werror ?
Unfortunately, I don't really see a simple way of doing that without
modifying mysql's configure.in.

In any case, why do you believe the problem is specific to the MIPS
architecture?

See for example
http://autobuild.buildroot.org/results/7b0/7b06ce77b72db980493260602a5104e2c39e1bf5/build-end.log.
It's the exact same problem, but on x86-64.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
