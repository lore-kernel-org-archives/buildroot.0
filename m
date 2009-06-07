From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jun 2009 20:53:46 +0200
Subject: [Buildroot] /dev nodes files
In-Reply-To: <20090607184843.GK26148@buzzloop.caiaq.de> (Daniel Mack's message
	of "Sun\, 7 Jun 2009 20\:48\:43 +0200")
References: <20090607184843.GK26148@buzzloop.caiaq.de>
Message-ID: <874ouryix1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> This has been discussed before, but I don't know if there was any
 Daniel> result, so I'm asking again.

 Daniel> After each build, the ixnodes in project_build_arm/uclibc/root/dev are
 Daniel> regular files rather than inodes, which prevents users from exporting
 Daniel> that directory directly as NFS root. Most people run custom scripts to
 Daniel> fix that, but I wonder whether there is any change to get that fixed in
 Daniel> BR2 directly.

Ehh, that's on purpose (E.G. so you don't need root permissions to
build). Just select the tarball target and extract it on your nfs
server.

 Daniel> Any oppinion about such an approach?

What would this buy us that the tarball target doesn't give?

-- 
Bye, Peter Korsgaard
