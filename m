From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:55:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcp: Only install the relevant
 unit file
In-Reply-To: <1417443496-9198-1-git-send-email-nroach44@gmail.com>
References: <1417443496-9198-1-git-send-email-nroach44@gmail.com>
Message-ID: <20141207215526.52616a93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Mon,  1 Dec 2014 22:18:16 +0800, Nathaniel Roach wrote:
> Previous to this patch, if BR2_PACKAGE_DHCP_CLIENT was selected,
> dhcpd.service was installed to the target on systemd systems.
> 
> On the resultant system, this would mean that systemctl would
> show an error starting dhcpd.service, as the requisite files
> do not exist. This does not cause issue on sysvinit systems
> as the init scripts silently error when the files aren't found.
> 
> Fix this by adding a conditional check to the install define.
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/dhcp/dhcp.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
