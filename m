From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jul 2009 13:55:03 +0200
Subject: [Buildroot] [git commit] linux-advanced: remove unused ancient
	kernel versions
In-Reply-To: <87a5b0800907270244h2172338aj7255258ef1fca9fd@mail.gmail.com>
	(Will Newton's message of "Mon\, 27 Jul 2009 10\:44\:39 +0100")
References: <20090725191956.C0CB37639E@busybox.osuosl.org>
	<4A6CBC18.1020507@atmel.com> <87d47nqiua.fsf@macbook.be.48ers.dk>
	<87a5b0800907270244h2172338aj7255258ef1fca9fd@mail.gmail.com>
Message-ID: <87d47mpch4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

hi,

 >> ?Ulf> I have customers which are still on the 2.6.22 level.
 >> 
 >> Good for them. They are presumably using a 2 year old BR snapshot
 >> as well?

 Will> What is the cost of keeping these options?

The explosion in config combinations - BR is plenty hard to test to any
sensible degree as it is already. We cannot keep on adding new
versions without removing something old. There's several places in BR
where we have to go through extra hoops to support both old and new
stuff, or where combinations noone ever tried breaks.

I think the only realistic option is to keep the number of
combinations down so the remaining options gets more testing.

 Will> Userland and build infrastructure often moves much quicker than
 Will> kernels and I often have to patch support for older kernels back into
 Will> buildroot. It's not a big difficulty but if the cost of keeping the
 Will> options is low I don't see what the gain is in removing them.

Notice that the advanced linux config has options for custom (free
form) versions, so you don't need to patch anything. In fact I think
we should remove all the presets as they are always out-of-date like I
mentioned the other day.

-- 
Bye, Peter Korsgaard
