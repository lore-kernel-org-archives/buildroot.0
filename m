From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 06 May 2013 14:01:52 -0500
Subject: [Buildroot] [PATCH] chrony: new package
In-Reply-To: <20130506194935.6340c5a8@skate>
References: <1367856775-4502-1-git-send-email-ntl@pobox.com>
 <20130506192044.398293f1@skate>
 <1367862156.2177.8.camel@doorstop.aus.2wire.com>
 <20130506194935.6340c5a8@skate>
Message-ID: <1367866912.2177.14.camel@doorstop.aus.2wire.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2013-05-06 at 19:49 +0200, Thomas Petazzoni wrote:
> Dear Nathan Lynch,
> 
> On Mon, 06 May 2013 12:42:36 -0500, Nathan Lynch wrote:
> 
> > > Also, did you check that this program indeed builds with a minimal
> > > uClibc toolchain (no thread, no wchar, no locale, no nothing) ?
> > 
> > Sorry, no, that was sloppy of me.  I will do so for v2 and try to
> > better specify the package's needs and dependencies.  I'd be happy to
> > try any configs you'd care to point out...
> 
> You can try a very minimal build: no thread, no wchar, no locale, no
> C++, no nothing. If it builds, you're all set. If your package doesn't
> build, then something is missing.
> 
> If you don't want to spend too much time building toolchains, you can
> use:
> 
>  http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic.tar.bz2
>  as an external toolchain that is minimal (no C++, no wchar, no locale,
>  no largefile, etc. but it has thread support)
> 
>  http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-nothread.tar.bz2
>  as an external that has everything (C++, wchar, locale, largefile,
>  etc.), but doesn't has thread support.
> 
> If your package builds with both, then normally you should be all set.

Thank you for this guidance.  I verified that the package builds with
both of these and found no issues (I did realize it needs MMU, however).
I will do similarly for future package submissions.

v2 with the rest of your feedback addressed on its way.
