From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 17:29:21 +0100
Subject: [Buildroot] [PATCH 1/2] qt5script: Disable on non-supported
 platforms
In-Reply-To: <1385654237-36389-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
 <1385654237-36389-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131128172921.4c7fc988@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 28 Nov 2013 15:57:16 +0000, Vicente Olivert Riera wrote:
> Is the same problem as Qt4 QtScript, it doesn't build because it uses
> JavaScriptCore, so we re-use the existing
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT option which already lists which
> platforms are supported by JavaScriptCore.
> 
> This is a quick fix. A proposed fix to add support for MIPS64 has
> already been sent to Qt:
> 
>    https://bugreports.qt-project.org/browse/QTBUG-35191
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/231/231c112a3fc18e6cd7d6d10873e22144525c7280/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/qt5/qt5script/Config.in |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/qt5/qt5script/Config.in
> b/package/qt5/qt5script/Config.in index 3c5d60c..8f03e75 100644
> --- a/package/qt5/qt5script/Config.in
> +++ b/package/qt5/qt5script/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_QT5SCRIPT
>  	bool "qt5script"
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT

No. Qt5 stuff should not use a symbol that is specific to Qt4, as the
set of architectures supported by Qt4 may be different than the set of
architectures supported by Qt5.

Also, your patch series looks weird: it starts with PATCHv3 1/2 to fix
qt4, then PATCH v3 2/2 to fix grantle, and then in the same thread (so
same patch series), it continues with PATCH 1/2 and PATCH 2/2 for qt5.
Either make separate patch series, or better, just one patch series
with all patches (so PATCHv3 1/4 to PATCHv3 4/4).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
