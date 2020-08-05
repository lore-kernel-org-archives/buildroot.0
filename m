From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:32:01 +0200
Subject: [Buildroot] [PATCHv3 2/5] package/efl: bump to version 1.24.3
In-Reply-To: <20200801142035.4060526-2-romain.naour@gmail.com>
References: <20200801142035.4060526-1-romain.naour@gmail.com>
 <20200801142035.4060526-2-romain.naour@gmail.com>
Message-ID: <20200805153201.501c768a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 16:20:32 +0200
Romain Naour <romain.naour@gmail.com> wrote:

>   - Remove upstream patch [1].
>   - evas-modules option removed since all evas-modules are now built shared. [2]
>   - Make sure that mono is disabled [3].
>   - gstreamer support removed from emotion & evas [4].
>   - emotion-loaders-disabler & emotion-generic-loaders-disabler removed [5].
>   - Add openjpeg dependency for jp2k evas loader [6] otherwise the build
>     system fail when only libjpeg.so is provided (jpeg-turbo or libjpeg).
>   - Update COMPLIANCE file hash due to esacpe library removal [7].
>   - Update COPYING file hash due to new csharp,cxx libraries and esacpe,emotion
>     removal [8].
>   - Remove bullet dependency from recommended option for efl [9].
>   - Add new patches to fix build with "Unknown variable" issue with meson.
>   - Fix Evas_Engine_GL_Drm.h include path.
> 
> [1] https://git.enlightenment.org/core/efl.git/commit/?id=a2afcfc872c29bd2c4a60fdafbc655c90f938d1e
>     https://git.enlightenment.org/core/efl.git/commit/?id=c245b576aad09ac5faeb800de7f7c4fef87c6363
> [2] https://git.enlightenment.org/core/efl.git/commit/?id=6d8e39a6425e721eb40e0cb1e67f1cbf5b223cc0
> [3] https://git.enlightenment.org/core/efl.git/commit/?id=17a81bee4a53891e44a165a14ca20027f9aa0824
> [4] https://git.enlightenment.org/core/efl.git/commit/?id=b8dc80c144fec54a521987535c57b995748ccece
> [5] https://git.enlightenment.org/core/efl.git/commit/?id=075bab83c4288b5de20f6acfc6b0459656ea85e0
> [6] https://git.enlightenment.org/core/efl.git/commit/?id=8ec6e28b7cc568a8bb636de90b2dd10f19db2be3
> [7] https://git.enlightenment.org/core/efl.git/commit/?id=f3d9b8ee703621cfbb52a03d346335148318af7a
> [8] https://git.enlightenment.org/core/efl.git/commit/?id=40a980174b7e29e6946f7425bd7a238ae45900f8
>     https://git.enlightenment.org/core/efl.git/commit/?id=a3ade15d5a45e7d564b7c1304f561af9c4203991
>     https://git.enlightenment.org/core/efl.git/commit/?id=31da42a0503556a59c190efcb0a79331e828bf6c
> [9] https://git.enlightenment.org/core/efl.git/commit/?id=523a64d2265c13a82ba73022d10919f0e392bab2
> 
> See:
> https://www.enlightenment.org/news/efl-1.24.0
> https://www.enlightenment.org/news/efl-1.24.1
> https://www.enlightenment.org/news/efl-1.24.2
> https://www.enlightenment.org/news/efl-1.24.3
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v3 fix openjpeg dependency
>    remove bullet from recommended dependency
>    update to 1.24.3
>    Review by upstream: https://sourceforge.net/p/enlightenment/mailman/message/37065780/
> v2 update COMPLIANCE and COPYING files hash.
> ---
>  ...meson.build-add-single-quote-for-env.patch |  33 +++
>  ...-evas-fix-compilation-with-Dwl-false.patch |  31 ---
>  ...cc-10-which-has-fno-common-enabled-b.patch | 222 ------------------
>  ...es-drm-meson.build-use-gl_deps-as-en.patch |  36 +++
>  ...es-drm-meson.build-fix-gl_drm-includ.patch |  37 +++
>  package/efl/Config.in                         |   7 +-
>  package/efl/efl.hash                          |   8 +-
>  package/efl/efl.mk                            |  15 +-
>  8 files changed, 119 insertions(+), 270 deletions(-)
>  create mode 100644 package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
>  delete mode 100644 package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
>  delete mode 100644 package/efl/0002-Fix-build-with-gcc-10-which-has-fno-common-enabled-b.patch
>  create mode 100644 package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
>  create mode 100644 package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
