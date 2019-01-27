From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Jan 2019 15:15:00 -0700
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <87a7jln4bt.fsf@dell.be.48ers.dk>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
 <871s55ykoj.fsf@dell.be.48ers.dk> <20190126150622.23c7375e@windsurf>
 <87a7jln4bt.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4qHybY80NHQjD7uaTHN_MEWF2dq_wDiC9nWU0Sfe=6dKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 27, 2019 at 3:06 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > Hello,
>  > On Mon, 21 Jan 2019 18:39:24 +0100, Peter Korsgaard wrote:
>
>  >> > I thought it was using the version compiled by buildroot.
>  >> > Isn't that what host-xz is being used for?
>  >>
>  >> Yes, correct. Do you know if the -T 0 option generates identical output
>  >> as -T 1? Otherwise we may want to disable it for reproducible builds.
>
>  > Does it matter than the output of -T 0 and -T 1 are identical ?
>
> It would cause an extra change in output between buildroot versions
> using -T 0 and ones using -T 1 - But OK, probably that isn't really
> important given all the other changes.
>
> What I really meant was if the -T 1 option affected the output format,
> and if so, if the difference involved any tradeoff (E.G. perhaps -T 1
> compresses slightly worse than -T 0) and if repeated runs with -T 1
> would generate the same output (on same machine or on another machine
> with different number of threads).
The single threaded -T 1 should produce the best compression quality,
although it's a negligible difference.
From my understanding that is because single threaded compression
doesn't need to split up the file being compressed into separate
blocks.
>
>  > What matters for BR2_REPRODUCIBLE=y is if the same input, with -T 0,
>  > always provide the exact identical output.
>
> With the new patch that only enables -T 1 for !reproducible builds,
> that is correct.
>
> --
> Bye, Peter Korsgaard
