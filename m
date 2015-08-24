From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2015 20:18:19 +0000 (UTC)
Subject: [Buildroot] [Bug 8301] ldconfig parameter in Makefile
In-Reply-To: <bug-8301-163@https.bugs.busybox.net/>
References: <bug-8301-163@https.bugs.busybox.net/>
Message-ID: <20150824201819.E2514819EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8301

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-24 20:18:19 UTC ---
No, using /etc/ld.so.conf to generate the ld.so cache for the target is
completely wrong. The proper fix is to completely get rid of the ldconfig stuff
in Buildroot, since it cannot work properly in a cross-compiled environment.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
