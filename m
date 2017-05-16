From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:25:12 +0200
Subject: [Buildroot] [PATCH] rpcbind: add upstream security fix for
 CVE-2017-8779
In-Reply-To: <20170515210124.6657-1-peter@korsgaard.com>
References: <20170515210124.6657-1-peter@korsgaard.com>
Message-ID: <20170516092512.74a6f42b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 23:01:24 +0200, Peter Korsgaard wrote:
> CVE-2017-8779: rpcbind through 0.2.4, LIBTIRPC through 1.0.1 and 1.0.2-rc
> through 1.0.2-rc3, and NTIRPC through 1.4.3 do not consider the maximum RPC
> data size during memory allocation for XDR strings, which allows remote
> attackers to cause a denial of service (memory consumption with no
> subsequent free) via a crafted UDP packet to port 111, aka rpcbomb.
> 
> For more details, see:
> https://guidovranken.wordpress.com/2017/05/03/rpcbomb-remote-rpcbind-denial-of-service-patches/
> 
> Backport upstream fix to version 0.2.3 and unconditionally include syslog.h
> to fix a build issue when RPCBIND_DEBUG is disabled (which it is in
> Buildroot).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...r-all-svc_getargs-calls-with-svc_freeargs.patch | 231 +++++++++++++++++++++
>  1 file changed, 231 insertions(+)
>  create mode 100644 package/rpcbind/0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
