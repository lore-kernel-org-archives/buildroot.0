From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Apr 2020 12:51:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with gcc 4.8
In-Reply-To: <20200412110553.7809e91c@windsurf.home>
References: <20200411213318.972221-1-fontaine.fabrice@gmail.com>
 <20200412110553.7809e91c@windsurf.home>
Message-ID: <CAPi7W80PFd99Jr-+8YqU38Hn8k_sLBhooOWvWsobc7zKZPRNMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 12 avr. 2020 ? 11:05, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 11 Apr 2020 23:33:18 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +SOL_NETLINK is used since commit
> > +87a198111af1ea67053895f7435fb99e3cdd2159 resulting in the following
> > +build failure with gcc 4.8:
> > +
> > +src/frame-xchg.c: In function 'frame_watch_group_io_read':
> > +src/frame-xchg.c:328:27: error: 'SOL_NETLINK' undeclared (first use in this function)
> > +   if (cmsg->cmsg_level != SOL_NETLINK)
>
> I don't understand a failure like this can be related to the compiler
> version. Could you clarify?
My bad, you're right, the issue is due to glibc that doesn't support
SOL_NETLINK before version 2.24 and
https://github.com/bminor/glibc/commit/f9b437d5efce93800b51ad2a437c8b1c9616bf80#diff-9256189095e7df9c0688498779241729

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
