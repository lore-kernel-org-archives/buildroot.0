From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Jan 2019 01:25:51 -0700
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <20190128092316.66c4eaa0@windsurf>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
 <871s55ykoj.fsf@dell.be.48ers.dk> <20190126150622.23c7375e@windsurf>
 <87a7jln4bt.fsf@dell.be.48ers.dk> <20190128092316.66c4eaa0@windsurf>
Message-ID: <CADvTj4pKqx3jhpk2=fYUeqW8mc42xqLfn0=gZ+8qtRyYjY-WwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 28, 2019 at 1:23 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 27 Jan 2019 23:06:14 +0100
> Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >  > Does it matter than the output of -T 0 and -T 1 are identical ?
> >
> > It would cause an extra change in output between buildroot versions
> > using -T 0 and ones using -T 1 - But OK, probably that isn't really
> > important given all the other changes.
>
> Well, BR2_REPRODUCIBLE is definitely not about guaranteeing identical
> output between Buildroot versions. How could this even work, since we
> are bumping the version of dozens/hundreds of packages ?
>
> BR2_REPRODUCIBLE is about given a fixed Buildroot version and
> configuration, be able to generate a binary-identical result.
>
> >  > What matters for BR2_REPRODUCIBLE=y is if the same input, with -T 0,
> >  > always provide the exact identical output.
> >
> > With the new patch that only enables -T 1 for !reproducible builds,
> > that is correct.
>
> I thought -T 0 was the problematic thing as it enabled automatic
> parallelization, while -T 1 explicitly disabled parallelization.
Right, -T 1 is the default.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
