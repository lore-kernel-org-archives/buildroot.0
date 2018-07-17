From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 17 Jul 2018 08:55:44 -0500
Subject: [Buildroot] How to bypass fix-rpath for a particular package?
In-Reply-To: <b0387d1c-8e63-c118-f243-63920b9560b7@smartguide.com.au>
References: <b0387d1c-8e63-c118-f243-63920b9560b7@smartguide.com.au>
Message-ID: <CAKGmAFrdjv8g3LHf-Cym3xP5TfG=eoQS2HVriLu-V-zNzHoq2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tudor,

When you say that the file is corrupted on the image, what does that mean
exactly?  Have you performed a readelf on the binary to determine what
fields may have been messed up?  What is your target architecture?

Thanks,

-Bryce

On Mon, Jul 16, 2018 at 10:53 PM, Tudor Holton <tudor@smartguide.com.au>
wrote:

> Hi all,
>
> I have a br_external package that always lands corrupt on the image and
> segfaults. I tried a number of things and eventually discovered that it
> works fine if I graft the output from build directly into the final image.
> From this I narrowed it down to something that happens during fix-rpath,
> which looks simple, but all my checks show that I'm not linking with
> anything other than -rpath=$ORIGIN so I'm at a loss as to the root cause.
>
> This may not be the best solution, but is there a standard way to tell
> fix-rpath not to patchelf my package and just copy it verbatim to the image?
>
> Cheers,
> Tudor.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 


*Bryce Ferguson*
Software Engineer
Airborne Information Solutions \ RC Linux Platform

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com <bryce.ferguson@rockwellcollins.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180717/42bc25bd/attachment.html>
