From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 30 Jan 2020 13:02:31 +0100
Subject: [Buildroot] QtWebEngine on RPI 0 W
In-Reply-To: <1580384329954-0.post@n4.nabble.com>
References: <1579861270269-0.post@n4.nabble.com>
 <20200125172550.45366ce5@gmx.net>
 <1580197267384-0.post@n4.nabble.com>
 <20200128085828.5959e493@gmx.net> <20200128104326.030b51d9@gmx.net>
 <1580384329954-0.post@n4.nabble.com>
Message-ID: <20200130130231.0142f85d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rafa,

On Thu, 30 Jan 2020 05:38:49 -0600 (CST), rscr <rafacrespiramon@gmail.com> wrote:

> Dear Peter, 
> 
> Thanks for testing it. As I would like to keep using the Qt 5.11.3. I would
> like to find a solution with a gcc toolchain > 5 (webengine requirement)
> 
> - Using the one provided by RPI is not possible because it is 4.9.3
> - Next I tried to use the buildroot toolchain, with gcc 5 (find attached my
> defconfig). 
> 
> cp4_defconfig.cp4_defconfig
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/cp4_defconfig.cp4_defconfig>  
> 
> Now it fails building qt5webengine, when:
> 
> ./../../3rdparty/chromium/third_party/WebKit/Source/modules/indexeddb/InspectorIndexedDBAgent.cpp:1007:7:
> warning: ?blink::ClearObjectStore? has a base
> ?blink::{anonymous}::ExecutableWithDatabase<blink::protocol::IndexedDB::Backend::ClearObjectStoreCallback>?
> whose type uses the anonymous namespace
> [15206/15243] CXX obj/QtWebEngineCore/media_capture_devices_dispatcher.o
> FAILED: obj/QtWebEngineCore/media_capture_devices_dispatcher.o 
> 
> ....
> 
> virtual memory exhausted: Cannot allocate memory

Try to add more RAM to your build host (or swap space) ;-), or
set BR2_JLEVEL (Build options ---> Number of jobs to run simultaneously
(0 for auto)) to an appropriate value...

Regards,
Peter

> [15208/15243] CXX obj/QtWebEngineCore/network_delegate_qt.o
> ninja: build stopped: subcommand failed.
> Makefile.gn_run:331: recipe for target 'run_ninja' failed
> make[5]: *** [run_ninja] Error 1
> Makefile:80: recipe for target 'sub-gn_run-pro-make_first' failed
> make[4]: *** [sub-gn_run-pro-make_first] Error 2
> Makefile:77: recipe for target 'sub-core-make_first' failed
> make[3]: *** [sub-core-make_first] Error 2
> Makefile:46: recipe for target 'sub-src-make_first' failed
> make[2]: *** [sub-src-make_first] Error 2
> package/pkg-generic.mk:238: recipe for target
> '/home/ibercomp/rcr/projects/cp4/buildroot/output/build/qt5webengine-5.11.3/.stamp_built'
> failed
> make[1]: ***
> [/home/ibercomp/rcr/projects/cp4/buildroot/output/build/qt5webengine-5.11.3/.stamp_built]
> Error 2
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> This is a problem of the defconfig? The rpi 0 W maybe can not support the
> qt5WebEngine? It is a problem with host (I am using Ubuntu 16.04)?
> 
> Kind Regards and thanks!
> 
> Rafa
> 
> 
> 
> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
