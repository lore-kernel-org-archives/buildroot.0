From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 28 Feb 2015 16:27:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150228162718.BE4AA80506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

nroach44 at gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Build|                            |[Install]
                   |                            |WantedBy=systemd-journald.s
                   |                            |ervice

--- Comment #7 from nroach44 at gmail.com 2015-02-28 16:27:18 UTC ---
Further discussion with dywi on the IRC has led me to try Storage=volatile in
/etc/systemd/journald.conf and this solves the issue additionally. It seems to
be more "honest" as all /var/log/journal was getting written to was memory
anyway.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
