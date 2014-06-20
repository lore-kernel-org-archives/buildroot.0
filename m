From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 20 Jun 2014 16:03:34 -0500
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <20140614212341.5306ead8@free-electrons.com>
References: <20140614212341.5306ead8@free-electrons.com>
Message-ID: <CANQCQpaOQD73SWyE5QSv1CVb8DG1MggsAxdzkb5yy7J9DhANTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, wanted to thank you for making this available.  Here's some
initial feedback.

On Sat, Jun 14, 2014 at 2:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
<snip>
>
> Getting started
> ===============
>
>
> To get started, you can simply run it with:
>
>   ./autobuild-run --ninstances 2 --njobs 3
>
I seem to get the following output.  It looks like the build is right
before the spot where it is doing the initial "make
O=./instance-#/output -C ./buildroot".  If I manually go into the
instance#/output folder and do a "make", things seem to look like
they're working as expected (building packages/downloading archives,
etc).  So my theory is something in my shell environment or the fact
I'm using python2.6 with that subprocess.....  One thing I noticed
when I got this error was that the resulting logfile in the output
folder is empty.  I added a test write to this file before line 327
and I saw what I wrote.  So it looks like the subprocess isn't getting
called successfully.  Since I'm going to run the script on a newer
server that has python2.7, this email is probably just a FYI and I'll
retest once I'm setup to test on that server.

Process Process-1:
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/process.py", line 232, in _bootstrap
    self.run()
  File "/usr/lib/python2.6/multiprocessing/process.py", line 88, in run
    self._target(*self._args, **self._kwargs)
  File "./autobuild-run", line 437, in run_instance
    ret = do_build(instance, instance_log)
  File "./autobuild-run", line 327, in do_build
    stdout=f, stderr=f)
  File "/usr/lib/python2.6/subprocess.py", line 480, in call
    return Popen(*popenargs, **kwargs).wait()
  File "/usr/lib/python2.6/subprocess.py", line 633, in __init__
    errread, errwrite)
  File "/usr/lib/python2.6/subprocess.py", line 1139, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory

>
>
<snip>

Thanks!
-- 
Matthew L Weber / Sr Software Engineer / Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Phone: 319-295-7349
matthew.weber at rockwellcollins.com
www.rockwellcollins.com
