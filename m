From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 23 Sep 2009 21:14:06 +0200
Subject: [Buildroot] use of HOST_GLIB
In-Reply-To: <87pr9hv6i2.fsf@macbook.be.48ers.dk>
References: <1253706849.1618.60.camel@sven>
	<8763b9rfde.fsf@macbook.be.48ers.dk> <1253714491.1618.68.camel@sven>
	<87pr9hv6i2.fsf@macbook.be.48ers.dk>
Message-ID: <1253733246.14595.19.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-09-23 at 20:52 +0200, Peter Korsgaard wrote:

>  >> Ahh, those must have been missed when we fixed the glib-genmarshal
>  >> stuff. The proper variable to use is LIBGLIB2_HOST_BINARY.
> 
>  Sven> That is a rather strange name. Nothing in LIBGLIB2_HOST_BINARY
>  Sven> tells me that this is glib-genmarshal. What's the variable to use
>  Sven> for glib-mkenums then ?
> 
> Well, it's just following the approach of the other host packages, but
> you can use $(HOST_DIR)/usr/bin/glib-genmarshal as well now that we're
> compiling it ourselves. I don't see any references in the tree to a
> explicitly defined glib-mkenums, should there be?

Well, it's pretty much the same story as with glib-genmarshal, perhaps
not as commonly used though. glib-mkenums is a code-generation tool that
glib installs and that applications and libraries using glib may use in
their Makefiles. The AM_PATH_GLIB_2_0() macro uses pkg-config to find
out where glib has installed it and defines the GLIB_MKENUMS variable
pointing to the binary. There is also gobject-query, which is probably
even less commonly used.

So yes, I think there should be a HOST_GLIB_MKENUMS variable and I think
that LIBGLIB2_HOST_BINARY should be rather be named
HOST_GLIB_GENMARSHAL.


Sven
