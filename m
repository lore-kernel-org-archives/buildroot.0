From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:05:18 +0200
Subject: [Buildroot] [PATCH] gamin: fix build with musl
In-Reply-To: <d03fac44ed52ad7fe05fdd1bb6040a260cfc14b7.1456837391.git.baruch@tkos.co.il>
References: <d03fac44ed52ad7fe05fdd1bb6040a260cfc14b7.1456837391.git.baruch@tkos.co.il>
Message-ID: <20160330000518.22043b3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Mar 2016 15:03:11 +0200, Baruch Siach wrote:
> musl does not provide the non portable PTHREAD_MUTEX_RECURSIVE_NP. Add a patch
> removing the assumption the PTHREAD_MUTEX_RECURSIVE_NP is available when
> 'linux' is defined.
> 
> Upstream had no new release since 2008, so there is no much hope of getting
> this fix applied upstream.

Not quite true :) If you check https://git.gnome.org/browse/gamin/log/,
there has been a commit in early February 2016. Granted, it was the
first commit since almost two years, but still. It's worth submitting
upstream :-)

> Also, fix the pthread dependency comment. gamin code uses pthread directly.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3a9/3a9328f384fc648ae61316402a84eaffb175881b/
> http://autobuild.buildroot.net/results/69d/69d2a93bc97ab0d70c3acb2f9c9f28612ea95871/
> http://autobuild.buildroot.net/results/092/092ac7380beb8ce403a1a6fd8e4176e9234413a3/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch | 20 ++++++++++++++++++++
>  package/gamin/Config.in                              |  2 +-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
