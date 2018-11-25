From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 09:21:43 +0100
Subject: [Buildroot] [PATCH 4/4 v2] support/dependencies: add a check
 for a suitable gzip
In-Reply-To: <CANQCQpYSBb27wxgtaJMHLguWO1crNuThsJ5Ys8+6gWhZ5tMstQ@mail.gmail.com>
 (Matthew Weber's message of "Sun, 18 Nov 2018 08:41:38 -0600")
References: <cover.1542474939.git.yann.morin.1998@free.fr>
 <ba548d03f79279b7f02605006a709ffc630e8639.1542474939.git.yann.morin.1998@free.fr>
 <CANQCQpY9KckNd=VjAu7AHuUeURoCRhY=5gP-wfOf_-Kog0e-sg@mail.gmail.com>
 <20181118134403.GB2601@scaer>
 <CANQCQpYSBb27wxgtaJMHLguWO1crNuThsJ5Ys8+6gWhZ5tMstQ@mail.gmail.com>
Message-ID: <87pnut5zzc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> So, we really don't want to build it if the host provides it.

 > Agree.  What about adding the option that if only the reproducible
 > option is enabled, then we build all host tools we have a version
 > dependency on (ie. all those we'd normally just conditionally build)?

I think there are a number of use cases where BR2_REPRODUCIBLE would be
interesting (E.G. we have discussed turning it on by default), but you
do no want to pay the extra build time for building these host
utilities.

So I'm open to an option to force building all host dependencies, but it
should be keyed from a separate configuration option and not
BR2_REPRODUCIBLE.

-- 
Bye, Peter Korsgaard
