From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 11:38:39 +0100
Subject: [Buildroot] [PATCH 1/4] package/openobex: disable on Blackfin
In-Reply-To: <CAHXCMMK+CvjV8fYCE=gVg1iMeoZYppJiy0HfK8QJ8pck+U_oxA@mail.gmail.com>
References: <20171101201137.29939-1-s.martin49@gmail.com>
 <20171101232343.764c231a@windsurf>
 <CAHXCMMK+CvjV8fYCE=gVg1iMeoZYppJiy0HfK8QJ8pck+U_oxA@mail.gmail.com>
Message-ID: <20171102113839.07a5f135@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 09:01:28 +0100, Samuel Martin wrote:

> >> diff --git a/package/openobex/Config.in b/package/openobex/Config.in
> >> index e611b8d803..4a4dc214ef 100644
> >> --- a/package/openobex/Config.in
> >> +++ b/package/openobex/Config.in
> >> @@ -1,5 +1,6 @@
> >>  config BR2_PACKAGE_OPENOBEX
> >>       bool "openobex"
> >> +     depends on !BR2_bfin
> >>       help
> >>         Free open source implementation of the Object Exchange (OBEX)
> >>         protocol.  
> >
> > What about the Config.in comment, and the reverse dependencies of
> > BR2_PACKAGE_OPENOBEX ?  
> 
> Well, I was not really sure about what to mention... and also wanted
> to heard Waldemar opinion.

I don't understand what you mean here. If you're adding a new
dependency to a package, you must:

 - Propagate it to the Config.in comment of that package

 - Propagate it to the reverse dependencies of that package

So I'm not sure how you can be "not really sure about what to mention".

You must add a "depends on !BR2_bfin" in the Config.in comment, and
then a depends on !BR2_bfin to all reverse dependencies of openobex,
including their Config.in comments. There is nothing to "mention".

But since Waldemar has submitted a patch to fix the actual problem in
uClibc, this is all moot :)

> FYI, this commit 53996bee433f09a91b12aa53b2be0f7d22c0acbe seems to fix
> a similar issue.

We should revert this commit once Waldemar fix is merged, and we have
rebuilt the toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
