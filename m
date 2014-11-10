From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 10 Nov 2014 08:05:20 +0100
Subject: [Buildroot] Howto use capes for the Beaglebone Black?
In-Reply-To: <CADJRpt9mPFDu2gm2qMbY+ko__Ss9Y2TLpqfN3tb44++Q3iV+DA@mail.gmail.com>
References: <CADJRpt9mPFDu2gm2qMbY+ko__Ss9Y2TLpqfN3tb44++Q3iV+DA@mail.gmail.com>
Message-ID: <CAE4k238nAoPQLvUFGBKrLe_bOE7Rhrp+vp5KacuO-1paCvw+8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 November 2014 12:32, Ralph Koettlitz <ralph.koettlitz@gmail.com> wrote:

> I missed the development of device tree and my last information was that I
> should use dtb file in /lib/firmware, but the kernel from the last stable
> version 08.2014 for Beaglebone Black doesn't has a cape manager. like the
> starter images from beagleboard.org. Looking at the repositories of
> Robert C. Nelson gives me the idea newer kernels have something builtin.
>

Yes, the TI-kernels lacks cape-manager support. The reason is that adding
dynamic reconfiguration of the DTB to the kernel, has required quite a few
re-writes to get something that's going to be accepted upstream.

The work on getting the transactional device tree support is on-going.
There was a presentation on that at ELC-E this fall. (The slides are
available at
http://events.linuxfoundation.org/sites/events/files/slides/dynamic-dt-elce14.pdf
).


> I have a can cape and 7" lcd with touch screen and want to use them. What
> must I do to activate them? I'm using the last stable version with the tI
> kernel 3.12.10. Maybe I have to use a kernel from RobertCNelson?
>

If you want to use cape-manager, this is likely the route you'll have to
take (I'm assuming that  his kernels has cape-manager support).

I would likely just patch the the dts-file to add support for the capes,
and thus get the drivers to find their bindings anyway. That would means
that you'd loose the HW-reconfigurability, though, if you're always running
with a limited set of capes, that should/could be just fine.

Cheers,
Anders

-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141110/d654306f/attachment.html>
