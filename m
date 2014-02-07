From: Justin Maggard <jmaggard10@gmail.com>
Date: Thu, 6 Feb 2014 17:54:18 -0800
Subject: [Buildroot] Broken pread() on ARM
In-Reply-To: <87siry2e4r.fsf@dell.be.48ers.dk>
References: <CAKgsxVRjJoJfk1UkXA4kMnt+TxtSfHgduyPjeF8gmrZTxFOvGw@mail.gmail.com>
 <CAKgsxVSJAW73vXdkKQFLZOYp3qzZm9qwF5+p0NUtUUSnzsFZtQ@mail.gmail.com>
 <87siry2e4r.fsf@dell.be.48ers.dk>
Message-ID: <CAKgsxVTJ+eYtOPxqe0CfxY+zfB8jNvCkJE8qD-tvQ42+VUZ=0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 4, 2014 at 11:49 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Justin" == Justin Maggard <jmaggard10@gmail.com> writes:
>
> Hi,
>
>  > Okay, it looks like some of the pread/pwrite changes that have made
>  > their way into the uClibc 0.9.33 branch fail to consider some
>  > architectures.  I have made a rather odd-looking change locally that
>  > makes it work for me on my ARM platform, which uses _syscall6() for
>  > pread() and pread64() if __UCLIBC_TRUNCATE64_HAS_4_ARGS__ is defined.
>  > Would that be worth sending to the list, or would it be better to fix
>  > it some other way?
>
> The best approach would be to get it fixed in uClibc git (and preferably
> to get them to finally release 0.9.33.3).
>
> This particular issue also fixed on the uClibc master branch (E.G. what
> should become 0.9.34) - But when I had a look at it, it didn't seem
> trivial to backport.
>

Thanks for your answer.  A workable backport doesn't look all that
difficult -- just a bit ugly.  I submitted a kinda-sort backport at
http://lists.uclibc.org/pipermail/uclibc/2014-February/048220.html .
But I can't argue with just reverting those patches in the next
busybox.  I never had a problem with the old pread/pwrite emulation in
the first place.  Hopefully uClibc 0.9.33.3 doesn't get released with
this problem though.

-Justin
