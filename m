From: Tudor Holton <tudor@smartguide.com.au>
Date: Thu, 19 Jul 2018 11:03:52 +1000
Subject: [Buildroot] How to bypass fix-rpath for a particular package?
In-Reply-To: <CAKGmAFohff6XRjn1zokeqpXCCFrxBKVYQLauMQ5q3Ew=UAPa_A@mail.gmail.com>
References: <b0387d1c-8e63-c118-f243-63920b9560b7@smartguide.com.au>
 <CAKGmAFrdjv8g3LHf-Cym3xP5TfG=eoQS2HVriLu-V-zNzHoq2A@mail.gmail.com>
 <8036e3d4-aed5-f3f4-fb21-cb2a197cbb1e@smartguide.com.au>
 <CAKGmAFohff6XRjn1zokeqpXCCFrxBKVYQLauMQ5q3Ew=UAPa_A@mail.gmail.com>
Message-ID: <66d8bc0e-2bbc-c6bc-b0af-4677a08700bf@smartguide.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bryce,

My apologies.? I realised I hadn't provided that detail only as I was 
walking home last night.

I'm currently building a Intel x86_64 uclibc (with getc/putc macros 
disabled) buildroot Image on an Intel x86_64 glibc (Ubuntu) docker 
container on an Intel x86_64 glibc (Ubuntu) host.

Cheers,
Tudor.

On 19/07/18 00:20, Bryce Ferguson wrote:
> Tudor,
>
> Please provide your target architecture and the version of buildroot 
> you are using.
>
> Thanks!
>
> On Tue, Jul 17, 2018 at 7:05 PM, Tudor Holton <tudor@smartguide.com.au 
> <mailto:tudor@smartguide.com.au>> wrote:
>
>     Hi Bryce,
>
>     It appears that the symbols referencing the library names have
>     been bitshifted.? At best, objdump -x gives correct references,
>     ldd segfaults.? At worst, the objdump -x contains structured
>     gibberish.? It doesn't happen on all files, though, but at this
>     point I'm unable to discern a pattern.
>
>     I'm guessing that patchelf has a false positive, but I'm no expert
>     in this area.? I'm not used to ldd segfaulting so I have only been
>     learning this stuff since I discovered the behaviour.? It came as
>     a complete surprise to me when I noticed the md5sum difference and
>     grafted directly and it worked.
>
>     Cheers,
>     Tudor.
>
>
>     On 17/07/18 23:55, Bryce Ferguson wrote:
>>     Hello Tudor,
>>
>>     When you say that the file is corrupted on the image, what does
>>     that mean exactly?? Have you performed a readelf on the binary to
>>     determine what fields may have been messed up?? What is your
>>     target architecture?
>>
>>     Thanks,
>>
>>     -Bryce
>>
>>     On Mon, Jul 16, 2018 at 10:53 PM, Tudor Holton
>>     <tudor at smartguide.com.au <mailto:tudor@smartguide.com.au>> wrote:
>>
>>         Hi all,
>>
>>         I have a br_external package that always lands corrupt on the
>>         image and segfaults. I tried a number of things and
>>         eventually discovered that it works fine if I graft the
>>         output from build directly into the final image.? From this I
>>         narrowed it down to something that happens during fix-rpath,
>>         which looks simple, but all my checks show that I'm not
>>         linking with anything other than -rpath=$ORIGIN so I'm at a
>>         loss as to the root cause.
>>
>>         This may not be the best solution, but is there a standard
>>         way to tell fix-rpath not to patchelf my package and just
>>         copy it verbatim to the image?
>>
>>         Cheers,
>>         Tudor.
>>
>>         _______________________________________________
>>         buildroot mailing list
>>         buildroot at busybox.net <mailto:buildroot@busybox.net>
>>         http://lists.busybox.net/mailman/listinfo/buildroot
>>         <http://lists.busybox.net/mailman/listinfo/buildroot>
>>
>>
>>
>>
>>     -- 
>>     *
>>     *
>>     *
>>     *
>>     *Bryce Ferguson*
>>     Software Engineer
>>     Airborne Information Solutions \ RC Linux Platform
>>
>>     400 Collins Rd NE Cedar Rapids, Iowa 52498
>>     <https://maps.google.com/?q=400+Collins+Rd+NE+Cedar+Rapids,+Iowa+52498&entry=gmail&source=g>
>>
>>     Bryce.Ferguson at rockwellcollins.com
>>     <mailto:bryce.ferguson@rockwellcollins.com>
>>
>
>
>
>
> -- 
> *
> *
> *
> *
> *Bryce Ferguson*
> Software Engineer
> Airborne Information Solutions \ RC Linux Platform
>
> 400 Collins Rd NE Cedar Rapids, Iowa 52498
>
> Bryce.Ferguson at rockwellcollins.com 
> <mailto:bryce.ferguson@rockwellcollins.com>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180719/893a2da0/attachment.html>
