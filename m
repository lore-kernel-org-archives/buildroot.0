From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 3 Nov 2017 23:20:17 +0100
Subject: [Buildroot] [PATCH 1/1] duktape: new package
In-Reply-To: <20171103223514.13a83e94@windsurf>
References: <20171103195343.29670-1-fontaine.fabrice@gmail.com>
 <20171103223514.13a83e94@windsurf>
Message-ID: <CAPi7W80e2AUko7WXdKbbZ9pBQE+SDUHnKTstA7386msnVOEuxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks for this quick review.

2017-11-03 22:35 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> Thanks for this new contribution!
>
> On Fri,  3 Nov 2017 20:53:43 +0100, Fabrice Fontaine wrote:
>
> > diff --git a/package/duktape/0002-Don-t-copy-headers-in-install-target.patch
> b/package/duktape/0002-Don-t-copy-headers-in-install-target.patch
> > new file mode 100644
> > index 000000000..391a89f6d
> > --- /dev/null
> > +++ b/package/duktape/0002-Don-t-copy-headers-in-install-target.patch
> > @@ -0,0 +1,28 @@
> > +From e5e839b96332229a860424b451fe3d678ff2d0f2 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Fri, 3 Nov 2017 20:10:41 +0100
> > +Subject: [PATCH] Don't copy headers in install target
> > +
> > +Don't copy headers in install target to be able to use this Makefile to
> > +install duktape library in staging and target directory
>
> I'm not sure what you're trying to do here. Install headers to
> $(TARGET_DIR) is perfectly fine, they get cleaned up at the end of the
> build during the target-finalize step. Essentially all libraries
> install everything to $(TARGET_DIR): headers, static library, shared
> library, pkg-config files, documentation, and what is not needed on the
> target gets cleaned up by the logic in target-finalize.
>
> We don't want to hack each and every package so that it doesn't install
> its headers or static library to $(TARGET_DIR). We very much prefer to
> use the existing "make install" logic of packages, and have a common,
> shared, logic in target-finalize to do the cleanup.
>
> Or did I miss the purpose of this particular patch?
>
The issue with the original Makefile is that it tries to copy the two
header files in $(TARGET_DIR)/usr/include which does not exist so I had
several choices:
- create this directory in duktape.mk
- add "-a" option to the cp in the original Makefile
- remove the cp

I chose the third option but I can go with the first or second one. Which
one do you prefer?

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171103/bde32727/attachment.html>
