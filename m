From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:52:59 +0200
Subject: [Buildroot] [PATCH] keyutils: Bump version to 1.5.9,
 fix patches and static build
In-Reply-To: <1411401596-26802-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1411401596-26802-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140923215259.3644f7ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 22 Sep 2014 16:59:56 +0100, Vicente Olivert Riera wrote:
> - Bump version to 1.5.9
> - Remove patches already included in this version
> - Use make parameters instead of environment variables
> - Add an upstream patch to fix building statically
> - Adapt old patches to the new version
> 
> Fixes:
>   http://autobuild.buildroot.net/results/ced/ced596bd1c73286f7044f5a8e11b6588fc973f11/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...ng-of-the-shared-library-to-be-suppressed.patch |  104 ++++++++++++++++++++
>  .../keyutils-01-memleak-from-realloc.patch         |   51 ----------
>  package/keyutils/keyutils-02-another-memleak.patch |   32 ------
>  ...le.patch => keyutils-02-fix-install-rule.patch} |   13 ++-
>  .../keyutils-04-Makefile-for-buildroot.patch       |   64 ++----------
>  package/keyutils/keyutils.mk                       |   24 +++--
>  6 files changed, 135 insertions(+), 153 deletions(-)
>  create mode 100644 package/keyutils/keyutils-01-allow-building-of-the-shared-library-to-be-suppressed.patch
>  delete mode 100644 package/keyutils/keyutils-01-memleak-from-realloc.patch
>  delete mode 100644 package/keyutils/keyutils-02-another-memleak.patch
>  rename package/keyutils/{keyutils-05-fix-install-rule.patch => keyutils-02-fix-install-rule.patch} (57%)

This fails to build with:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -L. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os    -o keyctl keyctl.o -lkeyutils
/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -L. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os    -o request-key request-key.o -lkeyutils
key.dns_resolver.c:55:22: fatal error: keyutils.h: No such file or directory
 #include <keyutils.h>

While it builds fine before your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
