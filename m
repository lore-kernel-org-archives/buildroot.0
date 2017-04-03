From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 15:09:30 +0200
Subject: [Buildroot] [PATCH] dc3dd: gettextize to match newer gettext
 version
In-Reply-To: <20170403014222.2682-1-rprebello@gmail.com>
References: <20170403014222.2682-1-rprebello@gmail.com>
Message-ID: <20170403150930.466bd942@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 22:42:22 -0300, Rodrigo Rebello wrote:
> Because dc3dd is being autoreconfigured and comes with an old gettext
> infra, gettextize needs to be called so that the infra is updated to
> match the newer version used in Buildroot.
> 
> Commit b36d57fab included a patch to add the definition of MKDIR_P to
> po/Makefile.in.in in order to fix autobuild failures that ocurred when
> host-gettext was built before dc3dd. This patch is no longer necessary
> as gettextize adds a new Makefile template which contains the needed
> definition, so drop it.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  .../dc3dd/0003-po-fix-build-with-NLS-enabled.patch | 25 ----------------------
>  package/dc3dd/dc3dd.mk                             |  4 +++-
>  2 files changed, 3 insertions(+), 26 deletions(-)
>  delete mode 100644 package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
