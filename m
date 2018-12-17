From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Dec 2018 14:15:40 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-xqUZo6V4YH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #6 from Patrick Koller <koller@stettbacher.ch> ---
Thanks @Peter for your patch.

The qt5webengine has been built just fine, nevertheless there was raised an
error during the following "installing to target" step. The cp command
complained, there are no libs to copy and indeed, there are no libs present.
Why is the buildprocess successfull without creating any libs? Please have a
look at the following error message:

**************************************************
>>> qt5webengine 5.11.2 Building
PATH="/home/patrickk/tmp/buildroot/eglfs_patch/output/host/bin:/home/patrickk/tmp/buildroot/eglfs_patch/output/host/sbin:/home/patrickk/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
PATH=/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/host-bin:"/home/patrickk/tmp/buildroot/eglfs_patch/output/host/bin:/home/patrickk/tmp/buildroot/eglfs_patch/output/host/sbin:/home/patrickk/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
NINJAFLAGS="-j9"
GN_PKG_CONFIG_HOST=/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/host-bin/host-pkg-config
/usr/bin/make -j9 -C
/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2
make[1]: Entering directory
'/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2'
make[1]: Nothing to be done for 'first'.
make[1]: Leaving directory
'/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2'
>>> qt5webengine 5.11.2 Installing to staging directory
PATH="/home/patrickk/tmp/buildroot/eglfs_patch/output/host/bin:/home/patrickk/tmp/buildroot/eglfs_patch/output/host/sbin:/home/patrickk/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
PATH=/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/host-bin:"/home/patrickk/tmp/buildroot/eglfs_patch/output/host/bin:/home/patrickk/tmp/buildroot/eglfs_patch/output/host/sbin:/home/patrickk/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
NINJAFLAGS="-j9"
GN_PKG_CONFIG_HOST=/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/host-bin/host-pkg-config
/usr/bin/make -j9 -C
/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2
install
make[1]: Entering directory
'/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2'
make[1]: Nothing to be done for 'install'.
make[1]: Leaving directory
'/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2'
for i in $(find
/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib*
-name "libQt5*.la"); do /usr/bin/sed -i -e 
"s:/home/patrickk/tmp/buildroot/eglfs_patch/output:@BASE_DIR@:g" -e
"s:/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot:@STAGING_DIR@:g"
-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" -e
"s:@STAGING_DIR@:/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot:g"
-e "s:@BASE_DIR@:/home/patrickk/tmp/buildroot/eglfs_patch/output:g" $i ;
/usr/bin/sed -i -e "/^dependency_libs=/s%-L/usr/lib %%g" $i ; done
for i in $(find
/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib*
-name "libQt5*.prl"); do /usr/bin/sed -i -e "s%-L/usr/lib%%" $i; done
>>> qt5webengine 5.11.2 Fixing libtool files
>>> qt5webengine 5.11.2 Installing to target
cp -dpf
/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*
/home/patrickk/tmp/buildroot/eglfs_patch/output/target/usr/lib
cp: cannot stat
'/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*':
No such file or directory
package/pkg-generic.mk:310: recipe for target
'/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/.stamp_target_installed'
failed
make: ***
[/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/.stamp_target_installed]
Error 1
patrickk at lites:~/tmp/buildroot/eglfs_patch> make
>>> qt5webengine 5.11.2 Installing to target
cp -dpf
/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*
/home/patrickk/tmp/buildroot/eglfs_patch/output/target/usr/lib
cp: cannot stat
'/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*':
No such file or directory
package/pkg-generic.mk:310: recipe for target
'/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/.stamp_target_installed'
failed
make: ***
[/home/patrickk/tmp/buildroot/eglfs_patch/output/build/qt5webengine-5.11.2/.stamp_target_installed]
Error 1
patrickk at lites:~/tmp/buildroot/eglfs_patch> kate
output/build/qt5wayland-5.11.2/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp 
patrickk at lites:~/tmp/buildroot/eglfs_patch> kate
output/build/qt5wayland-5.11.2/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp 
patrickk at lites:~/tmp/buildroot/eglfs_patch> l
/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*
ls: cannot access
'/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*':
No such file or directory
patrickk at lites:~/tmp/buildroot/eglfs_patch> l
/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*
ls: cannot access
'/home/patrickk/tmp/buildroot/eglfs_patch/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*':
No such file or directory
**************************************************

-- 
You are receiving this mail because:
You are on the CC list for the bug.
