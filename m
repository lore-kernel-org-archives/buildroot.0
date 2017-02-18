From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 09:49:48 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-02-16
In-Reply-To: <20170217211242.GC3470@free.fr> (Yann E. MORIN's message of "Fri, 
 17 Feb 2017 22:12:42 +0100")
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
Message-ID: <87ino7ubmb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

Thanks for the big review!

 >> or1k | gstreamer1-1.10.3 | NOK |
 >> http://autobuild.buildroot.net/results/717d78ce0935749f477bdf3133b6f20057a28c01

 >     error "Could not detect architecture; don't know whether it supports
 >     unaligned access! Please file a bug."

 > Not available on or1k? Gustavo?

Gstreamer just needs to be told if or1k support unaligned access or
not. I don't know much about openrisc, but as it is mips like I would
think not.

Same issue for gstreamer 0.10. We already have logic in gstreamer1.mk to
handle this, but from a quick look it seems upstream no longer detects
this in the configure script but instead using a bunch of ifdefs in
gstconfig.h.

I will send patches to fix both gstreamer versions.

-- 
Bye, Peter Korsgaard
