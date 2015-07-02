From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 2 Jul 2015 11:49:02 +0200
Subject: [Buildroot] [PATCH 2/2] xen: new package
In-Reply-To: <1435573321.32500.248.camel@hellion.org.uk>
References: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
 <1435241096-23969-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150629121202.23c1ebae@free-electrons.com>
 <1435573321.32500.248.camel@hellion.org.uk>
Message-ID: <20150702094902.GL2266@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 29, 2015 at 11:22:01AM +0100, Ian Campbell wrote:
> > > +++ b/package/xen/0001-xencommons-create-log-directory-before-using-it.patch
> > > @@ -0,0 +1,31 @@
> > > +From a7d1fde9a14ca0cf9c3f7c7950a6f9ea89ff58a6 Mon Sep 17 00:00:00 2001
> > > +From: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > +Date: Thu, 25 Jun 2015 15:47:42 +0200
> > > +Subject: [PATCH] xencommons: create log directory before using it
> > > +
> > > +In the case where /var/log is volatile, for example when using a tmpfs, the
> > > +/var/log/xen directory will not be found on the system, and every attempt
> > > +to log something to one of the files in that directory will fail.
> > > +
> > > +Create it in the xencommons init script
> > > +
> > > +Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > +---
> > > + tools/hotplug/Linux/init.d/xencommons.in | 1 +
> > > + 1 file changed, 1 insertion(+)
> > > +
> > > +diff --git a/tools/hotplug/Linux/init.d/xencommons.in b/tools/hotplug/Linux/init.d/xencommons.in
> > > +index a1095c29ce0f..89210a02120a 100644
> > > +--- a/tools/hotplug/Linux/init.d/xencommons.in
> > > ++++ b/tools/hotplug/Linux/init.d/xencommons.in
> > > +@@ -61,6 +61,7 @@ do_start () {
> > > + 
> > > + 	mkdir -p ${XEN_RUN_DIR}
> > > + 	mkdir -p ${XEN_LOCK_DIR}
> > > ++	mkdir -p /var/log/xen
> > > + 
> > > + 	if ! `${BINDIR}/xenstore-read -s / >/dev/null 2>&1`
> > > + 	then
> > > +-- 
> > > +2.4.3
> > > +
> > 
> > Has this patch been submitted upstream?
> 
> It would be great if it could be, ideally it should use ${XEN_LOG_DIR},
> which would involve adding it to Config.mk:BUILD_MAKE_VARS such that it
> will appear in hotplugpath.sh (which is included by xencommons.in at
> runtime).
> 
> You might also want to create ${XEN_LOG_DIR}/console to support folks
> enabling guest console logging too.

Ok, I'll change that and submit the patches.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150702/8a62b82b/attachment.asc>
