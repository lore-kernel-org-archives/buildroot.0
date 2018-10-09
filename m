From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 22:04:32 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix qt_open64 related compile
 failure
In-Reply-To: <20181009182718.27846-1-ps.report@gmx.net>
References: <20181009182718.27846-1-ps.report@gmx.net>
Message-ID: <20181009220432.7c006073@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 20:27:18 +0200, Peter Seiderer wrote:
> Add upstream patch fixing ([1], [2]):
> 
>   .obj/qlinuxfbscreen.o: In function `QLinuxFbScreen::initialize()':
>   qlinuxfbscreen.cpp:(.text+0xa6c): undefined reference to `qt_open64(char const*, int, unsigned int)'
>   qlinuxfbscreen.cpp:(.text+0x1042): undefined reference to `qt_open64(char const*, int, unsigned int)'
>   qlinuxfbscreen.cpp:(.text+0x10aa): undefined reference to `qt_open64(char const*, int, unsigned int)'
>   qlinuxfbscreen.cpp:(.text+0x1746): undefined reference to `qt_open64(char const*, int, unsigned int)'
> 
> [1] http://autobuild.buildroot.net/results/66f55a311dcf9d54ca6148b232287973ba226999
> [2] http://autobuild.buildroot.net/results/a4759e8cea09a597dbeb82f6c673ddc531d419e8
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0005-Export-qt_open64-from-QtCore.patch   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
