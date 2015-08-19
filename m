From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Aug 2015 23:05:29 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
	is set
In-Reply-To: <20150819190534.GA13372@free.fr> (Yann E. MORIN's message of
 "Wed, 19 Aug 2015 21:05:34 +0200")
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr>
Message-ID: <87r3mz6lba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Arguably, xtables-addons should be (if possible) converted over to using
 > the kernel-modules infra, which should (will) take care of that (in the
 > future). I'll try to see if I can convert it.

Yeah, agreed.

 > Yes, I'm thinking about it...

 > I think the plan I'll be goign with is to add a hidden Kconfig knob that
 > packages that want to build a kernel module will have to select.

Why not just like the kernel-module infrastructure handle it like I
proposed? I don't think it is very nice that people have to remember to
add the select as well (and chances are they won't notice if they
forget).

 >   - will we need to _check_ for any arbitrary kernel option to be set,
 >     and offer packages a simple mean to do so?

 >   - will we need to _force_ (on or off) any other kernel option, and
 >     offer packages a simple mean to do so?

Like Thomas says, we are already doing the 2nd option and I think it
makes sense to keep on doing so - So I don't think there's a common need
for the first.

-- 
Bye, Peter Korsgaard
