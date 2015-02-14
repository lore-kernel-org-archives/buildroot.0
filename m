From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:45:06 +0100
Subject: [Buildroot] [PATCH] qt5connectivity: fix for big endian
 platforms
In-Reply-To: <1423683449-50204-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423683449-50204-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150214084506.45da1b31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 11 Feb 2015 19:37:29 +0000, Vicente Olivert Riera wrote:
> Add a patch to fix qt5connectivity for big endian platforms.
> 
> Building qtconnectivity fails for big endian platforms because the
> bswap_16 function is not declared. This is the error message:
> 
> In file included from bluez/hcimanager_p.h:52:0,
> 		 from bluez/hcimanager.cpp:35:
> ./bluez/bluez_data_p.h: In function 'quint16 bt_get_le16(const void*)':
> ./bluez/bluez_data_p.h:172:60: error: 'bswap_16' was not declared in
> this scope
>      return bswap_16(bt_get_unaligned((const quint16 *) ptr));
> 
> bswap_16 is defined in byteswap.h so we can include this file in order
> to fix this problem.
> 
> This patch has been submitted upstream:
> 
>   https://bugreports.qt.io/browse/QTBUG-44421
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/5b8/5b85c6819f94988abd8abfcdaad6226ceb2d790a/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...z_data_p.h-Add-missing-include-byteswap.h.patch |   46 ++++++++++++++++++++
>  1 files changed, 46 insertions(+), 0 deletions(-)
>  create mode 100644 package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
