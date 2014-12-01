From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 01 Dec 2014 11:20:27 -0300
Subject: [Buildroot] [PATCH 1/1] package/dhcp: Only install the relevant
 unit file
In-Reply-To: <1417443496-9198-1-git-send-email-nroach44@gmail.com>
References: <1417443496-9198-1-git-send-email-nroach44@gmail.com>
Message-ID: <547C792B.4030101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2014 11:18 AM, Nathaniel Roach wrote:

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

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
