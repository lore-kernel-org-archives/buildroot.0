From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:02:53 +0200
Subject: [Buildroot] [PATCH v4] package/wpa_supplicant: Fix systemd
 service for new DBus bus name
In-Reply-To: <1460556558-20307-1-git-send-email-m.niestroj@grinn-global.com>
References: <1460556558-20307-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <20160413220253.1e34b413@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 16:09:18 +0200, Marcin Niestroj wrote:
> systemd service files were supplied with old DBus bus name. After
> service activation systemd was waiting for appearance of specified bus
> name to consider it started successfully. However, if wpa_supplicant was
> compiled only with new dbus interface name, then systemd didn't notice
> configured (old) DBus bus name appearance. In the end service was
> considered malfunctioning and it was deactivated.
> 
> Add upstreamable patch [1], which updates systemd service BusName
> property according to configured DBus interface version.
> 
> [1] http://lists.infradead.org/pipermail/hostap/2016-April/035599.html
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v3 -> v4:
>  * Fix commit description (upstream -> upstreamable)
>    (suggested by Arnout)
>  * Add patch reference in hostap mailing list archive
>    (suggested by Arnout)

Applied to master, thanks. Please submit your patch upstream to the
wpa_supplicant developers. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
