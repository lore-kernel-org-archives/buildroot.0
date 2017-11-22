From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:57:39 +0100
Subject: [Buildroot] [PATCH v1] qt5declarative: for latest fix examples
 compile without OpenGL support
In-Reply-To: <20171119185636.3918-1-ps.report@gmx.net>
References: <20171119185636.3918-1-ps.report@gmx.net>
Message-ID: <20171122215739.7c82a4bf@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Nov 2017 19:56:36 +0100, Peter Seiderer wrote:
> Add upstream patch to fix examples compile without OpenGL support.
> 
> Fixes [1]:
> 
>   In file included from fbitem.h:49:0,
>                    from mainwindow.cpp:42:
>   logo.h:52:11: error: 'GLfloat' does not name a type
>        const GLfloat *constData() const { return m_data.constData(); }
>              ^
>   logo.h:57:15: error: 'GLfloat' has not been declared
>        void quad(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2, GLfloat x3, GLfloat y3, GLfloat x4, GLfloat y4);
>                  ^
>   [...]
>   Makefile:610: recipe for target '.obj/mainwindow.o' failed
>   make[5]: *** [.obj/mainwindow.o] Error 1
>   make[5]: Leaving directory '.../build/qt5declarative-5.9.2/examples/quick/quickwidgets/qquickviewcomparison'
>   Makefile:70: recipe for target 'sub-qquickviewcomparison-make_first' failed
>   make[4]: *** [sub-qquickviewcomparison-make_first] Error 2
>   make[4]: *** Waiting for unfinished jobs....
> 
> [1] http://autobuild.buildroot.net/results/cef4abbe043f3aaad03c73e07cfab9d24c3d0fc9
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> In principle the same patch as
> qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
> (which was moved to the LTS branch only in commit 64f4f6de0c0134b6d81645e8526bde73695ab85e
> 'qt5: bump latest version to 5.9.2' by accident) but the upstream provided version.

Applied to master, thanks.

Peter (Korsgaard): this patch should be backported to 2017.08.x, since
the build failure occurred on this branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
