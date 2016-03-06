From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 06 Mar 2016 10:09:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/czmq: make zmakecert and
 zgossip optional
In-Reply-To: <20160305212707.305f31a0@free-electrons.com>
References: <1457208144-6613-1-git-send-email-joerg.krause@embedded.rocks>
 <1457208144-6613-2-git-send-email-joerg.krause@embedded.rocks>
 <20160305212707.305f31a0@free-electrons.com>
Message-ID: <1457255344.2724.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2016-03-05 at 21:27 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Sat,??5 Mar 2016 21:02:24 +0100, J?rg Krause wrote:
> 
> > 
> > +config BR2_PACKAGE_CZMQ_ZMAKECERT
> > +	bool "zmakecert"
> > +	help
> > +	??Certificate generator for ZeroMQ CURVE security.
> > +
> > +config BR2_PACKAGE_CZMQ_ZGOSSIP
> > +	bool "zgossip"
> > +	help
> > +	??Implements a gossip protocol for decentralized
> > configuration
> > +	??management.
> How big are those binaries? Is it worth adding config options for
> those?

I forget that size does not always matters. They are only some kB and
zgossip is not even installed. I did not checked this properly.

My intentention was to be able to build the static library
successfully, but as you mentioned, the linking issue with libmath is
not fixed by this anyway.

So, I'll mark this as rejected in patchwork.

Best regards
J?rg Krause
