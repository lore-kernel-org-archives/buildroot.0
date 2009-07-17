From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jul 2009 23:55:16 +0000 (UTC)
Subject: [Buildroot] [Bug 469] build of libgtk2 for host incorrectly assumes
 that X.org development files are installed
In-Reply-To: <bug-469-163@https.bugs.busybox.net/>
References: <bug-469-163@https.bugs.busybox.net/>
Message-ID: <20090717235516.46410772EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=469





--- Comment #2 from Sven Neumann <s.neumann@raumfeld.com>  2009-07-17 23:55:15 UTC ---
Neither gtk-update-icon-cache nor gdk-pixbuf-csource have a dependency on GDK.
It should be possible to build them without building GDK, let alone GTK+. All
you need is gdk-pixbuf. I suggest that you add options to the GTK+ build system
to allow building just gdk-pixbuf and these two tools. This change does not
belong into buildroot though, it should be submitted against upstream GTK+.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
