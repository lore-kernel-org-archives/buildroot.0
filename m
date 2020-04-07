From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 21:09:25 +0200
Subject: [Buildroot] [PATCH] package/oprofile: fix build with binutils
 >= 2.34
In-Reply-To: <20200325062634.1780288-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 25 Mar 2020 07:26:34 +0100")
References: <20200325062634.1780288-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lfn7m7tm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The libbfd library provided by binutils unfortunately changed its API
 > in binutils >= 2.34. This is causing some build failures at the moment
 > on architectures such as ARC that are using a very recent binutils
 > version, but it would also cause build failures on other architectures
 > once they start using binutils 2.34.

 > We fix this build issue by backporting an upstream oprofile
 > patch. However, this patch touches configure.ac, which means we need
 > to autoreconf, which needs another fix in configure.ac for autoreconf
 > to succeed.

 > With all that in place, this commit fixes:

 >   http://autobuild.buildroot.net/results/583d281c6cd2aecb65556080b379db24101ae3a8/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
