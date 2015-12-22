From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 19:10:36 +0100
Subject: [Buildroot] [PATCH 1/1 v2] autofs: new package
In-Reply-To: <1450803070-14401-1-git-send-email-yba@tkos.co.il>
References: <1450803070-14401-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151222191036.1795be13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Tue, 22 Dec 2015 18:51:10 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> Adds package "autofs". Requires a toolchain with native RPC support
> that supplies the header nfs/nfs.h. The "nfs-utils" package contains
> the nfs/nfs.h header but does not install it. Adding an install target
> to "nfs-utils" for the nfs/nfs.h header would require significant
> upstream work. The "libtirpc" package does not contain the nfs/nfs.h
> header.
> 
> Tested on i.MX6 using NFS mounts only. Not tested with DAS mounts as
> of this commit.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/Config.in          |    1 +
>  package/autofs/Config.in   |   17 +++++++++++++++++
>  package/autofs/autofs.hash |    2 ++
>  package/autofs/autofs.mk   |   20 ++++++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/autofs/Config.in
>  create mode 100644 package/autofs/autofs.hash
>  create mode 100644 package/autofs/autofs.mk

Applied with a number of changes:

    [Thomas:
     - remove the "# rpcbind" comments on the thread and mmu dependencies,
       since we don't select rpcbind. The thread and mmu dependencies are
       still needed though, since autofs uses pthread_*() functions and
       fork().
     - Remove "Requires a toolchain with native RPC." in the Config.in
       help text and instead add a proper Config.in comment about the
       thread and RPC dependency.
     - Add patch to fix building with uClibc, taken from OpenEmbedded.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
