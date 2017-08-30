From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:30:27 +0200
Subject: [Buildroot] [PATCH v3] modem-manager: update dependencies
In-Reply-To: <20170827104240.10433-1-aleksander@aleksander.es>
References: <20170825142120.26160-1-aleksander@aleksander.es>
 <20170827104240.10433-1-aleksander@aleksander.es>
Message-ID: <20170830233027.5bb6aedf@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Aug 2017 12:42:40 +0200, Aleksander Morgado wrote:
> These are the changes implemented:
> 
>   * Remove dbus-glib as a dependency, as it isn't required since
>     ModemManager 1.0, which is based on libglib2's GDBus
>     implementation.
> 
>   * Remove udev as a dependency, as the ModemManager build only needs
>     the libgudev package.
> 
>   * Explicitly set libglib2 as dependency, which currently was being
>     implicitly included by libgudev. The next major ModemManager
>     release will have udev/libgudev as optional packages, while
>     libglib2 is definitely not going to be ever optional.
> 
>   * Add a comment explaining that dbus is only a runtime dependency.
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/modem-manager/Config.in        | 4 ++--
>  package/modem-manager/modem-manager.mk | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
