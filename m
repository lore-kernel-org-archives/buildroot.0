From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 May 2019 21:54:24 +0200
Subject: [Buildroot] [RFC PATCH] package/util-linux: build libraries as
 a separate package
In-Reply-To: <20190507165158.10427-1-unixmania@gmail.com>
References: <20190507165158.10427-1-unixmania@gmail.com>
Message-ID: <20190507215424.791e69d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Tue,  7 May 2019 13:51:58 -0300
unixmania at gmail.com wrote:

> The findmount and lsblk utilities need udev to work correctly but cannot
> be built with udev support because the packages providing libudev (eudev
> and systemd) depend on util-linux, creating a chicken-egg problem. Solve
> it by means of the following changes:

Thanks a lot for working on this topic. It is obviously becoming a
nightmare :-/

> - Add the util-linux-libs package, which provides libblkid, libfdisk,
>   libmount, libsmartcols and libuuid. It needs a small patch to
>   install the uuidd.h header, used to build the uuidd utility.
> - Make util-linux depend on util-linux-libs and build only the programs.
>   This requires a quite intrusive patch that modifies Makefile.am and
>   some Makemodule.am files, thus requiring AUTORECONF.

Could you get in touch with upstream util-linux, expose the problem,
and see if they would be willing to merge some changes that would help
building only the programs ?

The best would of course be for upstream to realize that there is now a
circular dependency, and that it should be broken up by splitting
util-linux upstream itself in two separate projects.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
