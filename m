From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 00:57:55 +0100
Subject: [Buildroot] [PATCH] pkg-download: Make a shallow clone for git
	downloads
In-Reply-To: <1351732866-29730-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 1 Nov 2012 02:21:05 +0100")
References: <1351732866-29730-1-git-send-email-arnout@mind.be>
Message-ID: <87hap6w870.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> When downloading from git, we clone the whole repository and then only
 Arnout> use the latest commit.  That's a lot of redundant stuff.  So instead,
 Arnout> make a shallow clone.  Unfortunately that's only possible when
 Arnout> downloading a branch or tag, so fall back to the old method if git gives
 Arnout> an error.

 Arnout> This speeds up the cloning of a linux git from more than 2 hours to
 Arnout> 20 minutes on a 200KB/s link).

And just think what difference it will make on the hotel Grumps
connection ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
