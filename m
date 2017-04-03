From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:44:54 +0200
Subject: [Buildroot] [PATCH] portmap: remove package as it is obsolete
In-Reply-To: <20170402033708.GA24554@waldemar-brodkorb.de>
References: <20170402033708.GA24554@waldemar-brodkorb.de>
Message-ID: <20170403224454.4a38ae6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Apr 2017 05:37:08 +0200, Waldemar Brodkorb wrote:
> The upstream tarball isn't available, no releases since ten
> years. The latest change to upstream git is from 2014.
> Better use rpcbind for any RPC portmapper service.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  Config.in.legacy                                   |  8 ++
>  package/Config.in                                  |  1 -
>  .../0001-README-fix-typo-in-tcp-wrapper-doc.patch  | 26 ------
>  ...0002-NO_PIE-make-PIE-support-controllable.patch | 53 ------------
>  ...K-control-usage-of-fork-for-nommu-systems.patch | 95 ----------------------
>  ...ERROR-control-overriding-of-perror-symbol.patch | 65 ---------------
>  package/portmap/0005-tcpd.patch                    | 18 ----
>  package/portmap/Config.in                          | 16 ----
>  package/portmap/S13portmap                         | 44 ----------
>  package/portmap/portmap.hash                       |  2 -
>  package/portmap/portmap.mk                         | 33 --------
>  11 files changed, 8 insertions(+), 353 deletions(-)
>  delete mode 100644 package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
>  delete mode 100644 package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
>  delete mode 100644 package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
>  delete mode 100644 package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
>  delete mode 100644 package/portmap/0005-tcpd.patch
>  delete mode 100644 package/portmap/Config.in
>  delete mode 100755 package/portmap/S13portmap
>  delete mode 100644 package/portmap/portmap.hash
>  delete mode 100644 package/portmap/portmap.mk

Applied to master, after adding a select for rpcbind, as suggested by
Arnout. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
