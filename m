From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:10:13 +0100
Subject: [Buildroot] [PATCH] rpcbind: Backport fixes to memory leak
 security fix
In-Reply-To: <20180118180531.8149-1-ed.blake@sondrel.com>
References: <20180118180531.8149-1-ed.blake@sondrel.com>
Message-ID: <20180118221013.5e56941e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 18:05:31 +0000, Ed Blake wrote:
> Commit 954509f added a security fix for CVE-2017-8779, involving
> pairing all svc_getargs() calls with svc_freeargs() to avoid a memory
> leak.  However it also introduced a couple of issues:
> 
> - The call to svc_freeargs() from rpcbproc_callit_com() may result in
>   an attempt to free static memory, resulting in undefined behaviour.
> 
> - A typo in the svc_freeargs() call from pmapproc_dump() causes NIS
>   (aka ypbind) to fail.
> 
> Backport upstream fixes for these issues to version 0.2.3.
> 
> Change-Id: Ib6cb19d51c0ae682e3868593ef78edea4ef587be
> Signed-off-by: Ed Blake <ed.blake@sondrel.com>
> ---
>  ..._callit_com-Stop-freeing-a-static-pointer.patch | 98 ++++++++++++++++++++++
>  ...proc_dump-Fixed-typo-in-memory-leak-patch.patch | 31 +++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 package/rpcbind/0005-rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
>  create mode 100644 package/rpcbind/0006-pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
