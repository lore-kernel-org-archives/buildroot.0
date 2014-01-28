From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 27 Jan 2014 21:16:55 -0500
Subject: [Buildroot] [PATCH 1/1] Makefile: move skeleton overlay
 installations before strip step
In-Reply-To: <87a9ehzf8s.fsf@dell.be.48ers.dk>
References: <1390530729-1830-1-git-send-email-danomimanchego123@gmail.com>
 <52E6063B.1060700@mind.be> <87a9ehzf8s.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt5PstHkJ6aPuHZ1uXPD7LJwp69vG5m9oGVK7UbezGetgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 27, 2014 at 9:11 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 24/01/14 03:32, Danomi Manchego wrote:
>  >> Nothing prevents the skeleton overlays from having pre-built
>
>  >  Small nit: it's not a skeleton overlay, but a rootfs overlay (I first
>  > thought you were talking about the skeleton, which is copied _before_
>  > the build).
>
>  >> executables or libraries in them.  Therefore, we should install
>  >> the overlays prior to stripping, so that any such pre-built stuff
>  >> gets stripped too.
>
>  >  I'm not sure if I agree with this change. I like the current
>  > situation where the rootfs-overlay is really copied verbatim and you
>  > can trust it. If there are binaries in there, we can assume that the
>  > user has the cross-compiler available to strip them if he wants that.
>
> I agree. As it is now the user has full control, which is IMHO nice.

Okay, I can see that it might be expected that rootfs overlay content
should be transferred as-is, I suppose.  Let's consider this patch
retracted, then.

Danomi -
