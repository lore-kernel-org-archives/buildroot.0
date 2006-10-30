From: Will Newton <will.newton@gmail.com>
Date: Mon, 30 Oct 2006 10:06:33 +0000
Subject: [Buildroot] Order of mounts in inittab
In-Reply-To: <200610181231.43387.rob@landley.net>
References: <87a5b0800610120238l480df3c4lfefd6133afe981c@mail.gmail.com>
	<200610181231.43387.rob@landley.net>
Message-ID: <87a5b0800610300206y137eac20re7a0092ec70bdb89@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/18/06, Rob Landley <rob@landley.net> wrote:
> On Thursday 12 October 2006 5:38 am, Will Newton wrote:
> > Hi all,
> >
> > I noticed that since upgrading to busybox 1.2.1 that I had to reorder
> > the mount lines in inittab so proc was mounted before remounting / as
> > rw took place or I would get "could not open /proc/mounts" and the
> > remount would fail. Does anyone know why this might be?
>
> Because the order in which inittab lines are executed is not specified by any
> spec anywhere, and it's easier to create a linked list by inserting rather
> than tracing to the end of the thing?  (There are such things as sysinit
> scripts.  And fstab.  These things exist for a reason.)

Sorry about the long delay, I've been away.

The above explanation makes sense, but the fact remains that the
inittab in buildroot does not work with the current version of the
tools.
