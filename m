From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:27:29 +0200
Subject: [Buildroot] [PATCH 04/47] package/kodi: bump version to 15.0
 Isengard
In-Reply-To: <1437597069-6448-5-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730152729.03ca26b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:30:26 +0200, Bernd Kuhls wrote:
> - added libsquish as new dependency
>   https://github.com/xbmc/xbmc/commit/f73653d62b09db8cab7662ae7c4b2dab596b4ab0#diff-3b3a6ec97232deb43dc14319a73872c1R2207
> 
> - updated build procedure for host version of texturepacker
> 
> - removed SDL dependencies
>   http://kodi.wiki/view/Kodi_v15_%28Isengard%29_changelog#Linux_Specific
>   "Removed dependencies of SDL (Simple DirectMedia Layer) for everything
>    but hardware abstraction for input devices"
> 
> - added mips support:
>   https://github.com/xbmc/xbmc/commit/5d1746ad5b2272ba5f906ad9a49a87b650bda14a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/0001-Fixup-include-path.patch         |   48 --------------
>  package/kodi/0002-texturepacker.patch              |   16 +++++
>  ...0003-ALSA-fix-device-change-event-support.patch |   67 ++++++++++++++++++++
>  package/kodi/Config.in                             |   10 +--
>  package/kodi/kodi.mk                               |   38 ++++++-----
>  5 files changed, 107 insertions(+), 72 deletions(-)
>  create mode 100644 package/kodi/0002-texturepacker.patch
>  create mode 100644 package/kodi/0003-ALSA-fix-device-change-event-support.patch

Applied, with some changes:

    [Thomas:
     - don't do a manual fixup of kodi-config.cmake, and instead patch it
       to use CMAKE_FIND_ROOT_PATH. This will also avoid having to pass
       -DCMAKE_MODULE_PATH to all Kodi add-ons .mk files.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
