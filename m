From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 08 Apr 2017 08:35:34 +0000
Subject: [Buildroot] [Bug 9796] source-check broken for Git downloads
In-Reply-To: <bug-9796-163@https.bugs.busybox.net/>
References: <bug-9796-163@https.bugs.busybox.net/>
Message-ID: <bug-9796-163-3aEuiwfqqG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9796

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
No, it is really a general problem with source-check (that we normally don't
notice as an empty <pkg>_SITE_METHOD is handled with wget, which is correct for
most packages). The git handler for source-check looks fine to me, but it never
gets called.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
