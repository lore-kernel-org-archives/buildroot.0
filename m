From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 17:55:42 +0100
Subject: [Buildroot] [PATCH 1/2] trinity: fix typo in MIPS' GET_FP_MODE
 and SET_FP_MODE macros
In-Reply-To: <1450105236-11224-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450105236-11224-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151214175542.2e5d3b2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 14 Dec 2015 15:00:35 +0000, Vicente Olivert Riera wrote:
> Add a patch to fix a typo in the syscalls/prctl.c file. The
> PR_GET_FP_MODE and PR_SET_FP_MODE macros are defined in
> include/compat.h, but then syscalls/prctl.c tries to use GET_FP_MODE and
> SET_FP_MODE. It's lacking the PR_ preffix, and this is causing build
> failures like this one:
> 
>   CC	syscalls/prctl.o
> syscalls/prctl.c:37:2: error: 'GET_FP_MODE' undeclared here (not in a
> function)
>   GET_FP_MODE, SET_FP_MODE,
>   ^
> syscalls/prctl.c:37:15: error: 'SET_FP_MODE' undeclared here (not
> in a function)
>   GET_FP_MODE, SET_FP_MODE,
>                ^
> 
> This patch has been sent upstream.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/12f/12f3144b5d99aa1872f6073f3aaac7f8a9c5cfdc/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/trinity/0001-mips-fix-prctl-s.patch | 39 +++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/trinity/0001-mips-fix-prctl-s.patch

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
