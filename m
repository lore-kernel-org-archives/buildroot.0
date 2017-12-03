From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:07:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-stalker: needs libxml2
In-Reply-To: <20171203182310.23780-1-bernd.kuhls@t-online.de>
References: <20171203182310.23780-1-bernd.kuhls@t-online.de>
Message-ID: <20171203230759.55f72334@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 19:23:10 +0100, Bernd Kuhls wrote:
> Since
> https://git.buildroot.net/buildroot/commit/package/kodi?id=bf9bfd065ba3fab328fd041ca040f2bf134fecf2
> kodi itself does not depend on libxml2 anymore which previously
> provided libxml2 still needed by kodi-pvr-stalker:
> https://github.com/kodi-pvr/pvr.stalker/blob/Krypton/CMakeLists.txt#L12
> 
> Fixes a build error not caught by autobuilders because they do not have
> host jdk installed:
> CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
>   Could NOT find LibXml2 (missing: LIBXML2_LIBRARIES LIBXML2_INCLUDE_DIR)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-stalker/Config.in           | 1 +
>  package/kodi-pvr-stalker/kodi-pvr-stalker.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
