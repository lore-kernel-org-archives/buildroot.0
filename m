From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:44:41 +0200
Subject: [Buildroot] [PATCH] bash: disable bash malloc by default
In-Reply-To: <20170531223720.4ce3254c@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 31 May 2017 22:37:20 +0200")
References: <20170523171931.18744-1-dsabogalcc@gmail.com>
 <20170531223720.4ce3254c@free-electrons.com>
Message-ID: <87k24vhina.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 23 May 2017 13:19:31 -0400, Daniel Sabogal wrote:
 >> Bash's malloc relies on sbrk which is implemented as
 >> a fail-only stub in musl. Presently, it is disabled
 >> when configured for static libs. Instead, default to
 >> using libc malloc.
 >> 
 >> Fixes:
 >> # bash
 >> bash: xmalloc: locale.c:81: cannot allocate 18 bytes (0 bytes allocated)
 >> 
 >> Signed-off-by: Daniel Sabogal <dsabogalcc@gmail.com>
 >> ---
 >> package/bash/bash.mk | 4 ++--
 >> 1 file changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks. Peter: I believe this can be applied on
 > 2017.02.x as well.

Indeed - Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
