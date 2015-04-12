From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Apr 2015 12:46:11 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150412124611.CBAE980817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #11 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-04-12 12:46:11 UTC ---
It seems you did not start from a clean directory (e.g. you only
removed target/ or some such).

Buildroot does not try to track changes in the configuration, so
sometimes it is needed to clean the build directory and restart
from scratch.

Please have a look at the manual:
    http://buildroot.net/downloads/manual/manual.html#full-rebuild

and see if you where in a case explained there.

See also:
    http://buildroot.net/downloads/manual/manual.html#faq-no-binary-packages

which has a good explanation about (not) removing packages and
(not) tracking configuration changes.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
