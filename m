From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Nov 2013 00:17:50 +0100
Subject: [Buildroot] [PATCH] gcc: use generic infrastructure for patches
In-Reply-To: <20131107001343.7f90de1c@skate> (Thomas Petazzoni's message of
 "Thu, 7 Nov 2013 00:13:43 +0100")
References: <527AB58A.9050506@mind.be>
 <1383778795-15262-1-git-send-email-arnout@mind.be>
 <20131107001343.7f90de1c@skate>
Message-ID: <87y551i0gx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Arnout Vandecappelle (Essensium/Mind),
 > On Wed,  6 Nov 2013 23:59:55 +0100, Arnout Vandecappelle
 > (Essensium/Mind) wrote:

 >> package/gcc/gcc-final/4.2.2-avr32-2.1.5          | 1 +
 >> package/gcc/gcc-final/4.3.6                      | 1 +
 >> package/gcc/gcc-final/4.4.7                      | 1 +
 >> package/gcc/gcc-final/4.5.4                      | 1 +
 >> package/gcc/gcc-final/4.6.4                      | 1 +
 >> package/gcc/gcc-final/4.7.3                      | 1 +
 >> package/gcc/gcc-final/4.8-arc                    | 1 +
 >> package/gcc/gcc-final/4.8.2                      | 1 +

 > The only problem that I see with this symbolic link based solution is
 > that we will have to remember to add/update the three symbolic each
 > time we do a gcc version bump. If we forget to do so, then the build
 > will go on silently, but without having applied the patches.

 > I don't say this problem is a show-stopper, but it's a drawback of this
 > symbolic link solution, IMO.

That was the exact same thought I had. Perhaps it is the best we can
come up with, but it isn't really nice.

-- 
Bye, Peter Korsgaard
