From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Feb 2014 10:56:59 +0100
Subject: [Buildroot] Broken pread() on ARM
In-Reply-To: <CAKgsxVTJ+eYtOPxqe0CfxY+zfB8jNvCkJE8qD-tvQ42+VUZ=0Q@mail.gmail.com>
 (Justin Maggard's message of "Thu, 6 Feb 2014 17:54:18 -0800")
References: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
 <CAKgsxVSJAW73vXdkKQFLZOYp3qzZm9qwF5+p0NUtUUSnzsFZtQ@mail.gmail.com>
 <87siry2e4r.fsf@dell.be.48ers.dk>
 <CAKgsxVTJ+eYtOPxqe0CfxY+zfB8jNvCkJE8qD-tvQ42+VUZ=0Q@mail.gmail.com>
Message-ID: <87txcb6yac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Justin" == Justin Maggard <jmaggard10@gmail.com> writes:

Hi,

 > Thanks for your answer.  A workable backport doesn't look all that
 > difficult -- just a bit ugly.  I submitted a kinda-sort backport at
 > http://lists.uclibc.org/pipermail/uclibc/2014-February/048220.html .

Yes, I saw. With all the uClibc mess (especially as we also support
external uClibc based toolchains) I really prefer to not add any more
patches if possible.

 > But I can't argue with just reverting those patches in the next
 > busybox.  I never had a problem with the old pread/pwrite emulation in
 > the first place.

No, it only triggers in rare cases. Afaik the issue is about locking
between the lseek and read/write, so it should only be an issue if you
have an application doing pread/pwrite from multiple threads with the
same file descriptor.

git gc was apparently such a case.


 > Hopefully uClibc 0.9.33.3 doesn't get released with this problem
 > though.

Lets hope not.

-- 
Bye, Peter Korsgaard
