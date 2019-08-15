From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 23:36:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp: switch back to autotools
In-Reply-To: <20190813170208.28511-1-fontaine.fabrice@gmail.com>
References: <20190813170208.28511-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815233602.5fa2620f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Aug 2019 19:02:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch back to autotools to fix static build with rygel (and so reverts
> partially commit 66a3fbb9f6c79e48eaf9e561a4143063e7e9d670
> "package/gupnp: bump to version 1.0.4").
> 
> Indeed gupnp uses meson's subproject feature for guul which is just
> plainly broken on static build with meson, see:
> https://github.com/mesonbuild/meson/issues/3934
> https://github.com/mesonbuild/meson/issues/3937
> https://github.com/mesonbuild/meson/pull/3939
> 
> This will fix a build failure with rygel
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ebbf96a1be5547e416feb1e96e55986890d0a1de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gupnp/gupnp.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
