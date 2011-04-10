From: Gerhard Heift <ml-buildroot-20110324-cba5@gheift.de>
Date: Sun, 10 Apr 2011 11:54:04 +0200
Subject: [Buildroot] init not PID 1
In-Reply-To: <4DA08A90.2020708@michaelburghart.de>
References: <4DA08A90.2020708@michaelburghart.de>
Message-ID: <20110410095403.GF14333@wastebin.kawo1.rwth-aachen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 09, 2011 at 06:34:24PM +0200, Michael Burghart wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> once again. I just found out that I cannot shutdown with init. It complains:
> 
> init: must be run as PID 1

You have to use "halt" or "poweroff". Busybox does not support runlevels so you
cannot run "init 0" to shutdown your system.

> (which is correct).
> But why is it not 1?

This message comes from the new spawned init process, which gets a "usual" pid
like any other process. There should already be an init process with the pid 1.

> cheers
> - -micha-

Regards,
  Gerhard
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110410/88b3d11c/attachment.asc>
