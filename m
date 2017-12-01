From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:30:13 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols2: fix examples compile
 without Qt widgets module
In-Reply-To: <20171125215425.21880-1-ps.report@gmx.net>
References: <20171125215425.21880-1-ps.report@gmx.net>
Message-ID: <20171201233013.3c824028@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 22:54:25 +0100, Peter Seiderer wrote:
> Add upstream suggested patch to fix flatstyle example configure
> (needs widgets module).
> 
> Fixes:
> 
>   cd flatstyle/ && ( test -e Makefile || .../host/bin/qmake -o Makefile .../build/qt5quickcontrols2-5.9.2/examples/quickcontrols2/flatstyle/flatstyle.pro ) && make -f Makefile
>   Project ERROR: Unknown module(s) in QT: widgets
>   make[1]: *** [Makefile:202: sub-flatstyle-make_first] Error 3
>   make[1]: Leaving directory '.../build/qt5quickcontrols2-5.9.2/examples/quickcontrols2'
>   make: *** [Makefile:45: sub-quickcontrols2-make_first] Error 2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Note: tested with patch '[PATCH v5] qt5: remove Qt Quick dependency on opengl'
> applied.
> ---
>  ...01-Example-flatstyle-needs-widgets-module.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/qt5/qt5quickcontrols2/5.9.2/0001-Example-flatstyle-needs-widgets-module.patch

Applied to master after changing the patch location so that it applies
to the 5.9.3 version (I verified, it still applies correctly).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
