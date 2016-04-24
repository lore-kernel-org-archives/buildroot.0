From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 18:52:29 +0200
Subject: [Buildroot] [PATCH v5 4/5] barebox: support 2nd config build
In-Reply-To: <20160424175803.72e59938@free-electrons.com>
References: <cover.1461489060.git.pieter@boesman.nl>
 <f8d6dec31737cde2abaf82ee4f64ea215e48e452.1461489060.git.pieter@boesman.nl>
 <20160424175803.72e59938@free-electrons.com>
Message-ID: <20160424165229.GA11148@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Apr 24, 2016 at 05:58:03PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Apr 2016 11:18:46 +0200, Pieter Smith wrote:
> 
> >  boot/barebox/Config.in                |  2 +
> >  boot/barebox/barebox-2/Config.in      | 72 +++++++++++++++++++++++++++++++++++
> >  boot/barebox/barebox-2/barebox-2.hash |  1 +
> >  boot/barebox/barebox-2/barebox-2.mk   |  9 +++++
> >  boot/barebox/barebox.mk               |  3 ++
> 
> Regarding this one, I am not sure, there are two things that bother me
> a bit:
> 
>  - The name "barebox-2", which I find a bit weird. What about
>    "barebox-aux" or something like that, as opposed to "barebox-main" ?
> 
>  - The organization of the folders. Having the barebox "infra" + the
>    main barebox package both defined in boot/barebox/barebox.mk seems
>    weird. Ideally, I would have preferred something like:
> 
>    boot/barebox/barebox.mk <-- common infrastructure
>    boot/barebox/barebox-main/ <-- the main Barebox
>    boot/barebox/barebox-aux/  <-- the auxiliary Barebox

I had it set up this way, but changed it due to some of the review feedback
that Arnout provided.

>    Of course, some tricks will be needed to make the barebox-main/
>    package behave properly when its options will still be named
>    BR2_TARGET_BAREBOX_<foo> and not BR2_TARGET_BAREBOX_MAIN_<foo>.
>    Alternatively, if that really doesn't work, what about:
> 
>    boot/barebox/barebox.mk <-- common infrastructure
>    boot/barebox/barebox/ <-- the main Barebox
>    boot/barebox/barebox-aux/  <-- the auxiliary Barebox

This approach seems reasonable. I will set it up this way. I will also rename
all BAREBOX_2 KConfig options to BAREBOX_AUX. Is this acceptable?

> I've applied the first three patches of the series to ease your work,
> but I'd like to see if we can get something a bit better for this
> patch. I know Arnout has done a lot of review, so don't hesitate to let
> me know if all this has already been discussed and why the current
> organization has been chosen compared to something more similar to my
> proposal.

I don't think the organization was changed based on concrete arguments. Arnout
just liked it more this way. I do however like your 2nd proposed organization
more.

[snip]

- Pieter
