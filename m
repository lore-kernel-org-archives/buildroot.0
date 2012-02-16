From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 16 Feb 2012 09:49:53 +0100
Subject: [Buildroot] [RFC PATCH 4/6] apply-patches.sh: directories are
 considered as a collection of patches
In-Reply-To: <20120215165104.GI4723@ldesroches-Latitude-E6320>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <4497cd4c9ca71e3bba7da6b9906319f6c40862be.1328492511.git.ludovic.desroches@atmel.com>
 <201202102340.46608.arnout@mind.be>
 <20120215165104.GI4723@ldesroches-Latitude-E6320>
Message-ID: <20120216084953.GB2943@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 15, 2012 at 05:51:04PM +0100, Ludovic Desroches wrote:
> Hello Arnout,
> 
> On Fri, Feb 10, 2012 at 11:40:46PM +0100, Arnout Vandecappelle wrote:
> >    On Monday 06 February 2012 02:47:17 ludovic.desroches at atmel.com wrote:
> > 
> >    > From: Ludovic Desroches <ludovic.desroches@atmel.com>
> > 
> >    >
> > 
> >    > Behaviour of directories is changed: it is no more considered as an
> >    overlay,
> > 
> >    > but rather a collection of patches. Subdirectories are not supported.
> > 
> >    Actually, I think the directory feature could be removed completely.
> >    It's
> > 
> >    not used anywhere at the moment and I don't see why anyone would want
> >    to use it.
> > 
> 
> Even if this feature is not used, I think we have to keep it. For instance,
> into an archive we may have several directories with patches into each of them.

Reading the Buildroot Developer Day you have sent, keeping this feature may
cause issues with versioned patches scheme.

I mean I don't know which parameters will be passed to apply-patches but I
worry about having package/foo/ (with some version directories into it) as
parameter and then explore and apply all the patches contained into this tree.

I would like to keep it because I was thinking of debian-patches like: a
structure with several directories where we may find some patches. From the
top of my head I think it's not the case for debian-patches because patches
are located at the root level but I presume that we could face this kind of
patch.


Regards

Ludovic
