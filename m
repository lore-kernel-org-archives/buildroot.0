From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 21 Jan 2019 08:28:46 -0600
Subject: [Buildroot] [External] Re: [PATCH 1/1] fs/common.mk: enable
 multithreaded xz compression
In-Reply-To: <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
Message-ID: <CANQCQpbQ9vBAN78n9P1rx8L-wk=ykffX+eKW4VMDATa2LeVOLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 21, 2019 at 8:05 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Mon, Jan 21, 2019 at 7:02 AM Matthew Weber <matthew.weber@collins.com> wrote:
> >
> > James,
> >
> >
> > On Sun, Jan 20, 2019 at 8:08 PM <james.hilliard1@gmail.com> wrote:
> > >
> > > From: James Hilliard <james.hilliard1@gmail.com>
> > >
> > > xz help indicates only 1 thread is used unless we set threads:
> > > -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
> > >                     to use as many threads as there are processor cores
> > >
> >
> > It's good to see xz now has support, but I assume there is a minimum
> > version?  We ran into this outside of Builroot on a project where we
> > conditionally used the parallel "pxz" tool when available, as "xz"
> > didn't have the -T support consistently in distros yet.
> I thought it was using the version compiled by buildroot.
> Isn't that what host-xz is being used for?

Ah, true.  I had glanced at the dependency checking scripts but we
always built it based on the fs/common.mk dependency on host-xz so
that is correct.

One other comment would be that "0" wouldn't be ideal on a shared
machine.  Suggest limiting to $(PARALLEL_JOBS) which is used in other
filesystem creation (grep fs folder for an example in iso9660 or
squashfs).

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
