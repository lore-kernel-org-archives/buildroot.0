From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 20:26:03 +0100
Subject: [Buildroot] Analysis of bug #5030: busybox built fails if we
	use an override src dir BUSYBOX_OVERRIDE_SRCDIR and that dir
	does not contain .config
In-Reply-To: <CAAXf6LVADN6CwMA-dtHk3WCYemROMXwPrCntuka9s0nBj2DVkA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 12 Feb 2014 11:55:06
 +0100")
References: <CAAXf6LWUf7Jj78OuZOWOX4=N5PU0XwY872k2aK2-75JMj25JRg@mail.gmail.com>
 <20140212092118.66cb9514@skate>
 <CAAXf6LXauh9AM15fgOC8L8jdfL5nG+zQtuFCjX1A9dasBpanXg@mail.gmail.com>
 <20140212115118.71cc1154@skate>
 <CAAXf6LVADN6CwMA-dtHk3WCYemROMXwPrCntuka9s0nBj2DVkA@mail.gmail.com>
Message-ID: <87sirorv3o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >>> > I also accept the principle of this patch.
 >>> >
 >>> > As a side note, this behavior of busybox.mk was also problematic when
 >>> > trying to implement out of tree build for packages, because .config is
 >>> > inherently part of the *build* directory, but the build directory
 >>> > doesn't exist yet during the extract step: it is only created at the
 >>> > beginning of the configure step. So my out-of-tree patch set contains:
 >>> >
 >>> > -# We do this here to avoid busting a modified .config in configure
 >>> > -BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 >>> > -
 >>> >  define BUSYBOX_CONFIGURE_CMDS
 >>> > +       $(BUSYBOX_COPY_CONFIG)
 >>> >
 >>> 
 >>> Then maybe we should apply exactly this change, and not the proposed
 >>> one that uses a hook?
 >>> Additionally, we should then also make this change in uclibc, right?
 >> 
 >> Yes. But I would like to hear Peter's opinion on this.

 > Peter, what do you think?

I don't feel strongly about it, but if changing it to "the linux way"
solves problems, then lets do it.

-- 
Bye, Peter Korsgaard
