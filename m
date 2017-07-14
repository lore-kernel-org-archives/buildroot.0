From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:12:49 +0200
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <20170714103518.66ca2b7e@windsurf> (Thomas Petazzoni's message of
 "Fri, 14 Jul 2017 10:35:18 +0200")
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
 <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
 <0db10485-c5ee-5097-97f4-aaadd2535761@microchip.com>
 <20170713095003.057fb2bc@windsurf.orange-hotspot.com>
 <20170713153220.GA3002@scaer>
 <2a450d8b-10a6-2be9-b7a7-a659a47bffb0@mind.be>
 <20170714103518.66ca2b7e@windsurf>
Message-ID: <87o9snb1ri.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 14 Jul 2017 00:46:50 +0200, Arnout Vandecappelle wrote:

 >> Or we could look for pkg-$(VERSION).hash and fall back to pkg.hash if that
 >> doesn't exist. But it does complicate the code somewhat.

 > On my side, I continue to think that mixing in the same .hash file the
 > hashes for download artefacts (tarballs, patches, etc.) and hashes for
 > files that are extracted from the tarball is very confusing.

 > Shouldn't we have a separate hash files for the license files, and have
 > this file in the per-version subdirectory ?

As long as we can find a solution for this problem I don't think we
should move to sperate files for license hashes. We have 2k+ packages
and only a very small subset of those have a version selection (and only
a small subset of that subset will change the license text between
versions), so I prefer a less-clean solution for this special case
instead of adding 2k+ extra files to the tree.

-- 
Bye, Peter Korsgaard
