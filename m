From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 10:59:12 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/audit: not available
 for musl
In-Reply-To: <1439503065-12462-1-git-send-email-yann.morin.1998@free.fr>
References: <1439503065-12462-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150818105912.62a264b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 13 Aug 2015 23:57:45 +0200, Yann E. MORIN wrote:
> audit uses strndupa() which is missing from musl.
> 
> Even though the implementation of strndupa is not too complex, we won't
> go as far as duplicating it in audit, and we just disable audit for the
> musl C library.
> 
> Fixes;
>     http://autobuild.buildroot.org/results/e22/e22a70f9ff14bc52f642a6135da44c14e41b6cbb/
>     http://autobuild.buildroot.org/results/233/2333c9b3d8f81b15602263b918d422e440f09d60/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> 
> ---
> Note: musl does have strdupa() so maybe strndupa is just a few commits
> away. Need to revisit later?
> ---
>  package/audit/0001-Missed-cross-compile-fixes.patch | 0
>  package/audit/Config.in                             | 6 ++++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>  mode change 100755 => 100644 package/audit/0001-Missed-cross-compile-fixes.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
