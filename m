From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 08 Apr 2017 08:28:25 +0000
Subject: [Buildroot] [Bug 9796] source-check broken for Github downloads
In-Reply-To: <bug-9796-163@https.bugs.busybox.net/>
References: <bug-9796-163@https.bugs.busybox.net/>
Message-ID: <bug-9796-163-dKZ1NjpaV4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9796

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
But this has nothing to do with github, right? It is simply the source-check
infrastructure that gets confused and tries to use wget instead of git.

Debugging a bit further, it is because $(PKG) isn't known in the
foo-source-check step, so it doesn't pick up LINUX_SITE_METHOD=git and defaults
to git.

Thomas, you reworked the source-check infrastructure, so I'll let you figure
out how/where to get PKG defined ;)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
