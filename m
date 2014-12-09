From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 00:04:00 +0100
Subject: [Buildroot] [PATCH v5 1/1] set simple network setup via the
 system configuration submenu
In-Reply-To: <1418114924-18826-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1418114924-18826-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20141210000400.35feddd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Tue,  9 Dec 2014 09:48:44 +0100, J?r?my Rosen wrote:
> This patch allows the setup of simple /etc/network/interfaces (or
> /etc/systemd/network/80-buildroot.network if networkd is enabled) via the
> configuration menus instead of using an overlay

So, we discussed this tonight during the patchwork review with Yann,
Peter and Samuel, and the general opinion is that this is too
complicated, and we don't want to handle all those cases through
configuration options, and we instead want to leave that to
project-specific customization through a rootfs overlay or a post-build
script.

However, we would be willing to accept a patch that adds a single
string option that allows to specify one network interface on which
DHCP should be used. It would basically add "inet <foo> dhcp"
to /etc/network/interfaces if non-empty, and otherwise do nothing. The
default should be nothing, so that we keep the existing behavior.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
