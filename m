From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 01:48:14 +0200
Subject: [Buildroot] [PATCH 03/16] package/dbus: fix machine-id when
 using systemd
In-Reply-To: <1421684056-5266-4-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-4-git-send-email-maxtram95@gmail.com>
Message-ID: <20150713014814.5f8bb1eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:03 +0200, Maxim Mikityanskiy wrote:
> When systemd is used, /var/lib/dbus becomes dangling symlink, because
> nobody does mkdir /tmp/dbus, so /var/lib/dbus/machine-id could not be
> written. On SysVinit systems there is init script that creates
> /tmp/dbus.
> 
> This patch preserves old behavior for SysVinit systems, and introduces
> new one for systemd-booted systems: /var/lib/dbus is a persistent
> directory, it holds symlink /var/lib/dbus/machine-id -> /etc/machine-id
> as machine-id(5) suggests, and /etc/machine-id is managed by systemd.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/dbus/dbus.mk | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
