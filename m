From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 8 Sep 2014 09:27:21 +0000
Subject: [Buildroot] [PATCH 2/2] zeromq: add dependency on atomic
	operations
In-Reply-To: <20140908092356.39e9c633@free-electrons.com>
References: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
 <1410157964-8422-3-git-send-email-abrodkin@synopsys.com>
 <20140908092356.39e9c633@free-electrons.com>
Message-ID: <1410168440.4784.19.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-09-08 at 09:23 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon,  8 Sep 2014 10:32:44 +0400, Alexey Brodkin wrote:
> 
> > diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
> > index e17963e..9f32c51 100644
> > --- a/package/cppzmq/Config.in
> > +++ b/package/cppzmq/Config.in
> > @@ -5,6 +5,7 @@ config BR2_PACKAGE_CPPZMQ
> >  	depends on BR2_LARGEFILE # util-linux
> >  	depends on BR2_USE_WCHAR # util-linux
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > +	depends on BR2_ARCH_HAS_ATOMICS # zeromq
> >  	select BR2_PACKAGE_ZEROMQ
> >  	help
> >  	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
> 
> Same thing here: you should change the comment to *not* display it if
> the architecture doesn't have atomic intrinsics.

I assume comments from the previous patch apply here as well, right?
Especially since atomic ops are only used in "libpgm", i.e. if only
BR2_PACKAGE_ZEROMQ_PGM is enabled.

-Alexey
