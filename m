From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Feb 2014 08:36:50 +0000 (UTC)
Subject: [Buildroot] [Bug 6818] toolchainfile.cmake has absolut path
	references
In-Reply-To: <bug-6818-163@https.bugs.busybox.net/>
References: <bug-6818-163@https.bugs.busybox.net/>
Message-ID: <20140207083650.564B39C8AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6818

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-07 08:36:49 UTC ---
Hi u.strempel, 

Thanks for the patch. Would you mind sending it to the mailing list directly?
This will facilitate review and discussion on the patch.
(you need to be subscribed to the list first).

For example, a comment on the patch is that there is now some duplication
between e.g. TARGET_CROSS and TARGET_CROSS_WITHOUT_HOST_DIR. This could be
fixed by changing the existing assignments to assign to the _WITHOUT_HOST_DIR
version, and then have one:
TARGET_CROSS = $(HOST_DIR)/$(TARGET_CROSS_WITHOUT_HOST_DIR)

Thanks, 
Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
