From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 07:48:18 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915074818.840CF81E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #3 from Dr I J Ormshaw <ian_ormshaw@waters.com> 2015-09-15 07:48:18 UTC ---
(In reply to comment #2)
> (In reply to comment #1)
> > Hmm, looking at the kexec source code I see:
> > 
> > static int my_shutdown(void)
> > {
> >         char *args[] = {
> >                 "shutdown",
> >                 "-r",
> >                 "now",
> >                 NULL
> >         };
> > 
> >         execv("/sbin/shutdown", args);
> >         execv("/etc/shutdown", args);
> >         execv("/bin/shutdown", args);
> > 
> >         perror("shutdown");
> >         return -1;
> > }
> > 
> > So having shutdown in /sbin seems fine?
> > 
> > Can you please provide more info about your config and what goes wrong?
> 
> The problem is that there is no shutdown in /sbin, shutdown is in /usr/sbin. I
> had to create a link in /sbin to /usr/sbin/shutdown.

I also raised a similay bug report 8336, to which I had a responce citing
http://patchwork.ozlabs.org/patch/514750/ as a fix.  That patch should also fix
this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
