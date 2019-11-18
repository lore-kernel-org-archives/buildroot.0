From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Nov 2019 19:20:04 +0000
Subject: [Buildroot] [Bug 12326] network-manager build fails with missing
 glib error
In-Reply-To: <bug-12326-163@https.bugs.busybox.net/>
References: <bug-12326-163@https.bugs.busybox.net/>
Message-ID: <bug-12326-163-85uz6YAoXE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12326

--- Comment #1 from Christian Stewart <christian@paral.in> ---
I can confirm that this is fixed by reverting commit:

  package/network-manager: drop obsolete dependencies
  7643ab05de860011e749aa720c92d5de150bee0a

The commit incorrectly drops some dependencies that NetworkManager requires,
particularly glib. If I knew specifically which dependencies were required, I
would / will submit a patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
