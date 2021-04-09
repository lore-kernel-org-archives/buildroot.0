From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Apr 2021 00:12:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.105
In-Reply-To: <87fszz6tzi.fsf@dell.be.48ers.dk>
References: <20210407144830.373018-1-bernd.kuhls@t-online.de>
 <87fszz6tzi.fsf@dell.be.48ers.dk>
Message-ID: <20210410001230.622d8998@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Bernd,

On Fri, 09 Apr 2021 23:14:25 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>
>  > Removed patch 0001, committed upstream:
>  > https://cgit.freedesktop.org/mesa/drm/commit/?id=52f05d3d896480ee5431dcd444f53bb2a8e41cce
>
>  > Renumbered remaining patch.
>
>  > Updated license hash due to upstream commits:
>  > https://cgit.freedesktop.org/mesa/drm/log/xf86drm.c
>
>  > Release notes:
>  > https://lists.freedesktop.org/archives/dri-devel/2021-April/302515.html
>
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> Committed, thanks.
>
>  > Is 0001-meson.build-enable-static-build.patch still needed?
>
> Hmm, I don't know. Does the autobuild issue referenced in commit
> 54bcc1b188ab60a still trigger? Peter, you are the author of that commit?

I believe this question is a legacy/internal one/note, as the patch
is the same as the upstream commit mentioned above (but did not check in
detail)...., or Bernds note is about
  0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch/
  0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch
which would match with your mentioned commit 54bcc1b188ab60a?

Then the answer is: Do not know...., needs to be tested ;-)

Regards,
Peter

