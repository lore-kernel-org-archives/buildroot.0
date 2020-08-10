From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Aug 2020 16:36:29 +0200
Subject: [Buildroot] sysklogd 1.6: messages from klogd are logged to
 user facility
In-Reply-To: <006a01d66ef1$b5af8140$210e83c0$@ipcomm.de>
References: <01bd01d66b51$a7eba690$f7c2f3b0$@ipcomm.de>
 <20200805225153.7e4bb864@windsurf.home>
 <008501d66bd6$7ac48080$704d8180$@ipcomm.de>
 <006a01d66ef1$b5af8140$210e83c0$@ipcomm.de>
Message-ID: <20200810163629.2157d61e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Mon, 10 Aug 2020 10:39:06 +0200 (CEST)
Andreas Hilse <andreas.hilse@ipcomm.de> wrote:

> Latest sysklogd 2.1.2 fixes the issue.
> 
> I'm trying to upgrade the sysklogd package and like to clarify some things
> before submitting a patch.
> 
> Package now provides its own logger tool which could interfere with the
> same from busybox or util-linux.

Well, the overlap with Busybox already exists, and that's why Busybox has:

BUSYBOX_DEPENDENCIES = \
	...
        $(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \

This way Busybox is installed *after* sysklogd, and Busybox
installation process is careful enough to not overwrite already
installed binaries.

However, klogd being removed from sysklogd, I'm not sure how this will
end up working: it is possible that Busybox will install its own klogd
symlink anyway.


> I already made it a selectable option in the Config.in but is there
> anything to be done concerning busybox/util-linux?

What have you made selectable ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
