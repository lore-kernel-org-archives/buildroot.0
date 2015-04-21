From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 21 Apr 2015 13:38:26 +0000
Subject: [Buildroot] [PATCH v2] busybox: add option for standalone
	telnetd on target
In-Reply-To: <1426152671-13125-1-git-send-email-abrodkin@synopsys.com>
References: <1426152671-13125-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1429623506.2624.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, 2015-03-12 at 12:31 +0300, Alexey Brodkin wrote:
> If target has connection to the network it might be pretty useful to
> have telnet connection to it instead of serial console or even in
> addition to serial console.
> 
> Even though it's possible to add telnetd on target manually via:
>  [a] Busybox - with "make busybox-menuconfig" and in "Networking
> Utilities" select "telnetd"
>  [b] xinetd
> 
> Still additional manual steps will be required to allow root login over
> telnet and telnet daemon auto-start on boot.
> 
> With this change it will be possible to get telnetd built and installed
> on target with only enabling BR2_SYSTEM_STANDALONE_TELNETD option in
> Buildroot configuration utility or in boards defconfig.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> 
> Changes in v2:
>  * STANDALONE_TELNETD option moved from "system" to Busybox package
>  * Added auto-start script for telnet daemon
>  * Added warning in Kconfig about possible Telnet security issues with mention
>    of SSH to be used instead on production systems
> 
> ---
>  package/busybox/Config.in  | 22 ++++++++++++++++++++++
>  package/busybox/S50telnet  | 20 ++++++++++++++++++++
>  package/busybox/busybox.mk | 14 ++++++++++++++
>  system/system.mk           | 17 +++++++++++++++++
>  4 files changed, 73 insertions(+)
>  create mode 100755 package/busybox/S50telnet

I've got a reminder about my pending Buildroot patches and that one is
one of them.

I'm still interested in this one and would like at least to discuss if
that updated version suits Buildroot or as we discussed in v1 comments
it's a no go in favor to ssh for debugging over network.

-Alexey
