From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 8 Nov 2017 14:46:35 +0200
Subject: [Buildroot] [PATCH 1/1] Allow adding per-package overrlice
 rsync exclusions
In-Reply-To: <20171107220503.179cc727@windsurf>
References: <20171107015730.20311-1-aperez@igalia.com>
 <04ece7d7-8192-2029-5edc-63ae48bb7532@mind.be>
 <20171107220503.179cc727@windsurf>
Message-ID: <20171108144635.GB28359@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just noticed that there's a typo in the patch subject line
(s/overrlice/override/), which I have to fix  O:-)

On Tue, 7 Nov 2017 22:05:03 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
> 
> On Tue, 7 Nov 2017 21:57:56 +0100, Arnout Vandecappelle wrote:
> 
> > >     WEBKITGTK_OVERRIDE_SRCDIR = /home/aperez/WebKit
> > >     WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
> > >         --exclude JSTests --exclude ManualTests \
> > > 	--exclude PerformanceTests --exclude WebDriverTests \
> > > 	--exclude WebKitBuild --exclude WebKitLibraries \
> > > 	--exclude WebKit.xcworkspace --exclude Websites \
> > > 	--exclude Examples
> > > 
> > > This saves a good chunk of time when rsync is used for the first time to
> > > copy the source tree over before building.  
> > 
> >  Looks like an interesting feature. Although, if the out-of-tree build feature
> > gets merged, it's probably less useful. That is, assuming that webkitgtk
> > supports out-of-tree build, which is not a given...

WebKit supports out-of-tree builds (thanks to CMake, and that our build
definitions do not do anything weird in this regard). I know that at least
we the WebKitGTK+ developers make out-of-tree builds regularly so it is not
likely to break in the future ? and if it did, it would be a bug on our side.

> Also my thinking: per-package out of tree build is going to make this
> new feature a lot less relevant. That being said, per-package out of
> tree build is not there yet, and this new feature is just a very simple
> change, so I believe it's OK to merge it.

How about packages which do not support out-of-tree builds? Wouldn't it still
be useful to be to define additional rsync flags for them? 

> > > +	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)  
> > 
> >  Would have been nice to split the long line. But even without split:
> > 
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > 
> >  Could you also add this feature to the documentation of _OVERRIDE_SRCDIR in the
> > manual?
> 
> I think we really want the documentation update as part of the patch
> series :)

Good point, I'll add add the edit for the manual as well and submit a new
version of the patch.

Cheers,

--
 Adri?n ?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171108/08ca02ae/attachment.asc>
