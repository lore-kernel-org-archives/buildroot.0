From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 10:21:33 +0200
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <kprol2$uk1$1@ger.gmane.org>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org> <20130619082557.447efce8@skate>
 <kprol2$uk1$1@ger.gmane.org>
Message-ID: <20130619102133.7570dcd4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Wed, 19 Jun 2013 18:03:51 +1000, Adam Nielsen wrote:

> No I don't want the target binutils, but I don't seem to be able to disable 
> it.  It's deselected in the buildroot config, but it still seems to be getting 
> compiled.  How would I go about working out why?  I'm not sure how to debug 
> all the make dependencies.

./support/script/graph-depends > dependencies.dot
dot -Tpdf -o dependencies.pdf dependencies.dot
<Your Preferred PDF Viewer> dependencies.pdf

and check what is pointing to "binutils". The "dot" command is part of
the "graphviz" package in most distributions.

Another solution is to pastebin your full .config file somewhere and
give us the link, we may be able to point what's triggering the target
binutils build.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
