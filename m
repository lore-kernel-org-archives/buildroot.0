From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 18:04:08 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix examples compile without
 opengl support
In-Reply-To: <20170807211544.5286-1-ps.report@gmx.net>
References: <20170807211544.5286-1-ps.report@gmx.net>
Message-ID: <eb1eb0a3-e62b-2e56-bcf9-95db9ce21196@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-08-17 23:15, Peter Seiderer wrote:
> Fixes [1]:
> 
>   make[1]: Entering directory '.../build/qt5base-5.9.1/examples/opengl'
>   cd hellowindow/ && ( test -e Makefile || .../build/qt5base-5.9.1/bin/qmake -o Makefile .../build/qt5base-5.9.1/examples/opengl/hellowindow/hellowindow.pro ) && make -f Makefile
>   make[2]: Entering directory '.../build/qt5base-5.9.1/examples/opengl/hellowindow'
>   .../host/bin/sparc-linux-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=.../host/sparc-buildroot-linux-uclibc/sysroot -O2 -O3 -fno-exceptions -Wall -W -D_REENTRANT -fPIC -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -I. -I../../../include/QtGui/5.9.1 -I../../../include/QtGui/5.9.1/QtGui -I../../../include -I../../../include/QtGui -I../../../include/QtCore/5.9.1 -I../../../include/QtCore/5.9.1/QtCore -I../../../include/QtCore -I.moc -I../../../mkspecs/devices/linux-buildroot-g++ -o .obj/hellowindow.o hellowindow.cpp
>   In file included from hellowindow.cpp:51:0:
>   hellowindow.h:96:5: error: ?QOpenGLShaderProgram? does not name a type
>        QOpenGLShaderProgram *m_program;
>        ^~~~~~~~~~~~~~~~~~~~
>   hellowindow.h:97:5: error: ?QOpenGLBuffer? does not name a type
>        QOpenGLBuffer m_vbo;
>        ^~~~~~~~~~~~~
>   hellowindow.cpp: In constructor ?Renderer::Renderer(const QSurfaceFormat&, Renderer*, QScreen*)?:
>   hellowindow.cpp:62:40: error: invalid use of incomplete type ?class QOpenGLContext?
>        m_context = new QOpenGLContext(this);
>                                           ^
>   In file included from ../../../include/QtGui/qsurfaceformat.h:1:0,
>                    from ../../../include/QtGui/../../src/gui/kernel/qsurface.h:45,
>                    from ../../../include/QtGui/qsurface.h:1,
>                    from ../../../include/QtGui/../../src/gui/kernel/qwindow.h:51,
>                    from ../../../include/QtGui/qwindow.h:1,
>                    from ../../../include/QtGui/QWindow:1,
>                    from hellowindow.h:51,
>                    from hellowindow.cpp:51:
> 
> [1] http://autobuild.buildroot.net/results/001/001bc930014fca8c2a8b7a390350b4e1a15fa375/build-end.log
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
