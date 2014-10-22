From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 22 Oct 2014 11:39:11 +0100
Subject: [Buildroot] [PATCH v4] bash: fix linking for static builds with
 uClibc toolchains
In-Reply-To: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1413970840-17304-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5447894F.7070503@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2014 10:40 AM, Vicente Olivert Riera wrote:
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
It's best if you write something here ^^^ (below the ---, notes section)
when you send a new version of the patch so we now what changed from the
previous version, because it's not always obvious what changed between
the different versions.

For example


Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes since v3:
- Added foo

Changes since v2:
- Added bar

Changes since v1:
- More foobar

-- 
markos
