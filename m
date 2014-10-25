From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:45:28 +0200
Subject: [Buildroot] [PATCH v4] bash: fix linking for static builds with
 uClibc toolchains
In-Reply-To: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141025124528.651b5ab9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 22 Oct 2014 10:40:40 +0100, Vicente Olivert Riera wrote:
> bash fails to link for static builds with uClibc toolchains due to
> getenv redefinitions. This is caused because bash is unable to check if
> getenv is already defined when cross-compiling, so it defaults to 'yes':
> 
> configure:14438: WARNING: cannot check getenv redefinition if cross
> compiling -- defaulting to yes
> 
> We can avoid this redefinition by passing bash_cv_getenv_redef=no to the
> configure script.
> 
> Related:
> 	http://lists.gnu.org/archive/html/bug-bash/2012-03/msg00052.html
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/a20/a2007e6dbcfe53e7cd837ae642869ee26376826a/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/bash/bash.mk |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
