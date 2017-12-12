From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 07:12:52 +0100
Subject: [Buildroot] [PATCH v1] qt5charts: fix qt5base widgets/gui
 selection
In-Reply-To: <20171210220131.29440-1-ps.report@gmx.net>
References: <20171210220131.29440-1-ps.report@gmx.net>
Message-ID: <20171212071252.28f68126@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Dec 2017 23:01:31 +0100, Peter Seiderer wrote:
> Selection of BR2_PACKAGE_QT5BASE_WIDGETS needs BR2_PACKAGE_QT5BASE_GUI too.
> 
> Fixes qt5base configure failure ([1]):
> 
>   ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.
> [1] http://autobuild.buildroot.net/results/69c4385b2fd484d16f749b4cde6967f5cabea8b2
> 
> and buildroot warning:
> 
>   warning: (... && BR2_PACKAGE_QT5CHARTS && ...) selects BR2_PACKAGE_QT5BASE_WIDGETS
>   which has unmet direct dependencies (BR2_PACKAGE_QT5 && BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5BASE_GUI)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5charts/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
