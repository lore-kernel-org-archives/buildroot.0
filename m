From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:10:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/wpa_supplicant: add config
 option to build wpa_client library
In-Reply-To: <1446366918-4504-1-git-send-email-joerg.krause@embedded.rocks>
References: <1446366918-4504-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151220151039.3719aded@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun,  1 Nov 2015 09:35:18 +0100, J?rg Krause wrote:
> Version 2.5 of wpa_supplicant introduces the config option
> CONFIG_BUILD_WPA_CLIENT_SO to enable building wpa_client as shared library.
> 
> We need to add a patch from upstream to fix a runtime error with
> libwpa_client.so:
>   Error relocating /usr/lib/libwpa_client.so: bin_clear_free: symbol not found
> 
> Cc: Martin Bark <martin@barkynet.com>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v2:
>  - depends on dynamic build (Martin Bark)
>  - Installs -> Install in help text
>  - Add upstream patch
> ---
>  .../wpa_supplicant/0002-fix-libwpa_client.patch    | 39 ++++++++++++++++++++++
>  package/wpa_supplicant/Config.in                   |  9 +++++
>  package/wpa_supplicant/wpa_supplicant.mk           | 24 +++++++++++++
>  3 files changed, 72 insertions(+)
>  create mode 100644 package/wpa_supplicant/0002-fix-libwpa_client.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
