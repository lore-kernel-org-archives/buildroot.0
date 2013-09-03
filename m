From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Sep 2013 08:26:07 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <5224B8C9.7060609@mind.be> (Arnout Vandecappelle's message of
 "Mon, 02 Sep 2013 18:11:53 +0200")
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
 <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
 <5224B8C9.7060609@mind.be>
Message-ID: <87r4d6775s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  What is much more likely to happen is that there is some optional
 Arnout> dependency in the package's configure or build system that is not
 Arnout> expressed in Config.in or pkg.mk. Most reviewers do not run a
 Arnout> configure --help', and even then it is easy to miss something. Since
 Arnout> the dependency is optional, the build will not fail either way. Only,
 Arnout> when user A builds it, TLS support is included, but when user B builds
 Arnout> it, it is not... That's the kind of lack of reproducability we really
 Arnout> need to avoid.

Indeed.

 Arnout>  Note that doing more randomized build order in the autobuilder also
 Arnout> will not capture the latter scenario. You would have to compare the
 Arnout> build result - but binary differences are likely because of changing
 Arnout> timestamps or changing optimizations depending on memory randomness.

Exactly. I don't have any good ideas about how to detect this (besides
building all packages in clean staging dirs, E.G. only populated with
its explicit dependencies like afaik OE lite can do, but that would
require quite some work), anyone?

-- 
Bye, Peter Korsgaard
