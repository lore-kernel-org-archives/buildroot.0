From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 27 Aug 2010 12:14:47 +0200
Subject: [Buildroot] [PATCH] Add xorg support and upgrade for mp3 issue.
In-Reply-To: <20100822125740.3f3bdea1@surf>
References: <1282404097-12535-1-git-send-email-max@marretta.com>
	<20100822125740.3f3bdea1@surf>
Message-ID: <1282904087.9686.13.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2010-08-22 at 12:57 +0200, Thomas Petazzoni wrote:
> Hello Massimiliano,
> 
> Thanks for reworking the patch with Git. I have a couple of comments,
> though. First, does the X.org support needs to be part of the same
> patch as the version bump ? In other words, shouldn't this be split in
> several smaller patches (one to bump the versions, one to add X.org
> support) ?

Also there should be some caution when upgrading gstreamer to the latest
version. Starting with gstreamer 0.10.30, gstreamer is making the
transition from liboil to liborc. Here's a snippet from the GStreamer
Base Plug-ins 0.10.30 release notes:

        Use Orc (Optimized Inner Loops Runtime Compiler) for SIMD and
        other optimisations, and remove liboil dependency. The main goal
        for this release was to make the transition from liboil to
        liborc. Performance improvements should not be expected and will
        be the focus of future versions. liborc is an optional
        dependency for the time being, to make it possible to test and
        develop the very latest GStreamer versions on systems that don't
        have orc yet. However, without orc slow unoptimised backup code
        will be used for many performance critical code paths.
        Distributors are urged to package and ship the latest version of
        liborc and compile GStreamer modules with --enable-orc. Please
        do not distribute GStreamer packages that are not orc enabled.

So I suggest that gstreamer and the gst plug-ins are only updated to
0.10.29 for the time being. Then liborc should be added to buildroot and
as soon as that package has landed, an update to 0.10.30 can be
attempted.


Sven


-- 
Sven Neumann
Head of Software Development

RAUMFELD GmbH | Reichenberger Str. 124 | 10999 Berlin | Germany
Tel: +49.30.340.60.98.0 | Fax: +49.30.340.60.98.99 | s.neumann at raumfeld.com
