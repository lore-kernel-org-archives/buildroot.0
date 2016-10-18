From: Matt Kraai <kraai@ftbfs.org>
Date: Tue, 18 Oct 2016 06:47:54 -0700
Subject: [Buildroot] [PATCH] qt5base: fix misspelling of "directfb"
In-Reply-To: <20161018114556.238563ea@free-electrons.com>
References: <20161018020957.2662-1-kraai@ftbfs.org>
 <20161018114556.238563ea@free-electrons.com>
Message-ID: <20161018134754.lp7vtfqt3j33hp5z@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Oct 18, 2016 at 11:45:56AM +0200, Thomas Petazzoni wrote:
> On Mon, 17 Oct 2016 19:09:56 -0700, Matt Kraai wrote:
> 
> > -comment "directfb backend if directb is enabled"
> > +comment "directfb backend if directfb is enabled"
> >  	depends on !BR2_PACKAGE_DIRECTFB
> 
> Thanks, but this sentence in fact doesn't make a lot of sense. It
> should be something like:
> 
> 	directfb backend needs directfb to be enabled
> 
> Or perhaps no comment at all because it's completely obvious that to
> use DirectFB functionality, you need DirectFB.

If the comment is removed, then there is no indication that a directfb
backend is available if directfb is disabled.  That's inconsistent
with the handling of the other backends, which have the following
comments if they're not available:

* X.org XCB backend available if X.org is enabled
* eglfs backend available if OpenGL and EGL are enabled

Should I still remove the comment?  Or make the message consistent
with the other backends (i.e., "directfb backend available if directfb
is enabled")?

-- 
Matt                                           https://ftbfs.org/~kraai/
