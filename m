From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 18:44:25 +0200
Subject: [Buildroot] [PATCH] package/lzo: enable shared/static libs when
 needed
In-Reply-To: <20170902142853.18011-1-yann.morin.1998@free.fr>
References: <20170902142853.18011-1-yann.morin.1998@free.fr>
Message-ID: <20170902184425.071b21be@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 16:28:53 +0200, Yann E. MORIN wrote:
> In 61c4c63 (package/lzo: switch to cmake), building lzo has switched
> from autotools to cmake. In the conversion, we've lost the build of the
> shared library, because the cmake-based buildsystem of lzo explcitly
> disables it by default.
> 
> Restore the shared library build.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> ---
> Note: it was noticed because of an autobuild failure of cairo:
> http://autobuild.buildroot.org/results/d51/d51888cbc3a743d53ce38f736ee43953e50bdf61/
> but it has not been checked wether this patch fixes the build at all.
> Yet, the patch is still valid even without fixing the autobuild failure.
> ---
>  package/lzo/lzo.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
