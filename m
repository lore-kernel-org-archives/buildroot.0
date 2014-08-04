From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 21:34:35 +0200
Subject: [Buildroot] [PATCH 1/2] dhcp: Fix config files paths
In-Reply-To: <1407176344-13291-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176344-13291-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140804213435.632989bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon,  4 Aug 2014 20:19:03 +0200, Beno?t Th?baudeau wrote:
> The built dhcp binaries and the installed startup scripts used configuration
> files under /etc/, but the configuration files were installed under /etc/dhcp/.
> Fix everything to have configuration files under /etc/dhcp/.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> ---
>  package/dhcp/S80dhcp-server | 2 +-
>  package/dhcp/dhcp.mk        | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)

Both patches applied, thanks.

As Gustavo rightfully pointed out, it would be nice to be able to
define the value of INTERFACES without modifying the init script
itself, for example using a /etc/default/dhcpd file. But this needs to
be part of a more global work on our initscripts and skeleton.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
