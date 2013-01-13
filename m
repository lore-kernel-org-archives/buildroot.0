From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 20:39:42 +0100
Subject: [Buildroot] [PATCH] linux, uboot, mxs-bootlets,
	barebox: avoid double slash in CUSTOM_TARBALL
In-Reply-To: <1357769564-11514-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 9 Jan 2013 23:12:44 +0100")
References: <1357769564-11514-1-git-send-email-arnout@mind.be>
Message-ID: <87fw24yirl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The $(dir ...) function leaves a slash at the end, so that the LINUX_SITE
 Arnout> variable for a custom tarball ends in a slash. The DOWNLOAD macro adds
 Arnout> another slash between SITE and SOURCE, which results in a double slash in
 Arnout> the download URL.

 Arnout> Fix this by stripping off the final slash from the _SITE in all packages that
 Arnout> have a custom tarball.

 Arnout> Fixes https://bugs.busybox.net/show_bug.cgi?id=5846

Committed, thanks.

-- 
Bye, Peter Korsgaard
