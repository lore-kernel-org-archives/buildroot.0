From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:27:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/assimp: workaround m68k build
 issues
In-Reply-To: <20200825210143.293881-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 25 Aug 2020 23:01:41 +0200")
References: <20200825210143.293881-1-thomas.petazzoni@bootlin.com>
Message-ID: <871rjqptox.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On m68k coldfire, we already pass -mxgot, but since the bump to assimp
 > 5.0.1, this is no longer sufficient, and we have failures such as:

 > /tmp/ccqmJLil.s: Assembler messages:
 > /tmp/ccqmJLil.s:307948: Error: value -43420 out of range
 > /tmp/ccqmJLil.s:307985: Error: value -38606 out of range
 > /tmp/ccqmJLil.s:308010: Error: value -38626 out of range
 > /tmp/ccqmJLil.s:308056: Error: value -33280 out of range

 > Since these issues only arise when building with -O2, let's disable
 > the optimization for this package on m68k. The very relative relevance
 > of assimp on m68k coldfire makes the research of a better solution not
 > really useful (for the record, assimp is a "library to import various
 > well-known 3D model formats in a uniform manner").

 > Fixes:

 >   http://autobuild.buildroot.net/results/a7d4fb2653b0f1be4d036ee46a44e72da0ed4376/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
