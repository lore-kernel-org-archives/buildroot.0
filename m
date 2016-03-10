From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:51:22 +0100
Subject: [Buildroot] [PATCH] owfs: remove include of rpc/netdb.h
In-Reply-To: <1457563705-26494-1-git-send-email-arnout@mind.be>
References: <1457563705-26494-1-git-send-email-arnout@mind.be>
Message-ID: <20160310235122.0663734e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Wed, 9 Mar 2016 23:48:25 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> owfs carries a copy of netdb.h from an old glibc, which is only used
> to implement getaddrinfo on platforms that miss it (Solaris 7 in
> particular). Since all of our libc implementations have getaddrinfo,
> we don't need it.
> 
> To make the patch minimal, just include if !HAVE_GETADDRINFO.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d9e918c2791cd5523b2fd6478bbd4ce21e58f4f1
> http://autobuild.buildroot.net/results/3a85144753e4f18491d62dccf6d5843170f8daea
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...t.h-only-include-compat_netdb.h-if-needed.patch | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/owfs/0002-compat.h-only-include-compat_netdb.h-if-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
