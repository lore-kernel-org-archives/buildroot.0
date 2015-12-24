From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:02:53 +0100
Subject: [Buildroot] [PATCH v3 05/13] package/dhcp/S80dhcp-server: allow
 empty INTERFACES
In-Reply-To: <1445734779-7212-5-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-5-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151224150253.53ed5811@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 25 Oct 2015 02:59:31 +0200, Beno?t Th?baudeau wrote:
> From: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> The dhcpd daemon does not require network interface names to be
> specified on the command line.
> 
> >From dhcpd(8):
> "The names of the network interfaces on which dhcpd should listen for
> broadcasts may be specified on the command line.  This should be done
> on systems where dhcpd is unable to identify non-broadcast interfaces,
> but should not be required on other systems.  If no interface names
> are specified on the command line dhcpd will identify all network
> interfaces which are up, eliminating non-broadcast interfaces if
> possible, and listen for DHCP broadcasts on each interface."
> 
> dhcpd exits with "Not configured to listen on any interfaces!" only if
> no requested (those in INTERFACES, or all if empty) non-broadcast
> interfaces matching the subnet declarations in dhcpd.conf are up.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> ---
> Changes v2 -> v3: none.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
