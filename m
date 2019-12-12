From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:27:59 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk,
 support/scripts/fix-rpath: fix per-package regexp
In-Reply-To: <20191211122500.1261296-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 11 Dec 2019 13:25:00 +0100")
References: <20191211122500.1261296-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sglqhukg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Commit c4e6d5c8be6ada8e7c60950e3b499c55d48761cb ("core: implement
 > per-package SDK and target") had a mistake on the regexp that is used
 > to match $(PER_PACKAGE_DIR)/<something>/, and due to this, the regexp
 > was never matched.

 > The + sign in [^/]+ which was suggested by Yann E. Morin during the
 > review of the per-package patch series (instead of [^/]*) needs to be
 > escaped to be taken into account correctly. Without this, the regexp
 > doesn't match, and the replacement is not done, causing:

 >  (1) For the libtool fixup in pkg-generic.mk, the lack of replacement
 >      causes libtool .la files to not be tweaked as expected, which it
 >      turn causes build failures reported by the autobuilder.

 >  (2) For the fix-rpath, the RPATH of host binaries in the SDK were not
 >      correct.

 > Interestingly, we have the same regexp in
 > support/scripts/check-host-rpath, but here the + sign does not need to
 > be escaped.

 > Fixes:

 >   http://autobuild.buildroot.net/results/d4d996f3923699e266afd40cc7180de0f7257d99/ (libsvg-cairo)
 >   http://autobuild.buildroot.net/results/56330f86872f67a2ce328e09b4c7b12aa835a432/ (bind)
 >   http://autobuild.buildroot.net/results/9e0fc42d2c9f856b92954b08019b83ce668ef289/ (ibrcommon)
 >   and probably a number of other similar issues

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
