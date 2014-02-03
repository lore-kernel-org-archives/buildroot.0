From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 08:10:41 +0100
Subject: [Buildroot] [PATCH] Added menu entry to build squashfs host
 tools separately
In-Reply-To: <52EE8618.7040708@mind.be>
References: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
 <20140131092259.6ce95cd4@skate> <52EE8618.7040708@mind.be>
Message-ID: <20140203081041.12e92a72@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sun, 02 Feb 2014 18:53:28 +0100, Arnout Vandecappelle wrote:

> > In the other filesystems, we do not necessarily select
> > BR2_PACKAGE_HOST_<utilities to build the filesystem>, and therefore we
> > keep the <pkg>_DEPENDENCIES that contains host-<utilities to build the
> > filesystem>.
> 
>   I would actually prefer to have both the select and the dependencies, 
> since that's what we do for target packages.

But then we should be consistent and do this all over the place: as
soon as a host package has a Config.in symbol, then it should be
selected by its reverse dependencies.

>   In addition (but that's just a small consideration), if at some point 
> we make TARGETS contain only the target targets (heh), then the 
> dependency chain for filesystems is still correct.

Hum, there are some host packages that we want to build and that are
not dependencies of target packages. That's the very reason why we have
the "Host utilities" menu.

That being said, it would certainly be good to have two make variables:

 * TARGET_PACKAGES
 * HOST_PACKAGES

that are respectively used to contain the list of targets for
enabled target packages, and the list of targets for enabled host
packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
