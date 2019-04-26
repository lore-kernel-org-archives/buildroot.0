From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:16:10 +0200
Subject: [Buildroot] [PATCH] network-manager: don't require an external
 DHCP client
In-Reply-To: <20190425001038.11403-1-tpiepho@impinj.com>
References: <20190425001038.11403-1-tpiepho@impinj.com>
Message-ID: <20190426091610.1b4602a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Apr 2019 00:10:46 +0000
Trent Piepho <tpiepho@impinj.com> wrote:

> NetworkManager now has an internal DHCP client.  Therefor, there is no
> need to select either the DHCPCD or DHCP_CLIENT package to get DHCP.
> 
> Remove the forced select of one of those packages.
> 
> The internal DHCP client has become NetworkManager's preferred DHCP
> client, so it seems reasonable that it effectively becomes the default,
> unless DHCPCD or DHCP_CLIENT are intentionally enabled.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/network-manager/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
