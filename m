From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 10:03:33 +0000 (UTC)
Subject: [Buildroot] [Bug 6632] CMake use host pkg-config
In-Reply-To: <bug-6632-163@https.bugs.busybox.net/>
References: <bug-6632-163@https.bugs.busybox.net/>
Message-ID: <20131030100333.9055E9BC3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6632

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 10:03:33 UTC ---
1/ Make sure your package depends on 'host-pkgconf', by doing something like
<pkg>_DEPENDENCIES = host-pkgconf

2/ Make sure your package uses the cmake-package infrastructure, as described
at
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages.
This will ensure that the directory where our cross pkg-config is installed is
in the PATH, and before /usr/bin where the native pkg-config is.

Let us know if that fixes the problem for you.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
