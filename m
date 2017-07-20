From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 08:05:52 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: bump to version 2.16.5
In-Reply-To: <87o9sg8qu7.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 19 Jul 2017 16:05:20 +0200")
References: <20170705143303.26282-1-aperez@igalia.com>
 <87o9sg8qu7.fsf@dell.be.48ers.dk>
Message-ID: <871spb63sv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
 >> This simply updates to the latest stable release. WebKitGTK+ versions
 >> in the 2.1x series avoid bumping the dependencies in order to allow
 >> distributions to provide updates, therefore no new dependencies are
 >> needed.

 >> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 > Committed to 2017.02.x and 2017.05.x, thanks.

While backporting I noticed that webkitgtk doesn't seem to build without
the BR2_PACKAGE_WEBKITGTK_MULTIMEDIA option. I reproduced it with master
as well.

The build error I get is this. Do you have any idea how to fix?

/home/peko/buildroot/output/build/webkitgtk-2.16.5/DerivedSources/WebCore/JSWebGLRenderingContextBase.cpp:3100:207:   required from here
/home/peko/buildroot/output/build/webkitgtk-2.16.5/Source/WTF/wtf/PassRefPtr.h:40:13: error: invalid use of incomplete type ?class WebCore::HTMLVideoElement?
             ptr->deref();
             ^
In file included from /home/peko/buildroot/output/build/webkitgtk-2.16.5/Source/WebCore/html/canvas/WebGLRenderingContextBase.h:32:0,
                 from /home/peko/buildroot/output/build/webkitgtk-2.16.5/DerivedSources/WebCore/JSWebGLRenderingContextBase.h:26,
                 from /home/peko/buildroot/output/build/webkitgtk-2.16.5/DerivedSources/WebCore/JSWebGLRenderingContextBase.cpp:25:
/home/peko/buildroot/output/build/webkitgtk-2.16.5/Source/WebCore/html/canvas/CanvasRenderingContext.h:40:7: note: forward declaration of ?class WebCore::HTMLVideoElement?
 class HTMLVideoElement;
       ^
[ 39%] Building CXX object Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/__/__/DerivedSources/WebCore/FetchInternalsBuiltins.cpp.o
Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/build.make:16034: recipe for target 'Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/__/__/DerivedSources/WebCore/JSWebGLRenderingContextBase.cpp.o' failed
make[3]: *** [Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/__/__/DerivedSources/WebCore/JSWebGLRenderingContextBase.cpp.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory '/home/peko/buildroot/output/build/webkitgtk-2.16.5'
CMakeFiles/Makefile2:685: recipe for target 'Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/all' failed
make[2]: *** [Source/WebCore/CMakeFiles/WebCoreDerivedSources.dir/all] Error 2
make[2]: Leaving directory '/home/peko/buildroot/output/build/webkitgtk-2.16.5'
Makefile:151: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/home/peko/buildroot/output/build/webkitgtk-2.16.5'

-- 
Bye, Peter Korsgaard
