From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Feb 2015 22:29:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7886] gettext: link failure with locally-installed
	libxml2
In-Reply-To: <bug-7886-163@https.bugs.busybox.net/>
References: <bug-7886-163@https.bugs.busybox.net/>
Message-ID: <20150220222933.5B92D817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7886

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|P5                          |P3
             Status|NEW                         |ASSIGNED
                 CC|                            |yann.morin.1998 at free.fr
         AssignedTo|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
   Target Milestone|---                         |2015.02
           Severity|minor                       |normal

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-02-20 22:29:32 UTC ---
Ignacy, All,

> Gettext really depends on libxml2

Indeed.

> which itself links with liblzma

Not in Buildroot, since we explicitly disable lzma support in libxml2, which is
causing a problem similar to the one you report.

> The solution is to add host-libxml2 to HOST_GETTEXT_DEPENDENCIES.

Indeed, it looks like the only option available to us (there is no option to
disable xml requirement in gettext).

Care to send a patch, as documented there:
    http://buildroot.net/downloads/manual/manual.html#submitting-patches

Thanks! :-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
