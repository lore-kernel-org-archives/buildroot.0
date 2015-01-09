From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Fri, 9 Jan 2015 11:28:12 +0100
Subject: [Buildroot] [PATCH v3] Allow a single DHCP configuration via
 the system configuration submenu
In-Reply-To: <1420709805-13040-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1420709805-13040-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <CABbD_XCR9JPtU3FV2tb-D17G0J+i_buXdt=5=cU3XPsdAkzVcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?my, Thomas, Gustavo, list,

On Thu, Jan 8, 2015 at 10:36 AM, J?r?my Rosen <jeremy.rosen@openwide.fr>
wrote:

> This patch allows the setup of simple a single interface to be
> automatically brought up and configured via DHCP on system startup.
>
> The interface name can be set via a configuration option. This patch
> does not support systemd-networkd, any complex network configuration should
> be done via overlay of /etc/network/interfaces or the relevant networkd
> configuration file
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
>
> Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested with uClibc, successfully built different rootfs.ext images and
booted them.
Tested with master branch, x86_64 arch in QEMU, internal toolchain GCC
4.9.2 w/ uclibc, Linux 3.18.1.

I recommend maybe adding a dependency in Config.in later for package
ifupdown (not yet merged, proposed by Gustavo), if no Busybox is present in
the system.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150109/1d10d023/attachment.html>
