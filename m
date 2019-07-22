From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jul 2019 09:07:28 +0000
Subject: [Buildroot] [Bug 12011] cronstamps directory is not created by
 dcron package
In-Reply-To: <bug-12011-163@https.bugs.busybox.net/>
References: <bug-12011-163@https.bugs.busybox.net/>
Message-ID: <bug-12011-163-FEXGLr2eax@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12011

--- Comment #6 from Dominique Tronche <dominique.tronche@atos.net> ---
On the subject of the link issue, in our project, we need to apply a patch to
buildroot which replaces the symlinks to /tmp by real repositories in the
skeletons
This patch is still needed despite 0c96bda11 (allow rootfs overlays to override
symbolic links) since cron creates a /var/spool/cron directory. Since the
rootfs_overlay is made after the make of dcron, /var/spool cannot not be a link
in skeleton
If the /var/spool repositories were created by the S90dcron script, we would
probably not need this patch anymore
Regards
Dominique Tronche

-- 
You are receiving this mail because:
You are on the CC list for the bug.
