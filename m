From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 13:22:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7154] Local uClibc config file gets overwritten
 using make uclibc-update-config
In-Reply-To: <bug-7154-163@https.bugs.busybox.net/>
References: <bug-7154-163@https.bugs.busybox.net/>
Message-ID: <20140610132208.3A0489CFB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7154

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-06-10 13:22:07 UTC ---
Bug confirmed.
Procedure is:

make uclibc-menuconfig   (make a change)
(change is reflected in output/build/uclibc-.../.config)
make uclibc-update-config
(cp custom.config output/build/uclibc-.../.config, overwriting last change)
(do configuration actions)
(cp output/build/uclibc-.../.config custom.config)

Problem may be present for busybox and linux too...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
