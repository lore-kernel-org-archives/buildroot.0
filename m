From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 12:17:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4363] Make sure that copied linux and busybox
 defconfig are writable before modifying
In-Reply-To: <bug-4363-163@https.bugs.busybox.net/>
References: <bug-4363-163@https.bugs.busybox.net/>
Message-ID: <20111022121707.9680D8EDA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4363

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2011-10-22 12:17:07 UTC ---
Is it required to also modify the group permission? I'd expect u+rw to be
enough. 

Moreover, can we safely assume that the read permission is already set, so that
u+w is the only thing that needs to happen?

Thirdly, the same problem is probably present for many other locations, for
example the uclibc config file, the default target skeleton (that you may want
to modify from a post-build script) etc.
To cater for your version control system (Clearcase?) all this should be fixed
as well...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
