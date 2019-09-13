From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 13 Sep 2019 14:10:47 -0500
Subject: [Buildroot] [PATCH] package/fakeroot: use TCP for msg passing
In-Reply-To: <CANQCQpbzuO13Y=wQjOYwQLBz6zDC0cryviDBF7Q0pQW7zpXM8w@mail.gmail.com>
References: <20190711193654.2039-1-matthew.weber@rockwellcollins.com>
 <20190714203329.GJ29941@scaer>
 <CANQCQpbzuO13Y=wQjOYwQLBz6zDC0cryviDBF7Q0pQW7zpXM8w@mail.gmail.com>
Message-ID: <CANQCQpbGwZgkPW2e3mbRaWT=H=mJzRhtXmd==AJhU1NdKnyo-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, Sep 13, 2019 at 12:51 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Yann,
>
>
> On Sun, Jul 14, 2019 at 3:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Matt, All,
> >
> > On 2019-07-11 14:36 -0500, Matt Weber spake thusly:
> > > fakeroot can be built to either use SYSV IPC or TCP for message passing.
> > >
> > > Cases for which the SYSV IPC version fails or causes problems but for
> > > which fakeroot-tcp has been observed to work well include the items
> > > listed below.
> > >
> > >   * Multithreaded applications (using pthread)
> >
> > I know you used the commit log from upstream, but that was written 12
> > year ago now. 12 years ago NPTL was still new-ish, and LinuxThreads were
> > still alive. Is it still true that fakeroot misbehaves when using
> > pthreads at all nowadays?
>
> Unsure.  Maybe better to just refer to the project readme instead of
> stating it in the commit?

I forgot to note, I was able to find a upstream for this one.  I
emailed Clint Adams at debian and he pointed me at doing a pull
request here: https://salsa.debian.org/clint/fakeroot/tree/upstream
I'll get something started this weekend so the configure time check of
sysv ipc is upstream.

Matt
