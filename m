From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Sep 2009 10:14:51 +0000 (UTC)
Subject: [Buildroot] [Bug 605] [PATCH] Enhancement of libglib2 package
In-Reply-To: <bug-605-163@https.bugs.busybox.net/>
References: <bug-605-163@https.bugs.busybox.net/>
Message-ID: <20090911101452.1062D77726@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=605





--- Comment #1 from Sven Neumann <s.neumann@raumfeld.com>  2009-09-11 10:14:50 UTC ---
Could the newly introduced variables become BR2_PACKAGE_LIBGLIB2_COMPLETE
instead of BR2_PACKAGE_LIBGLIB2COMPLETE ?

Also it does not make sense to install gobject without glib. Leaving out
gthread is impossible as glib itself needs it and gio depends on gobject.
gmodule is simply not worth the hassle as it is tiny.

I suggest that you simplify this patch by just making the installation of
gobject and gio optional. GIO needs to depend on GObject then.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
