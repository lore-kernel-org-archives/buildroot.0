From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 15:56:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140608155621.B5CD99CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #4 from Mike Z <minimod@morethan.org> 2014-06-08 15:56:21 UTC ---
These results do not make any sense to me:

Single escaped: ${ORIGIN}/../lib
 0x0000000f (RPATH)                      Library rpath: [/../lib]
 0x0000001d (RUNPATH)                    Library runpath: [/../lib]

Double escaped: $${ORIGIN}/../lib
 0x0000000f (RPATH)                      Library rpath: [/../lib]
 0x0000001d (RUNPATH)                    Library runpath: [/../lib]

Triple escaped: $$${ORIGIN}/../lib
 0x0000000f (RPATH)                      Library rpath: [../lib]
 0x0000001d (RUNPATH)                    Library runpath: [../lib]

At this rate, adding enough '$' characters might delete all of BR.
;)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
