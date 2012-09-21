From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Sep 2012 16:11:12 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <1348224356-20104-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 21 Sep 2012 12:45:56 +0200")
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
Message-ID: <87ehlv79fj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout> How was this never caught by the autobuilders?  Do they happen to
 Arnout> build host-pkg-config most of the time?  If so, maybe we should make
 Arnout> the randpackageconfig select a smaller number of packages to increase
 Arnout> the chance of finding this kind of issue...

Committed, thanks.

Lots of stuff indeed pulls in host-pkgconfig, and as 'u' is pretty late
in the alphabet the chance is quite high that it is already available:

ls package | cat -n | grep unionfs
   520	unionfs

ls package | wc -l
559

We do have KCONFIG_PROBABILITY (see 3435c1afb583) that I sometimes play
with, but you need both low and high probability builds as they catch
different issues.

-- 
Bye, Peter Korsgaard
