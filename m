From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 15:09:09 +0100
Subject: [Buildroot] [PATCH 1/1] dhcpcd: systemv and systemd services
 conflict with NetworkManager
In-Reply-To: <71FE4BA8-F083-4A73-A05D-262F9C28E9E2@impinj.com>
References: <71FE4BA8-F083-4A73-A05D-262F9C28E9E2@impinj.com>
Message-ID: <20190206150909.5b542c7d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kim,

On Tue, 1 May 2018 00:02:45 +0000
Jim Brennan <jbrennan@impinj.com> wrote:

> When NetworkManager and dhcpcd packages are both enabled,
> dhcpcd services and NetworkManager both spawn dhcpcd.  This causes
> the network port to retrieve an IP address and later lose it a few
> seconds after startup.
> 
> This patch prevents dhcpcd services from launching dhcpcd if
> NetworkManager is enabled.
> 
> Signed-off-by: Jim Brennan <jbrennan@impinj.com>
> ---
>  package/dhcpcd/dhcpcd.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master. Sorry for the long delay! I've just added a comment
in dhcpcd.mk to explain this new condition that may sound a bit weird.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
