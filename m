From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Feb 2013 23:11:35 +0100
Subject: [Buildroot] [PATCH] neard: fix build with kernel headers 3.1 -
	3.6
In-Reply-To: <1361036067-26971-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 16 Feb 2013 18:34:27 +0100")
References: <1361034167-10068-1-git-send-email-arnout@mind.be>
 <1361036067-26971-1-git-send-email-arnout@mind.be>
Message-ID: <87621qmvzc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> neard uses the linux/nfc.h header which is fairly recent, so we have a
 Arnout> patch that creates linux-nfc.h and uses it if necessary. However, since
 Arnout> the bump to 0.9, neard uses some symbols that are introduced in linux 3.7
 Arnout> so the build fails with headers 3.1 (which introduced nfc.h) to 3.6.

 Arnout> To resolve that, add a check for one of the newly introduced symbols
 Arnout> (that is used by neard).

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout> v2: Forgot to include <sys/socket.h>.

 Arnout> Probably wanted for 2013.02.

Committed, thanks. Don't forget to send upstream.

-- 
Bye, Peter Korsgaard
