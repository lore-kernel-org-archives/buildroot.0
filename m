From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:06:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: bump to version 3.2.0
In-Reply-To: <20191226223757.265559-1-fontaine.fabrice@gmail.com>
References: <20191226223757.265559-1-fontaine.fabrice@gmail.com>
Message-ID: <20191230140629.6fc1a74d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 26 Dec 2019 23:37:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patches (already in version)
> - Add patch to fix static build with pcap by reverting an upstream
>   commit. This patch has been sent upstream and there is already some
>   comments on it. However, upstream does not seem to really care/test
>   static builds. So, perhaps an easier road would to add a dynamic
>   library dependency on wireshark instead of fixing things again and
>   again each time wireshark is bumped...

It would be fine for me to make wireshark depends on !BR2_STATIC_LIBS.

> - Add mandatory speexdsp dependency to avoid using internal one when
>   building wireshark or sharkd:
>   https://github.com/wireshark/wireshark/commit/186f985793cceb7d7222955987df72ab5a82beeb
> - Disable -Werror (it is now enabled by default)
> - Add brotli optional dependency:
>   https://github.com/wireshark/wireshark/commit/9ce60b173bf17b7d20695d9dc1de050989019664
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-CMake-add-USE_STATIC-option.patch    |  70 ------------
>  ...ke-Add-libpcap-imported-library-targ.patch | 104 ++++++++++++++++++
>  ...pkg-config-to-find-pcap-dependencies.patch |  45 --------
>  ...-config-to-find-libxml2-dependencies.patch |  48 --------
>  package/wireshark/Config.in                   |   1 +
>  package/wireshark/wireshark.hash              |   6 +-
>  package/wireshark/wireshark.mk                |  13 ++-
>  7 files changed, 119 insertions(+), 168 deletions(-)
>  delete mode 100644 package/wireshark/0001-CMake-add-USE_STATIC-option.patch
>  create mode 100644 package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch
>  delete mode 100644 package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch
>  delete mode 100644 package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
