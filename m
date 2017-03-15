From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 21:41:23 +0100
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <20170315200941.GA3683@free.fr> (Yann E. MORIN's message of "Wed, 
 15 Mar 2017 21:09:41 +0100")
References: <20170313133220.62892a21@free-electrons.com>
 <216f6108-da26-92cc-8177-07117d20092c@andin.de>
 <20170313163306.GA3680@free.fr>
 <20170314091615.2de4a05b@free-electrons.com>
 <adf0f72b-286b-e056-a2ed-24389f852472@andin.de>
 <180611cf-c61b-736d-c753-9df57bb29bc7@andin.de>
 <f785c386-075b-ac22-3114-d09a79dbeffc@mind.be>
 <ece0d310-0f3d-9f1c-e045-70f0f5c4d777@andin.de>
 <ca4c849a-caa1-05f5-a298-a066fc19591a@mind.be>
 <651a8b7e-4910-445e-6613-404be75af105@mind.be>
 <20170315200941.GA3683@free.fr>
Message-ID: <877f3qs26k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Arnout, All,
 > On 2017-03-15 20:46 +0100, Arnout Vandecappelle spake thusly:
 >> On 15-03-17 20:07, Arnout Vandecappelle wrote:
 > [--SNIP--]
 >> Buildroot fakeroot works fine when I have libacl1-dev installed on my system -
 >> the Debian package has a build dependency on libacl1-dev. So we would need to
 >> add host-acl to FAKEROOT_DEPENDENCIES. That also pulls in host-attr. On my
 >> system, it brings the time for 'make host-fakeroot' on a clean output from
 >> 
 >> real    0m12.230s
 >> user    0m8.500s
 >> sys     0m1.132s
 >> 
 >> to
 >> 
 >> real    0m21.945s
 >> user    0m17.724s
 >> sys     0m2.948s
 >> 
 >> so a significant slowdown... Although in absolute numbers it is just 10 seconds,
 >> so maybe it is acceptable.

 > It's either correctness and a bit of overhead, or inconsistencies.

 > I know where my vote lies: correctness. ;-)

Yes, naturally. I vaguely remember something about an earlier discussion
related to host-acl/host-attr, but that was perhaps about pseudo?

-- 
Bye, Peter Korsgaard
