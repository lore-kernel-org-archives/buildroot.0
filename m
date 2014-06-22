From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 22 Jun 2014 13:37:55 -0500
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <20140621192052.3bd3a17f@free-electrons.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CANQCQpaOQD73SWyE5QSv1CVb8DG1MggsAxdzkb5yy7J9DhANTQ@mail.gmail.com>
 <20140621192052.3bd3a17f@free-electrons.com>
Message-ID: <CANQCQpYCecgNyDbegLvmH24ZjUpYmGUY6tP0=UU512-pRUaE+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Jun 21, 2014 12:21 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Matthew Weber,
>
> Thanks for your report!
>
> On Fri, 20 Jun 2014 16:03:34 -0500, Matthew Weber wrote:
>
> > I seem to get the following output.  It looks like the build is right
> > before the spot where it is doing the initial "make
> > O=./instance-#/output -C ./buildroot".  If I manually go into the
> > instance#/output folder and do a "make", things seem to look like
> > they're working as expected (building packages/downloading archives,
> > etc).  So my theory is something in my shell environment or the fact
> > I'm using python2.6 with that subprocess.....  One thing I noticemo
> > when I got this error was that the resulting logfile in the output
> > folder is empty.  I added a test write to this file before line 327
> > and I saw what I wrote.  So it looks like the subprocess isn't getting
> > called successfully.  Since I'm going to run the script on a newer
> > server that has python2.7, this email is probably just a FYI and I'll
> > retest once I'm setup to test on that server.
>
> The builds on the Free Electrons build server are running inside an old
> Debian chroot which also uses Python 2.6 (2.6.6 to be exact), and it's
> working fine.
Good to know, I'll take another look at my environment.  I'm running sick
ubuntu10.04.

>
> > Process Process-1:
> > Traceback (most recent call last):
> >   File "/usr/lib/python2.6/multiprocessing/process.py", line 232, in
_bootstrap
> >     self.run()
> >   File "/usr/lib/python2.6/multiprocessing/process.py", line 88, in run
> >     self._target(*self._args, **self._kwargs)
> >   File "./autobuild-run", line 437, in run_instance
> >     ret = do_build(instance, instance_log)
> >   File "./autobuild-run", line 327, in do_build
> >     stdout=f, stderr=f)
>
> Are you sure you're using the latest version of the script? The code at
> lines 327 and 437 do not match what your exception stack is showing.
> But I'm a bit surprised, because I don't think I've made any changes to
> the script since I made the public announcement on the Buildroot
> mailing list.
Sorry about that, had to adjust the url file retrieval lines because my
proxy was blocking the autobuilder site.  I left two commented out lines.
I put in a request so that I can use the script as is without any proxy
work around.  I'll respond once I re-test .

Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140622/87dbac89/attachment.html>
