From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:32:46 +0200
Subject: [Buildroot] [PATCH] vsftpd: Add build option to disable utmpx
	update code
In-Reply-To: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
 (Maarten ter Huurne's message of "Tue, 16 Sep 2014 15:17:30 +0200")
References: <1410873450-19158-1-git-send-email-maarten@treewalker.org>
Message-ID: <87tx3968v5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maarten" == Maarten ter Huurne <maarten@treewalker.org> writes:

 > This was modeled after a similar option for Dropbear.
 > The utmpx code is automatically disabled when compiling with musl,
 > to avoid a build error due to WTMPX_FILE being undefined. Note that
 > musl has an empty utmpx implementation, so no functionality is lost
 > by not calling it.

 > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 > ---
 > Note that previously the utmpx code was being built, so this patch
 > changes the default behavior. I think this is not a problem because
 > most systems would not have a valid utmpx file, but it might be worth
 > mentioning in the release notes.

Committed with the minor change suggested by Thomas, thanks.

-- 
Bye, Peter Korsgaard
