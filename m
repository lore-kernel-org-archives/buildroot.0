From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 15:20:54 +0200
Subject: [Buildroot] [PATCH 1/1] mysql: fix build failure on MIPS
In-Reply-To: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
References: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
Message-ID: <20140421152054.2e3fbbdc@skate>
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

Thanks, but I've fixed the problem in a different way, see
http://git.buildroot.net/buildroot/commit/?id=8104fd72ed6fee97f024ec75a4ed81231e2777b8.
Basically disabling the maintainer mode of MySQL (which is meant for
MySQL developers) allows to get rid of -Werror and solves the build
issue.

BTW, do you plan to upgrade MySQL to a more recent version? The 5.1.x
version we use seems to be quite old, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
