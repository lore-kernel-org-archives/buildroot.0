From: Thomas Pedersen <thomas@cozybit.com>
Date: Thu, 5 Dec 2013 00:29:24 -0800
Subject: [Buildroot] [PATCH] pandaboard: fix defonf build with recent
	kernels
In-Reply-To: <87haaniuhv.fsf@dell.be.48ers.dk>
References: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
 <87haaniuhv.fsf@dell.be.48ers.dk>
Message-ID: <CAG6hwVMtSbWiZ_c-3Y-S+diHojV4kMsF_aj+xP2VEG4vhMjivQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Dec 5, 2013 12:15 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
>
> >>>>> "Thomas" == Thomas Pedersen <thomas@cozybit.com> writes:
>
>  > The patch "pandaboard: Fix defconfig build" locked the
>  > default pandaboard kernel to 3.8.11. This is inconvenient,
>  > however, and we can make the default pandaboard kernel
>  > build and boot with a few changes:
>
>  > 1. specify the correct load address
>  > 2. append the flattened device tree to the uImage
>
>  > Note the default device tree is now for the pandaboard-ES,
>  > so users of other board revisions will need to set the
>  > correct DTS_NAME.
>
> Thanks. There afaik has been quite some breakage in the kernel related
> to pandaboard, what version have you tested with?

This was tested with 3.12.2, and AFAICT should continue to work moving
forward. The recent pandaboard breakage seems to have been shook out since
the 3.8+ transition.

> In general we try to stick to known (fixed) kernel version in the
> defconfigs, to not get the users into that kind of trouble by default.

Makes sense. I'll submit a v2 which does this in the morning.

Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/204751c8/attachment.html>
