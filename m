From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 00:08:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix build for mips,
 2nd attempt
In-Reply-To: <e81f16a3-c182-a4ae-8c79-7c9ae85b23a7@mind.be> (Arnout
 Vandecappelle's message of "Sun, 20 Jun 2021 18:25:57 +0200")
References: <20210609190141.996573-1-bernd.kuhls@t-online.de>
 <e81f16a3-c182-a4ae-8c79-7c9ae85b23a7@mind.be>
Message-ID: <87h7hp7ds7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 09/06/2021 21:01, Bernd Kuhls wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/da0/da03909291e97c525eb1f53dfc743a1897f59d6e/
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 >  I've added a description to the commit message to explain why this fix was
 > needed. Hopefully my analysis was correct:

 >     The patch introduced in commit
 >     uses "defined(HAVE_SYS_AUXV_H)". However, ffmpeg configure is not GNU
 >     autoconf, and it defines the symbol to 0 when not found. Use
 >     HAVE_SYS_AUXV_H without defined() instead.

 > (and now I see I forgot to fill in the commit hash... Too late now! Oh well.)

Committed to 2021.05.x after adding the commit hash, thanks.

-- 
Bye, Peter Korsgaard
