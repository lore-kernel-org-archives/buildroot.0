From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2014 23:18:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: Add patch to
 fix build error with musl
In-Reply-To: <1417644227-16408-1-git-send-email-jkrause@posteo.de>
References: <1417644227-16408-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141203231804.7101c099@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed,  3 Dec 2014 23:03:47 +0100, J?rg Krause wrote:
> Add a patch to allow building wpa_supplicant with the musl C library.
> 
> Building wpa_supplicant with the musl C library fails since musl does not
> define type names such as '__uint32_t'. To support building wpa_supplicant
> with the musl C library use the integer types declared in the ISO C standard
> header file <stdint.h>.
> 
> Patch is sent upstream:
> http://lists.shmoo.com/pipermail/hostap/2014-December/031464.html
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  .../wpa_supplicant-0001-fix-musl-build-error.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/wpa_supplicant/wpa_supplicant-0001-fix-musl-build-error.patch

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

wpa_supplicant indeed doesn't build with musl without this patch, and
builds fine with this patch applied. And the patch looks sane.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
