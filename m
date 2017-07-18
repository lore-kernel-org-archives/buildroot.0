From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:59:08 +0200
Subject: [Buildroot] [PATCH] httping: fix build without host-gettext
In-Reply-To: <ebb8a53a68988fedd5c45472799b5b51785b7873.1500395276.git.baruch@tkos.co.il>
References: <ebb8a53a68988fedd5c45472799b5b51785b7873.1500395276.git.baruch@tkos.co.il>
Message-ID: <20170718235908.4ea7a77b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:27:56 +0300, Baruch Siach wrote:
> Since commit 654de6512554c (httping: use the new gettext logic), host-gettext
> is not a dependency of httping. This breaks the build because the httping
> Makefile calls msgfmt unconditionally. Add a patch that allows build without
> translation files generation.
> 
> Fixes:
> http://autobuild.buildroot.net/results/73e/73e624775617d1b95da7d4ef666612af5bceef61/
> http://autobuild.buildroot.net/results/2bf/2bff43d7b749b4daf32868bddbae94b510949bf8/
> http://autobuild.buildroot.net/results/8a6/8a69659afa21f467ca5de7915363cebf0fc7aff2/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gilles Talis <gilles.talis@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...0002-Makefile-allow-build-without-gettext.patch | 48 ++++++++++++++++++++++
>  package/httping/httping.mk                         |  3 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 package/httping/0002-Makefile-allow-build-without-gettext.patch

Applied to master, thanks. To be honest, I wasn't sure if adding a
patch was really worth it, compared to re-adding the host-gettext
dependency. But since you've done the effort, and submitted the patch
upstream, I applied. We'll say what upstream says :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
