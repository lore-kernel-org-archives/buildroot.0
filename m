From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 23:42:11 +0200
Subject: [Buildroot] [PATCH v1] qt5serialbus: examples need qt5 widgets
 module
In-Reply-To: <20180814211309.17510-1-ps.report@gmx.net>
References: <20180814211309.17510-1-ps.report@gmx.net>
Message-ID: <20180814234211.4d09f40d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 23:13:09 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   make[2]: Entering directory '.../build/qt5serialbus-5.11.1/examples'
>   Some of the required modules (qtHaveModule(widgets)) are not available.
>   Skipped.
>   [...]
>   cp -dpfr .../host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/qt/examples/serialbus .../target/usr/lib/qt/examples/
>   cp: cannot stat '.../host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/qt/examples/serialbus': No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/147809b5f8758af935bee48c0fc83fd86a8509e9
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5serialbus/qt5serialbus.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. We really need to switch to using "make
install" for target installation of Qt5 modules at some point. This
will allow to avoid duplicating all the installation logic in our .mk
file, including all those conditionals.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
