From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 10:49:50 +0100
Subject: [Buildroot] [PATCH buildroot-test 1/2] autobuild-run: do not
 build strongswan using an incompatible toolchain
In-Reply-To: <1441965048-30856-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441965048-30856-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151004104950.4f9b0f42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 11 Sep 2015 10:50:47 +0100, Vicente Olivert Riera wrote:
> This external MIPS toolchain uses eglibc-2.18 which lacks the definition
> of the SYS_getdents64 macro for MIPS64 n64. Because of that, strongswan
> package fails to build and shows this error message:
> 
> utils/utils.c: In function 'closefrom':
> utils/utils.c:151:25: error: 'SYS_getdents64' undeclared (first use in
> this function)
>    while ((len = syscall(SYS_getdents64, dir_fd, buffer,
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ea2/ea2be188b88ceb1cad4314bdaf00184cb74b9e26/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

Both patches applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
