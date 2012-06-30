From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jul 2012 00:26:53 +0200
Subject: [Buildroot] [PATCH] pkg-download: handle interrupted wget
	downloads
In-Reply-To: <1341092583-14212-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 30 Jun 2012 23:43:03 +0200")
References: <1341092583-14212-1-git-send-email-arnout@mind.be>
Message-ID: <87zk7k307m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> When a wget download is interrupted, the downloaded file is
 Arnout> still created.  It will therefore not be re-downloaded in the
 Arnout> next build, and the extraction will fail.

 Arnout> To avoid this, download to a temporary file first and rename
 Arnout> when the download is successful.

 Arnout> The existing mechanism doesn't work for interrupted downloads
 Arnout> because the whole sub-shell is interrupted, so the rm-part
 Arnout> never gets executed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
