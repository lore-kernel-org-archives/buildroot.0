From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 22:07:55 +0200
Subject: [Buildroot] [PATCH 1/2] gdb: add upstream patch to fix
 inconsistency with glibc header
In-Reply-To: <20170326224032.10708-1-arnout@mind.be>
References: <20170326224032.10708-1-arnout@mind.be>
Message-ID: <20170328220755.668a4cbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Mar 2017 00:40:31 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> In glibc 2.25, the proc_service.h header was copied from gdb to glibc.
> However, in the process the 'const' was removed, which leads to build
> failures with glibc >= 2.25.
> 
> gdb 7.12.1 already contains this patch. The patch for 7.11.1 comes
> straight from upstream, the patch for 7.10.1 is backported by me.
> 
> Fixes http://autobuild.buildroot.net/results/6b1b44e72147113b3f0e3f049cb9026d6c7dffb7
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...7-Sync-proc_service-definition-with-GLIBC.patch | 287 +++++++++++++++
>  ...2-Sync-proc_service-definition-with-GLIBC.patch | 389 +++++++++++++++++++++
>  2 files changed, 676 insertions(+)
>  create mode 100644 package/gdb/7.10.1/0007-Sync-proc_service-definition-with-GLIBC.patch
>  create mode 100644 package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
