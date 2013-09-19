From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 16:59:17 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: new package
In-Reply-To: <523AFFFA.7020809@mind.be>
References: <1379533013-13209-1-git-send-email-mlweber1@rockwellcollins.com>
 <523A2AEE.4070606@mind.be>
 <OF635D0B64.199C14BF-ON86257BEB.000D9C69-86257BEB.004AD41E@rockwellcollins.com>
 <523AFFFA.7020809@mind.be>
Message-ID: <20130919165917.021f2bd4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Matthew,

On Thu, 19 Sep 2013 15:45:30 +0200, Arnout Vandecappelle wrote:

> > After removing libsysfs and libcap (below) that leaves openssl.  Since
> > that's conditional, would something like this be reasonable?
> > if BR2_INET_IPV6
> >          select BR2_OPENSSL
> > endif
> 
>   Correct, except that it should be:
> 
> 	select BR2_OPENSSL if BR2_INET_IPV6

Just curious: does this package really needs OpenSSL only when IPv6
support is available? At first sight, I don't quite see why SSL support
and IPv6 support would be related, but maybe I'm missing something?

At least, this unusual select should carry a comment above it that
explains why it is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
