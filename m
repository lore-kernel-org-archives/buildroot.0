From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:27:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/assimp: also build with -mxgot
 on mips64(el)
In-Reply-To: <20200825210143.293881-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 25 Aug 2020 23:01:42 +0200")
References: <20200825210143.293881-1-thomas.petazzoni@bootlin.com>
 <20200825210143.293881-2-thomas.petazzoni@bootlin.com>
Message-ID: <87wo1iof46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since the bump of assimp to 5.0.1, we have build failures on mips64el,
 > due to relocations being truncated. The issue seems to be quite
 > similar to the one on m68k coldfire, as both m68k and MIPS have this
 > -mxgot gcc option to switch to using a GOT that has no size limit (but
 > causes less efficient code to be produced).

 > Here as well, the overall relevance of assimp on mips64(el) platforms
 > being probably very limited, the incentive to search for a better
 > solution is pretty limited.

 > Fixes:

 >   http://autobuild.buildroot.net/results/7df487d5117b2ee440a07dbff9cae1b181566748/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
