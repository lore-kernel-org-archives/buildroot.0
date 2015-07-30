From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:27:11 +0200
Subject: [Buildroot] [PATCH 03/47] package/libcec: bump to version 3.0.1
In-Reply-To: <1437597069-6448-4-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730152711.2d508410@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:30:25 +0200, Bernd Kuhls wrote:
> - reflect upstream changes of the build system by switching from
>   an autotools-package to cmake-package
> - package is broken with gcc 4.5.4
>   https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591
>   "4.6 is no longer supported. you need a C++ 11 compatible compiler,
>    so 4.7 or newer"
>   Since buildroot does not contain gcc 4.6 anymore, using
>   depends on !BR2_GCC_VERSION_4_5_X
>   is enough.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in                     |    2 ++
>  package/libcec/0001-remove-Wno-psabi.patch |   21 ---------------------
>  package/libcec/Config.in                   |    4 ++++
>  package/libcec/libcec.mk                   |   23 +++++++++++++++--------
>  4 files changed, 21 insertions(+), 29 deletions(-)
>  delete mode 100644 package/libcec/0001-remove-Wno-psabi.patch

Applied with some changes:

    [Thomas:
      - remove the gcc 4.5 dependency. While we do need a dependency on
        the gcc version, the proposed implementation was not correct as it
        wasn't handling external toolchains.
      - add a patch to fix a problem caused by libcec build system trying
        to use 'git' to get a version number, which does not work when the
        version control system information is not available, as is the
        case in Buildroot.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
