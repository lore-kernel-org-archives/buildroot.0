From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Aug 2009 09:25:31 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20090810092531.A17527770B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545





--- Comment #6 from Will Newton <will.newton@gmail.com>  2009-08-10 09:25:30 UTC ---
(In reply to comment #4)
> (In reply to comment #3)
> > gtkdocize is attempting to run, it's just not in the path, see "Warning: not
> > running gtk-docize."
> > 
> > Should we depend on host-libgtk2 to make sure gtkdocize is available?
> > 
> > For now installing gtkdocize in your host system should let you build.
> > 
> 
> Hmmm I'm not sure that's true. I have gtk-doc installed and I can't
> autreconfigure packages that depends on gtk-doc.m4.
> If I remember, that's because automake is called with -I argument pointing to
> the staging directory.
> 
> Installing gtk-doc in staging directory should solve the problem.

The autogen.sh script in webkit calls gtkdocize. If it is in the path it should
work, I don't think automake is involved at this point.

Can you call gtkdocize manually in the webit directory?

e.g.
# cd build_arch/webkit-r44552
# gtkdocize --copy


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