>
>
>  >  ...0001-meson.build-enable-static-build.patch | 169 ------------------
>  >  ...-disable-nouveau-tests-for-static-b.patch} |   0
>  >  package/libdrm/libdrm.hash                    |   8 +-
>  >  package/libdrm/libdrm.mk                      |   2 +-
>  >  4 files changed, 5 insertions(+), 174 deletions(-)
>  >  delete mode 100644 package/libdrm/0001-meson.build-enable-static-build.patch
>  >  rename
>  > package/libdrm/{0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>  > => 0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch}
>  > (100%)
>
>  > diff --git a/package/libdrm/0001-meson.build-enable-static-build.patch
>  > b/package/libdrm/0001-meson.build-enable-static-build.patch
>  > deleted file mode 100644
>  > index 28da702559..0000000000
>  > --- a/package/libdrm/0001-meson.build-enable-static-build.patch
>  > +++ /dev/null
>  > @@ -1,169 +0,0 @@
>  > -From d58a32776e08e193c24f7bb192daf72b66fbe550 Mon Sep 17 00:00:00 2001
>  > -From: Peter Seiderer <ps.report@gmx.net>
>  > -Date: Wed, 18 Jul 2018 21:35:18 +0200
>  > -Subject: [PATCH] meson.build: enable static build
>  > -
>  > -Use meson library instead of shared_library to enable static build.
>  > -
>  > -Upstream suggested: https://lists.freedesktop.org/archives/dri-devel/2018-July/183886.html
>  > -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  > ----
>  > - amdgpu/meson.build    | 2 +-
>  > - etnaviv/meson.build   | 2 +-
>  > - exynos/meson.build    | 2 +-
>  > - freedreno/meson.build | 2 +-
>  > - intel/meson.build     | 2 +-
>  > - libkms/meson.build    | 2 +-
>  > - meson.build           | 2 +-
>  > - nouveau/meson.build   | 2 +-
>  > - omap/meson.build      | 2 +-
>  > - radeon/meson.build    | 2 +-
>  > - tegra/meson.build     | 2 +-
>  > - 11 files changed, 11 insertions(+), 11 deletions(-)
>  > -
>  > -diff --git a/amdgpu/meson.build b/amdgpu/meson.build
>  > -index f39d7bf..1b4b0be 100644
>  > ---- a/amdgpu/meson.build
>  > -+++ b/amdgpu/meson.build
>  > -@@ -21,7 +21,7 @@
>  > -
>  > - datadir_amdgpu = join_paths(get_option('prefix'), get_option('datadir'), 'libdrm')
>  > -
>  > --libdrm_amdgpu = shared_library(
>  > -+libdrm_amdgpu = library(
>  > -   'drm_amdgpu',
>  > -   [
>  > -     files(
>  > -diff --git a/etnaviv/meson.build b/etnaviv/meson.build
>  > -index ca2aa54..a0d994e 100644
>  > ---- a/etnaviv/meson.build
>  > -+++ b/etnaviv/meson.build
>  > -@@ -19,7 +19,7 @@
>  > - # SOFTWARE.
>  > -
>  > -
>  > --libdrm_etnaviv = shared_library(
>  > -+libdrm_etnaviv = library(
>  > -   'drm_etnaviv',
>  > -   [
>  > -     files(
>  > -diff --git a/exynos/meson.build b/exynos/meson.build
>  > -index 30d3640..fd14f3a 100644
>  > ---- a/exynos/meson.build
>  > -+++ b/exynos/meson.build
>  > -@@ -18,7 +18,7 @@
>  > - # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>  > - # SOFTWARE.
>  > -
>  > --libdrm_exynos = shared_library(
>  > -+libdrm_exynos = library(
>  > -   'drm_exynos',
>  > -   [files('exynos_drm.c', 'exynos_fimg2d.c'), config_file],
>  > -   c_args : warn_c_args,
>  > -diff --git a/freedreno/meson.build b/freedreno/meson.build
>  > -index 015b7fb..6c8a6a7 100644
>  > ---- a/freedreno/meson.build
>  > -+++ b/freedreno/meson.build
>  > -@@ -39,7 +39,7 @@ if with_freedreno_kgsl
>  > -   )
>  > - endif
>  > -
>  > --libdrm_freedreno = shared_library(
>  > -+libdrm_freedreno = library(
>  > -   'drm_freedreno',
>  > -   [files_freedreno, config_file],
>  > -   c_args : warn_c_args,
>  > -diff --git a/intel/meson.build b/intel/meson.build
>  > -index 53c7fce..14cabd3 100644
>  > ---- a/intel/meson.build
>  > -+++ b/intel/meson.build
>  > -@@ -18,7 +18,7 @@
>  > - # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>  > - # SOFTWARE.
>  > -
>  > --libdrm_intel = shared_library(
>  > -+libdrm_intel = library(
>  > -   'drm_intel',
>  > -   [
>  > -     files(
>  > -diff --git a/libkms/meson.build b/libkms/meson.build
>  > -index 86d1a4e..9d21e4c 100644
>  > ---- a/libkms/meson.build
>  > -+++ b/libkms/meson.build
>  > -@@ -41,7 +41,7 @@ if with_exynos
>  > -   libkms_include += include_directories('../exynos')
>  > - endif
>  > -
>  > --libkms = shared_library(
>  > -+libkms = library(
>  > -   'kms',
>  > -   [files_libkms, config_file],
>  > -   c_args : warn_c_args,
>  > -diff --git a/meson.build b/meson.build
>  > -index 3c8afb6..7aa5f8c 100644
>  > ---- a/meson.build
>  > -+++ b/meson.build
>  > -@@ -279,7 +279,7 @@ add_project_arguments('-include', 'config.h', language : 'c')
>  > - inc_root = include_directories('.')
>  > - inc_drm = include_directories('include/drm')
>  > -
>  > --libdrm = shared_library(
>  > -+libdrm = library(
>  > -   'drm',
>  > -   [files(
>  > -      'xf86drm.c', 'xf86drmHash.c', 'xf86drmRandom.c', 'xf86drmSL.c',
>  > -diff --git a/nouveau/meson.build b/nouveau/meson.build
>  > -index 51c9a71..acba048 100644
>  > ---- a/nouveau/meson.build
>  > -+++ b/nouveau/meson.build
>  > -@@ -19,7 +19,7 @@
>  > - # SOFTWARE.
>  > -
>  > -
>  > --libdrm_nouveau = shared_library(
>  > -+libdrm_nouveau = library(
>  > -   'drm_nouveau',
>  > -   [files( 'nouveau.c', 'pushbuf.c', 'bufctx.c', 'abi16.c'), config_file],
>  > -   c_args : warn_c_args,
>  > -diff --git a/omap/meson.build b/omap/meson.build
>  > -index e57b8f5..6cffb99 100644
>  > ---- a/omap/meson.build
>  > -+++ b/omap/meson.build
>  > -@@ -18,7 +18,7 @@
>  > - # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>  > - # SOFTWARE.
>  > -
>  > --libdrm_omap = shared_library(
>  > -+libdrm_omap = library(
>  > -   'drm_omap',
>  > -   [files('omap_drm.c'), config_file],
>  > -   include_directories : [inc_root, inc_drm],
>  > -diff --git a/radeon/meson.build b/radeon/meson.build
>  > -index b08c744..2f45ff7 100644
>  > ---- a/radeon/meson.build
>  > -+++ b/radeon/meson.build
>  > -@@ -19,7 +19,7 @@
>  > - # SOFTWARE.
>  > -
>  > -
>  > --libdrm_radeon = shared_library(
>  > -+libdrm_radeon = library(
>  > -   'drm_radeon',
>  > -   [
>  > -     files(
>  > -diff --git a/tegra/meson.build b/tegra/meson.build
>  > -index 1f5c74b..8d0cfa9 100644
>  > ---- a/tegra/meson.build
>  > -+++ b/tegra/meson.build
>  > -@@ -18,7 +18,7 @@
>  > - # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
>  > - # SOFTWARE.
>  > -
>  > --libdrm_tegra = shared_library(
>  > -+libdrm_tegra = library(
>  > -   'drm_tegra',
>  > -   [files('tegra.c'), config_file],
>  > -   include_directories : [inc_root, inc_drm],
>  > ---
>  > -2.18.0
>  > -
>  > diff --git
>  > a/package/libdrm/0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>  > b/package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>  > similarity index 100%
>  > rename from package/libdrm/0002-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>  > rename to package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch
>  > diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
>  > index 48f6b69481..25c3a042cb 100644
>  > --- a/package/libdrm/libdrm.hash
>  > +++ b/package/libdrm/libdrm.hash
>  > @@ -1,6 +1,6 @@
>  > -# From https://lists.freedesktop.org/archives/dri-devel/2021-January/293654.html
>  > -sha256  d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb  libdrm-2.4.104.tar.xz
>  > -sha512
>  > 0fdbef53e0e7c441c805c95ac55ca2c94f11e8fa18e36b4dc7534c22e2b5bc8eca7283fdf41785da753f98d0b589023111abdba70db7e79837729b1540253d6e
>  > libdrm-2.4.104.tar.xz
>  > +# From https://lists.freedesktop.org/archives/dri-devel/2021-April/302515.html
>  > +sha256  1d1d024b7cadc63e2b59cddaca94f78864940ab440843841113fbac6afaf2a46  libdrm-2.4.105.tar.xz
>  > +sha512
>  > 083a04af7208e58be21b89c6ebdbe2db3ba00cd29f0d271bd38bfe97dfca741edafddaaf9b5b95c20fac2c9b700434ea5b21397de26f7073169ad6f5b090f715
>  > libdrm-2.4.105.tar.xz
>
>  >  # Hash for license file
>  > -sha256  2ece103921b7b5619198b9572fb9242db7bbfa6d3b33f9f93f22e1fb738ed8ac  xf86drm.c
>  > +sha256  a69e38953c20a88845cc739c05dd604da4c977844b872e126c91a0ca2e1385b7  xf86drm.c
>  > diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
>  > index 25f8484782..98e1ac079d 100644
>  > --- a/package/libdrm/libdrm.mk
>  > +++ b/package/libdrm/libdrm.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>
>  > -LIBDRM_VERSION = 2.4.104
>  > +LIBDRM_VERSION = 2.4.105
>  >  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>  >  LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>  >  LIBDRM_LICENSE = MIT
>  > --
>  > 2.29.2
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
