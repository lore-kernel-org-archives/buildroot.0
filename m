From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Sep 2009 10:05:48 +0000 (UTC)
Subject: [Buildroot] [Bug 635] util-linux fails to build in 2009.08
In-Reply-To: <bug-635-163@https.bugs.busybox.net/>
References: <bug-635-163@https.bugs.busybox.net/>
Message-ID: <20090930100548.C622B77715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=635





--- Comment #1 from igor <igor47@moomers.org>  2009-09-30 10:05:48 UTC ---
according to a conversation @
http://ibot.rikers.org/%23uclibc/20031113.html.gz, adding

#include <fcntl.h>

to swapon.c seems to fix half the problem - the part about R_OK undeclared.
This still leaves the other half:

swapon.c:86: error: expected declaration specifiers or '...' before 'swapon'
swapon.c:86: error: expected declaration specifiers or '...' before 'path'
swapon.c:86: error: expected declaration specifiers or '...' before 'flags'
swapon.c:88: error: expected declaration specifiers or '...' before 'swapoff'
swapon.c:88: error: expected declaration specifiers or '...' before 'path'


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
