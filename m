From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Jan 2019 14:34:51 -0700
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <871s55ykoj.fsf@dell.be.48ers.dk>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
 <871s55ykoj.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4qWCObi2v1nZtGsa_L1-ireD+62hVk7MpRDASpKzTrdZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 21, 2019 at 10:39 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > On Mon, Jan 21, 2019 at 7:02 AM Matthew Weber <matthew.weber@collins.com> wrote:
>  >>
>  >> James,
>  >>
>  >>
>  >> On Sun, Jan 20, 2019 at 8:08 PM <james.hilliard1@gmail.com> wrote:
>  >> >
>  >> > From: James Hilliard <james.hilliard1@gmail.com>
>  >> >
>  >> > xz help indicates only 1 thread is used unless we set threads:
>  >> > -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
>  >> >                     to use as many threads as there are processor cores
>  >> >
>  >>
>  >> It's good to see xz now has support, but I assume there is a minimum
>  >> version?  We ran into this outside of Builroot on a project where we
>  >> conditionally used the parallel "pxz" tool when available, as "xz"
>  >> didn't have the -T support consistently in distros yet.
>
> > I thought it was using the version compiled by buildroot.
> > Isn't that what host-xz is being used for?
>
> Yes, correct. Do you know if the -T 0 option generates identical output
> as -T 1? Otherwise we may want to disable it for reproducible builds.
I think it doesn't generate identical output, I wonder if it would be
a good idea to make all these compression flags configurable.
One issue I'm running across is that my test builds take at least 5
minutes or so to compress, having a way to set different xz flags
between test and production builds would be handy.
>
> --
> Bye, Peter Korsgaard
