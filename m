From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:48:30 +0200
Subject: [Buildroot] [PATCH] libqmi: add optional features
In-Reply-To: <20170906212834.18959-1-aleksander@aleksander.es>
References: <20170906212834.18959-1-aleksander@aleksander.es>
Message-ID: <20170906234830.6ba91417@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Sep 2017 23:28:34 +0200, Aleksander Morgado wrote:
> The libqmi library and tools come with several optional features that
> may be enabled or disabled during build.
> 
> This patch adds support to automatically enable or disable them based
> on the presence of the required dependencies for each:
>  * QMI-over-MBIM is enabled if libmbim is selected.
>  * udev support in qmi-firmware-update is enabled if libgudev is
>    selected.
>  * MM runtime check in qmi-firmware-update is enabled if ModemManager
>    is selected (but we don't build-depend on it, the runtime check is
>    done using plain glib2 DBus operations).
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/libqmi/libqmi.mk | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
