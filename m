From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Oct 2017 23:38:01 +0200
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.9.2
In-Reply-To: <f75cf266-0434-ae1d-6c0b-351a32154ac0@microchip.com>
References: <20171012212342.19443-1-ps.report@gmx.net>
 <f75cf266-0434-ae1d-6c0b-351a32154ac0@microchip.com>
Message-ID: <20171016233801.6f1fc297@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joshua,

On Mon, 16 Oct 2017 13:36:22 -0700, Joshua Henderson <joshua.henderson@microchip.com> wrote:

> Peter,
> 
> On 10/12/2017 02:23 PM, Peter Seiderer wrote:
> > qt5base:
> >   - removed 0001-Fix-error-attribute-target-crc-is-unknown.patch
> >     (upstream committed, see [1])
> >   - removed 0002-examples-fix-compile-without-opengl-support.patch
> >     (upstream committed, see [2])
> > 
> > qt5declarative:
> >   - removed 0001-Fix-alignment-issue-on-ARMv7.patch
> >     (upstream committed, see [3])
> >   - moved 0001-examples-photoviewer-needs-widgets-support.patch to 5.6.2
> >     only (upstream 5.9.2 committed, see [4])
> >   - moved 0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
> >     to 5.6.2 only (similare patch upstream committed, see [5])
> > 
> > qt5location:
> >   - 0001-Fix-plugins-build-dependency.patch
> >     (upstream committed, see [6])
> > 
> > qt5webengine:
> >   - 0001-Always-compile-QWebEnginePage-print.patch
> >     (upstream committed, see [7])
> >   - keep 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
> >     (upstream committed, see [8], but reverted afterwards, see [9])
> > 
> > qt5webkit:
> >  - fall back to 5.9.1 (no 5.9.2 package provided, see [10] and [11]).
> > 
> > [1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=b7722c251c3a0938c7c71fc3da47fdbe920060b7
> > [2] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=6ce4b680cdde7827a6ed4d00dbeb7e7e91569433
> > [3] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=03c2661b1243cc529fc3d8cfa65073f1da420307
> > [4] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=452a78d0ac4a1579733a8ab641be24c9b7c0dd96
> > [5] http://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6beb77a951c14c8edcba3541850afc
> > [6] http://code.qt.io/cgit/qt/qtlocation.git/commit/?id=3ac051c4549575634cecc706175b019f4ed4c3bf
> > [7] http://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=085c2c529473bbe9dd7c8c5698a45053520cc423
> > [8] http://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
> > [9] http://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=c11c2c8981e647c1eb2c6753ce77d436b92fff87
> > [10] https://blog.qt.io/blog/2017/10/06/qt-5-9-2-released/#comment-1200724
> > [11] https://blog.qt.io/blog/2017/10/06/qt-5-9-2-released/#comment-1200746
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/qt5/qt5.mk                                 |   2 +-
> >  package/qt5/qt53d/qt53d.hash                       |   4 +-
> >  ...uickviewcomparison-and-quickwidget-needs-.patch |   0
> >  ...Fix-error-attribute-target-crc-is-unknown.patch |  47 ----
> >  ...amples-fix-compile-without-opengl-support.patch |  33 ---
> >  package/qt5/qt5base/qt5base.hash                   |   4 +-
> >  package/qt5/qt5canvas3d/qt5canvas3d.hash           |   4 +-
> >  package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
> >  ...xamples-photoviewer-needs-widgets-support.patch |   0
> >  .../5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch  |  37 ----
> >  package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
> >  .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
> >  package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
> >  .../5.9.1/0001-Fix-plugins-build-dependency.patch  |  42 ----
> >  package/qt5/qt5location/qt5location.hash           |   4 +-
> >  package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
> >  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
> >  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |   4 +-
> >  package/qt5/qt5script/qt5script.hash               |   4 +-
> >  package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
> >  package/qt5/qt5serialbus/qt5serialbus.hash         |   4 +-
> >  package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
> >  package/qt5/qt5svg/qt5svg.hash                     |   4 +-
> >  package/qt5/qt5tools/qt5tools.hash                 |   4 +-
> >  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |   4 +-
> >  package/qt5/qt5wayland/qt5wayland.hash             |   4 +-
> >  package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
> >  .../0001-Always-compile-QWebEnginePage-print.patch | 246 ---------------------
> >  ...ad-libEGL-and-libGLES2-symbols-implicitly.patch |   0
> >  package/qt5/qt5webengine/qt5webengine.hash         |   4 +-
> >  package/qt5/qt5webkit/qt5webkit.mk                 |   7 +
> >  package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
> >  package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
> >  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
> >  34 files changed, 56 insertions(+), 454 deletions(-)
> >  rename package/qt5/{qt5declarative => qt5base/5.6.2}/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch (100%)  
> 
> 5.6.2 qt5base is having a problem with
> 
>     0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
> 
> which seems to be accidentally moved from qt5declarative to qt5base?

Thats for sure by mistake, many thanks for spotting it, will re-spin an new patch version...

> 
> >  delete mode 100644 package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
> >  delete mode 100644 package/qt5/qt5base/5.9.1/0002-examples-fix-compile-without-opengl-support.patch
> >  rename package/qt5/qt5declarative/{ => 5.6.2}/0001-examples-photoviewer-needs-widgets-support.patch (100%)
> >  delete mode 100644 package/qt5/qt5declarative/5.9.1/0001-Fix-alignment-issue-on-ARMv7.patch
> >  delete mode 100644 package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency.patch
> >  delete mode 100644 package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch
> >  rename package/qt5/qt5webengine/{5.9.1 => 5.9.2}/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch (100%)  
> 
> This rots my previous patch for adding/updating all of the qt5 submodule
> license file hashes [1,2].  Not a big issue.

Thanks for reminding me on this one, lets see if I can re-base mine on yours or the
other way round with minimized conflicts...

Regards,
Peter

> 
> Outside of the issue mentioned above, I've been running this for 5.9.2:
> 
> Tested-by: Joshua Henderson <joshua.henderson@microchip.com>
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-July/198138.html
> [2] http://lists.busybox.net/pipermail/buildroot/2017-September/202600.html
> 
> Josh
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
