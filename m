From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 15:41:42 +0200
Subject: [Buildroot] [PATCH 1/1] Point libxslt to the correct location
 of libxml2
In-Reply-To: <5f3afc03d1b11ebb3d8d4ceff8ef2a65@ombud.nl>
References: <20180921101913.4366-1-ferdinand@ombud.nl>
 <20180921134318.78ba7545@windsurf>
 <5f3afc03d1b11ebb3d8d4ceff8ef2a65@ombud.nl>
Message-ID: <20180921154142.304957fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 14:53:52 +0200, Ferdinand van Aartsen wrote:

> > Those two minor comments can be fixed when applying the patch, no need
> > to resend just for that.
> 
> I copied behaviour I saw in other .mk files.

If you see other places with $(HOST_DIR)/usr, they should be fixed.

> But I double-checked and saw that host-libxslt configure detects the
> right xml2-config without --with-libxml-prefix anyway. So the host
> part can be left as it was.

Indeed, for host packages, $(HOST_DIR)/bin is in the PATH before /bin
and /usr/bin, so it's going to pickup the xml2-config from Buildroot
prior to the system-installed one.

With those two things to fix, perhaps you could send an updated version
of your patch ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
