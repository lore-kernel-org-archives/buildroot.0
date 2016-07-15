From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:25:24 +0200
Subject: [Buildroot] [PATCH v1] log4cpp: fix musl compile
In-Reply-To: <1468271611-28362-1-git-send-email-ps.report@gmx.net>
References: <1468271611-28362-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160715132524.219f82c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 23:13:31 +0200, Peter Seiderer wrote:
> Include proper config.h (via log4cpp/Portability.hh) to fix the
> evaluate of LOG4CPP_HAVE_STDINT_H in the file tests/Clock.hh
> 
> Fixes [1]:
> 
>   Clock.hh:17:13: error: 'int64_t' does not name a type
>        typedef int64_t usec_t;
> 
> [1] http://autobuild.buildroot.net/results/186/1867632f30531da69f06b965bc833817400f618f
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/log4cpp/0001-Fix-musl-compile.patch | 34 +++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/log4cpp/0001-Fix-musl-compile.patch

Applied to master, thanks. Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
