From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Mon, 14 Dec 2015 14:20:02 +0100
Subject: [Buildroot] support for device tree overlays ?
In-Reply-To: <566DF673.50903@proximus.be>
References: <566DF673.50903@proximus.be>
Message-ID: <20151214132002.GB10052@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

On Sun, Dec 13, 2015 at 11:51:31PM +0100, Johan Sagaert wrote:
> 
> Is there some support yet for device tree overlays ?

Not in the official Buildroot tree yet. But I made some modifications to
to generate device tree blobs with overlay support and device tree overlays
from the Buildroot build system.

You can find the three patches at:
https://github.com/NextThingCo/CHIP-buildroot.git at/2015.08/overlays

The first one adds a patched version of DTC as an host package, with
overlay support.

The second one modifies the Linux mk file to allow generating device
tree blobs with overlay support from the kernel sources.

The last an third one allows to compile external device tree overlays
blobs.

> As i understand using overlays would be a cleaner way to adjust the device
> tree to my needs without having
> to change existing dts files.

That depends. If you need to permanently disable or enable a node on a
board, do not use overlays. There are here to modify a device tree
on the fly, to enable or disable features in some board. For example
they can be used to reconfigure a board when an external cape is plugged
in.

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151214/167dc26f/attachment.asc>
