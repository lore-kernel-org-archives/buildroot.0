From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 22:59:48 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/synergy: bump to version
 1.8.5
In-Reply-To: <1490782445-12144-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1490782445-12144-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20170329225948.6fcdc023@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 12:14:05 +0200, Pieterjan Camerlynck wrote:
> The project moved from SourceForge to GitHub.
> 
> The buildsystem changed from autotools to CMake.
> 
> Removed patches:
> - 0001-includes.patch
>     Not needed anymore, was fixed upstream.
> - 0002-remove-werror.patch
>     Autotools patch, no longer applicable.
> - 0003-Fix-build-with-gcc-6.patch
>     This patch was applied upstream:
>     https://github.com/symless/synergy/commit/3d963bfbe7897d0a33ad477c06a6341c7708780d
> 
> Add patch to disable building of tests and allow building without gtest.
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
> Changes v2 -> v3:
>  - improve commit log (Baruch Siach)
> Changes v1 -> v2:
>  - drop gtest dependency, updated patch (Thomas Petazzoni)
>  - use full path in install (Thomas Petazzoni)
> ---
>  DEVELOPERS                                         |   1 +
>  ...1-allow-building-of-synergy-without-tests.patch |  86 +++++++++++
>  package/synergy/0001-includes.patch                | 167 ---------------------
>  package/synergy/0002-remove-werror.patch           |  16 --
>  package/synergy/0003-Fix-build-with-gcc-6.patch    |  86 -----------
>  package/synergy/Config.in                          |   5 +-
>  package/synergy/synergy.hash                       |   2 +-
>  package/synergy/synergy.mk                         |  37 +++--
>  8 files changed, 118 insertions(+), 282 deletions(-)
>  create mode 100644 package/synergy/0001-allow-building-of-synergy-without-tests.patch
>  delete mode 100644 package/synergy/0001-includes.patch
>  delete mode 100644 package/synergy/0002-remove-werror.patch
>  delete mode 100644 package/synergy/0003-Fix-build-with-gcc-6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
