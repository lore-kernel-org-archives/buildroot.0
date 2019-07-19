From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 19 Jul 2019 20:18:55 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/sdbusplus: new package
In-Reply-To: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
References: <20190702204247.12804-1-jfaith@impinj.com>
 <20190702204247.12804-2-jfaith@impinj.com>
 <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
Message-ID: <1563567534.2343.96.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2019-07-11 at 16:21 +0200, Arnout Vandecappelle wrote:
> 
> > diff --git a/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch b/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
> > new file mode 100644
> > index 0000000000..e1364796fb
> > --- /dev/null
> > +++ b/package/sdbusplus/0001-build-Fix-example-build-with-disable-sdbuspp.patch
> > @@ -0,0 +1,42 @@
> > +From c5d5a94f8e554f160e3f120b826e97b2961e2706 Mon Sep 17 00:00:00 2001
> > +From: Trent Piepho <tpiepho@impinj.com>
> > +Date: Mon, 14 May 2018 16:17:38 -0700
> > +Subject: [PATCH] build: Fix example build with --disable-sdbuspp
> > +
> > +The calculator server example uses the sdbus++ python program to build.
> > +If this has been disabled, then trying to use it to build the example
> > +could fail. For instance, if python and all necessary python packages
> > +are not available. This might be the case when cross-building only
> > +the library component for a target system.
> > +
> > +Don't build the calculator example when sdbus++ has been disabled.
> 
> what's the upstream status of this patch? Please mention it in the patch itself.

It was submitted, back in May 16 2018, https://gerrit.openbmc-project.x
yz/c/openbmc/sdbusplus/+/10629

But merging to sdbusplus requires corporate lawyers to get involved to
for CLA, and a 5 line patch wasn't really worth it.

It was fixed later in another patch:

commit ad7e686b5563a146728aa9477f6e814dc0a3cbd4
Author: Manojkiran Eda <manojkiran.eda@gmail.com>
Date:   Thu Sep 27 13:19:20 2018 +0530

    Avoid build failure when sdbus++ tool is disabled

It would make more sense to include that patch here or to update to a
sdbusplus version that already includes, if one has been released.
