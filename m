From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Apr 2020 19:14:12 +0000
Subject: [Buildroot] [Bug 12726] systemctl preset-all failed for
 ctrl-alt-del.target
In-Reply-To: <bug-12726-163@https.bugs.busybox.net/>
References: <bug-12726-163@https.bugs.busybox.net/>
Message-ID: <bug-12726-163-QbnMwAdHxw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12726

Melanie <melanie@trash-mail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Melanie <melanie@trash-mail.com> ---
Okay, during further troubleshooting I realized that the problem was caused by
my custom configuration, which modifies the target directory (deletes all
preset-configuration-files) after the 'finalizing target directory' phase where
the 'systemctl preset-all' command runs (this explains why a full rebuild had
succeeded but subsequent partial rebuild attempts have failed).

The fact that the 'systemctl preset-all' command fails when there are no
preset-configuration-files at all on the target file system, is a systemd
issue, so I'm closing this bug report here as invalid.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
