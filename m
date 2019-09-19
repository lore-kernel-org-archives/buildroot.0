From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Sep 2019 19:42:57 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-z8rsMClDX2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I'm afraid this does not look like a Buildroot issue, but a system
configuration issue on your machine: /tmp is not writable by the user with
which you're doing the Buildroot build. Could you try to just run "touch
/tmp/foobar" ? I guess you'll get the same Permission denied issue. If it's the
case, then you have to fix your system /tmp permissions.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
