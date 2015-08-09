From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 9 Aug 2015 13:58:28 +0200
Subject: [Buildroot] [RFC/PATCH 1/1] opencv2p4: new (old) compatibility
	package
In-Reply-To: <20150809120821.10efaf52@free-electrons.com>
References: <alpine.DEB.2.02.1508090734200.14799@orcam81.orcam.lan>
 <20150809111052.4d555583@free-electrons.com>
 <CAHXCMMKtuF7MLa5nHcAn_a3xzep4kS-i4w1ZWVJ7c+ctDWNs3g@mail.gmail.com>
 <20150809120821.10efaf52@free-electrons.com>
Message-ID: <CAHXCMMLNR1uzX6nVLst8fW-Yc-2jZGVJAUhLH8FPadReuT5XWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oops, re-add the list to the thread for the record.

On Sun, Aug 9, 2015 at 12:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> On Sun, 9 Aug 2015 11:57:16 +0200, Samuel Martin wrote:
>
>> > I indeed think something went wrong here: if OpenCV 3 is indeed API
>> > incompatible with OpenCV 2.4, then we should have two different
>> > packages. Samuel, do you acknowledge that OpenCV 3 is significantly
>> > different API-wise than OpenCV 2.x, so that two packages are needed ?
>>
>> I think so... I should have done it in the first place :-/
>> API-wise, the most noticeable changes are API removals as listed in [1].
>
> Ok, so at least we agree on the principle.
>
>> > However, I'd prefer if we kept the original OpenCV 2.4 as 'opencv', and
>> > had the new OpenCV 3 as 'opencv3'. But it's getting late in the release
>> > cycle, I don't know if we can still do that. Maybe we can just rename
>> > the existing 'opencv' package as 'opencv3' (as well as all its
>> > Config.in options), and re-introduce the previous 'opencv' package as
>> > it was before the bump to OpenCV 3.
>> >
>> > OpenCV has a limited number of reverse dependencies: only GStreamer and
>> > VLC. Do they support both OpenCV 2.x and OpenCV 3.x ?
>>
>> vlc: yes
>
> Ok. Quite easy to do with a || dependency then.
>
>> gstreamer: no because it uses some modules removed in opencv-3 (see [2]).
>
> Ok, easy to handle as well.
>
>> > Samuel ?
>>
>> About the re-introduction of opencv-2, I agree keeping opencv package
>> as opencv-2.4 and renaming the package for opencv-3 to opencv3.
>
> Good.
>
>> Jonathan, it seems this patch is a merge between the state of opencv
>> while still using the 2.4.x version, and a couple of patches added on
>> top of the opencv-3 package.
>> Could you give details how you get this *.mk? or list the patch used
>> to get this *.mk? it will help reviewing the patch. TIA.
>
> I think we should just bring back 'opencv' to the state it was before
> the bump to OpenCV 3. Jonathan, Samuel, can you work on that, and make
> a proposal?
>
> Beware that if you want this in 2015.08, it has to be handled quickly.
> And it would be good to have this in 2015.08, in order to avoid
> renaming all the Config.in symbols later.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
