From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2011 22:42:11 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <201111172123.05834.arnout@mind.be>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <20111116190306.6e9596a0@skate>
 <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
 <201111172123.05834.arnout@mind.be>
Message-ID: <20111117224211.0e793a0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 Nov 2011 21:23:05 +0000,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  With that in mind, I would propose a format like this for backport
> patches:
> 
> <pkg>-<seqno>-from_<nextversion>-description-of-the-patch

Having a comment inside a patch seems to be enough. Sometimes when the
patch is pushed upstream, it's merged in the Git repo of the upstream
project, but there isn't yet a release with the modification, so it
would be hard to known which "nextversion" the patch will be in.

We already have comments in patches, those comments can carry the
upstream status of the patch, which is also compatible with what we
intend to do with the send-patches.org project.

>  I think ThomasP meant that it is best to _remove_ the version numbers.
> A version bumper will most likely try to take along all patches anyway, so
> putting a version number is just increasing the diffstat.  Without version
> numbers, the diffstat will show much better which patches could be
> removed, which ones were added and which ones needed to be modified.

Agreed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
