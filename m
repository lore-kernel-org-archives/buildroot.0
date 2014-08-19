From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Aug 2014 16:38:35 +0000 (UTC)
Subject: [Buildroot] [Bug 7328] Git dl of versions in x/y broken
In-Reply-To: <bug-7328-163@https.bugs.busybox.net/>
References: <bug-7328-163@https.bugs.busybox.net/>
Message-ID: <20140819163835.32C8B9D4A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7328

--- Comment #3 from Vincent Stehl? <vincent.stehle@freescale.com> 2014-08-19 16:38:34 UTC ---
(In reply to comment #2)
> Please give an example and/or a reproduction scenario.

Ok, here is a quick test case to demonstrate the issue:

In package/dtc/dtc.mk, change:

  DTC_VERSION = refs/tags/v1.4.0

Then do:

  make defconfig
  make dtc-source

This works on 249464674485ed1fa18a2d0dd5500c84198490b9, but not after
54456cc6982598fa45e7c97609e83fabec7c1695.

V.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
