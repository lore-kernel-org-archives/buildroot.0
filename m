From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 May 2012 13:05:04 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
 helper functions
In-Reply-To: <4FAD92BB.5040606@mind.be>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate> <4FAD92BB.5040606@mind.be>
Message-ID: <20120512130504.7ef01d0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le Sat, 12 May 2012 00:29:15 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I agree that it looks too cryptic.  Certainly with the eval and call things.
> And we should indeed try to keep the package .mk files as intuitive as
> possible.
> 
>   However, my purpose was not to save a few lines, but rather to make sure
> that package contributors do things the correct way.

I agree it would have been nice, but there are many things that we
verify during review, and this could be one of the things to verify
when a new package is added, or updates to existing packages are made.

>   I was probably just trying too hard to support all possible use cases.
> What about adding something like:
> 
> SYSTEMD_AUTO_CONF_ENABLE_DEPS += acl
> 
> which would get expanded to the whole ifeq thing in the AUTOTARGETS call?
> This only works if the buildroot package name is the same as the
> --enable/--disable option, but that already catches many cases.

I am still personally not a big fan of this. What's happening is really
too magic.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
