From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 24 Jul 2009 16:53:10 +0000 (UTC)
Subject: [Buildroot] [Bug 289] New package iw
In-Reply-To: <bug-289-163@https.bugs.busybox.net/>
References: <bug-289-163@https.bugs.busybox.net/>
Message-ID: <20090724165310.B49A97781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=289





--- Comment #3 from Will Newton <will.newton@gmail.com>  2009-07-24 16:53:10 UTC ---

To get this package to work I had to set GIT_DIR in the environment, e.g.:

IW_MAKE_ENV = GIT_DIR=$(IW_DIR)
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

Or the version.sh script would recurse up the directory tree and get revision
info from my cloned buildroot tree and cause the build to fail.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
