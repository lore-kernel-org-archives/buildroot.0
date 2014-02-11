From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Feb 2014 21:05:59 +0000 (UTC)
Subject: [Buildroot] [Bug 5420] Dbus and /var/run management
In-Reply-To: <bug-5420-163@https.bugs.busybox.net/>
References: <bug-5420-163@https.bugs.busybox.net/>
Message-ID: <20140211210559.65D099C98F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5420

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-11 21:05:58 UTC ---
Hi Vincent, 

Do you still experience this bug with a recent buildroot version (2013.11 or
git)?
If so, can you clarify a bit more?

In buildroot, when you use the default target skeleton, /var/run is indeed a
symbolic link to /tmp.

And the S30dbus script does indeed:
# Create needed directories.
[ -d /var/run/dbus ] || mkdir -p /var/run/dbus
[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
[ -d /tmp/dbus ] || mkdir -p /tmp/dbus

However, I don't understand how both conflict with each other. The creation of
/var/run/dbus will actually result in /tmp/dbus, which should be fine.

So maybe I don't fully understand the problem you experience. Please clarify.

Note that the patch you propose is not correct in my opinion: removing the
entire /var/run directory during the building of dbus, may remove files created
by other packages, which is not the intended behavior.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
