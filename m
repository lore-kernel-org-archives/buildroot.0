From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jul 2009 23:00:51 +0000 (UTC)
Subject: [Buildroot] [Bug 469] build of libgtk2 for host incorrectly assumes
 that X.org development files are installed
In-Reply-To: <bug-469-163@https.bugs.busybox.net/>
References: <bug-469-163@https.bugs.busybox.net/>
Message-ID: <20090717230051.7E40D7649F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=469





--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-17 23:00:50 UTC ---
(In reply to comment #0)
> This is because libxdamage-dev is not installed on my system. The rest of the
> compilation works because some other X.org development files are installed on
> my system. But that's just pure coincidence.
> 
> With this build of libgtk2 for the host, the X.org development files basically
> became a requirement for Buildroot to work properly, which is a shame.
> 
> Also, building gtk2 twice (once for the host, once for the target) takes a lot
> of time. And the build for the host is done only for a few command line tools.
> 
> Isn't it possible to improve all this ?

Well, the question is how. The gtk buildsystem afaik needs
gtk-update-icon-cache / gdk-pixbuf-csource, so we either depend on the user
having the gtk development package installed on the host (in a compatible
version), compile it ourselves (either including the X dependencies or require
those packages on the host) or hack the gtk buildsystem to not use those
programs / only compile those programs and not all of GTK.

The third option sounds nice, but I won't have time to work on it in the near
future. It also won't help if we in the future will need to build something
else for the host, which needs gtk.

Further discussion should probably better move to the mailing list though. 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
