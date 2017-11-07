From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 22:05:03 +0100
Subject: [Buildroot] [PATCH 1/1] Allow adding per-package overrlice
 rsync exclusions
In-Reply-To: <04ece7d7-8192-2029-5edc-63ae48bb7532@mind.be>
References: <20171107015730.20311-1-aperez@igalia.com>
 <04ece7d7-8192-2029-5edc-63ae48bb7532@mind.be>
Message-ID: <20171107220503.179cc727@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 21:57:56 +0100, Arnout Vandecappelle wrote:

> >     WEBKITGTK_OVERRIDE_SRCDIR = /home/aperez/WebKit
> >     WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
> >         --exclude JSTests --exclude ManualTests \
> > 	--exclude PerformanceTests --exclude WebDriverTests \
> > 	--exclude WebKitBuild --exclude WebKitLibraries \
> > 	--exclude WebKit.xcworkspace --exclude Websites \
> > 	--exclude Examples
> > 
> > This saves a good chunk of time when rsync is used for the first time to
> > copy the source tree over before building.  
> 
>  Looks like an interesting feature. Although, if the out-of-tree build feature
> gets merged, it's probably less useful. That is, assuming that webkitgtk
> supports out-of-tree build, which is not a given...

Also my thinking: per-package out of tree build is going to make this
new feature a lot less relevant. That being said, per-package out of
tree build is not there yet, and this new feature is just a very simple
change, so I believe it's OK to merge it.

> > +	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)  
> 
>  Would have been nice to split the long line. But even without split:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Could you also add this feature to the documentation of _OVERRIDE_SRCDIR in the
> manual?

I think we really want the documentation update as part of the patch
series :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
