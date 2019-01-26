From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Jan 2019 12:31:24 -0700
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <20190126150622.23c7375e@windsurf>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
 <871s55ykoj.fsf@dell.be.48ers.dk> <20190126150622.23c7375e@windsurf>
Message-ID: <CADvTj4opWVgUqC0rcOaYFvgXBuQ9Ldj-nfHZ69f3PBku11jp9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 26, 2019 at 7:06 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 21 Jan 2019 18:39:24 +0100, Peter Korsgaard wrote:
>
> > > I thought it was using the version compiled by buildroot.
> > > Isn't that what host-xz is being used for?
> >
> > Yes, correct. Do you know if the -T 0 option generates identical output
> > as -T 1? Otherwise we may want to disable it for reproducible builds.
>
> Does it matter than the output of -T 0 and -T 1 are identical ?
>
> What matters for BR2_REPRODUCIBLE=y is if the same input, with -T 0,
> always provide the exact identical output.
My assumption is that -T 0 may be inconsistent due to the autodetection.
>
> Am I missing something here ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
