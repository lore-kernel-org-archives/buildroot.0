From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jul 2015 15:18:14 +0000 (UTC)
Subject: [Buildroot] [Bug 8201] Important security upgrades for node.js
In-Reply-To: <bug-8201-163@https.bugs.busybox.net/>
References: <bug-8201-163@https.bugs.busybox.net/>
Message-ID: <20150705151814.5BC2B7F8DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8201

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-05 15:18:13 UTC ---
Yann: we did a mistake when merging the alternate version stuff for NodeJS. The
naming of the option should not be 0_12_5, but just 0_12. Otherwise, everytime
we upgrade the minor version of NodeJS, we would need to change the Config.in
option name, which isn't good. I did not notice that when applying the patches.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
