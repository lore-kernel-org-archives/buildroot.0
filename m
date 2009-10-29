From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Oct 2009 22:07:42 +0000 (UTC)
Subject: [Buildroot] [Bug 633] mdadm failes to build in 2009.08
In-Reply-To: <bug-633-163@https.bugs.busybox.net/>
References: <bug-633-163@https.bugs.busybox.net/>
Message-ID: <20091029220742.4E4B377719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=633


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-10-29 22:07:41 UTC ---
(In reply to comment #0)
> make[1]: *** No rule to make target `md.4', needed by `md.man'.  Stop.
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory
> `/provisioning/buildroot/buildroot-2009.08/build_i686/mdadm-2.6.7.1'
> make: ***
> [/provisioning/buildroot/buildroot-2009.08/build_i686/mdadm-2.6.7.1/mdadm]
> Error 2

Do you have nroff installed on your host? Here it builds with:

nroff -man mdadm.8 > mdadm.man
nroff -man md.4 > md.man
nroff -man mdadm.conf.5 > mdadm.conf.man

On Debian it's in the groff-base package.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
