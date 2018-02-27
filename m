From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 22:03:26 +0100
Subject: [Buildroot] [PATCH v2] pcre2: add patch fixing a build issue on
 m68k
In-Reply-To: <20180227205047.20356-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 27 Feb 2018 21:50:47 +0100")
References: <20180227205047.20356-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h8q2m9gh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > A pretty nasty difference in alignment rules between most
 > architectures and m68k lead pcre2 to fail building its 16-bit and
 > 32-bit variants on m68k. This commit adds a patch that fixes that.

 > Fixes:

 >   http://autobuild.buildroot.net/results/f6a45df5cb80e3fd94d57163bd28a0014a02bf4/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes since v1:
 > - Slightly improve the patch for the 32-bit variant. As noted by Peter
 >   Korsgaard, the unused[] array should be before the occu[] array in
 >   this case, to keep the same structure layout.

Committed, thanks.

-- 
Bye, Peter Korsgaard
