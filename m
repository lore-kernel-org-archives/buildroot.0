From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jun 2020 20:15:35 +0000
Subject: [Buildroot] [Bug 12971] qt5webengine: graph-depends seems producing
 incorrect output
In-Reply-To: <bug-12971-163@https.bugs.busybox.net/>
References: <bug-12971-163@https.bugs.busybox.net/>
Message-ID: <bug-12971-163-RQj7y1DLSk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12971

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Indeed as Peter said, graph-depends draws the graph of build-time dependencies,
as listed by the package <pkg>_DEPENDENCIES variable.

However, I find it odd that qt5declarative is only a runtime dependency for
qt5webengine, if it is needed, it should also be needed at build time, but
qt5webengine builds fine without this. Would it be possible to check if this
runtime dependency is really needed ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
