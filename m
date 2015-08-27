From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Aug 2015 18:09:02 +0000 (UTC)
Subject: [Buildroot] [Bug 8316] lttng-tools and lttng-babeltrace executables
 contain bad RPATH pointing to host machine
In-Reply-To: <bug-8316-163@https.bugs.busybox.net/>
References: <bug-8316-163@https.bugs.busybox.net/>
Message-ID: <20150827180902.2989C81EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8316

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-27 18:09:01 UTC ---
Thanks for your bug report.

We indeed know that some binaries/executables on the target have invalid rpath
pointing to locations on the build machine. However, I believe it is not really
Buildroot's fault here, but the build system of some packages that does an
incorrect thing.

So far, this hasn't been a big issue since pretty much nobody has a path on the
target that matches those invalid rpath. Of course, having such rpaths is ugly,
but it wasn't causing any practical problem.

We have a patch series pending that takes care of cleaning up the target rpath
(and also adjusting the rpath of the host binaries). See
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/120158 and the
following patches.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
