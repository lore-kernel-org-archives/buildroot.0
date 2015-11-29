From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2015 22:12:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: remove
	HOSTCC_VERSION
In-Reply-To: <565B63EC.70907@mind.be> (Arnout Vandecappelle's message of "Sun, 
 29 Nov 2015 21:45:32 +0100")
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <87fuzx676p.fsf@dell.be.48ers.dk> <56536E0C.1010205@mind.be>
 <20151129185224.695095a2@free-electrons.com> <565B63EC.70907@mind.be>
Message-ID: <87si3oo6g9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> gcc version 4.4.5 (Debian 4.4.5-8)
 >> 
 >> (Yes, I'm running old stuff. On purpose.)

 >  So, should we set it to 4.4?

I think so, yes. With the autobuilder running we're fairly confident
that it really works with such an old gcc.


 >  Ideally we should have a test instance on RHEL5 as well, there are definitely
 > still company deployments based on that. RHEL5 has gcc 4.1.

I agree that we should have an autobuilder instance running with our
minimum hostcc version we support, as these kind of things can very
easily break without us noticing.

With that said, I really question the sensibility of building modern
packages on a 10 year old host system (gcc 4.1.0 is from February 2006),
and I would guess quite some stuff is broken.

And if something important is (or becomes in the future) broken, do we
spend time on fixing it?  What if upstream doesn't care about ancient
systems?


 >  RHEL4 has gcc 3.4 but I don't think that that is very useful.

No, please not.

-- 
Venlig hilsen,
Peter Korsgaard 
