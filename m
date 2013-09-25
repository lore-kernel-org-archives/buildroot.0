From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 25 Sep 2013 22:31:13 +0200
Subject: [Buildroot] [PATCH 3/5] manual: update beyond Buildroot section
In-Reply-To: <52165277.30109@mind.be>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
 <1375824984-8226-4-git-send-email-s.martin49@gmail.com>
 <20130807113910.2358816a@skate>
 <CAKvQZ_3UxzreEtWQ3E++3xZ1o4W_Rn1gzKrYQo2CNOnQ_hZpfg@mail.gmail.com>
 <CAHXCMMJ2iXQQyju9jdx_4sXCvpUa25O3fSWA9p8_yRPv92C7NQ@mail.gmail.com>
 <20130808200100.6f677bf5@skate> <5209CB2C.4030408@mind.be>
 <CAHXCMMLz6y46OSor3NPthHqpBwbuGJ1asGd3aVw1StEXYiN1Fw@mail.gmail.com>
 <52165277.30109@mind.be>
Message-ID: <CAAXf6LWqUTt-CMSHyoP60nP08swNDwNEMYf550+ZKoHuYK-iMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, all,

More than a month after your mail, but:

On Thu, Aug 22, 2013 at 8:03 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 15/08/13 21:01, Samuel Martin wrote:
>>
>> All,
>>
>> 2013/8/13 Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>>
>>
>>  >
>>  > On 08/08/13 20:01, Thomas Petazzoni wrote:
>>  >>
>>  >> Dear Samuel Martin,
>>  >>
>>  >> On Thu, 8 Aug 2013 14:36:39 +0200, Samuel Martin wrote:
>>  >>>
>>  >>> So, its right place may not be the manual, but some extended readme
>>  >>> and/or sample
>>  >>> post-image scripts.
>>  >>> What about this?
>>  >>
>>  >>
>>  >> I do believe it has its place into the manual, but it needs to be
>>  >> written up properly, taking into account the other use cases (booting
>>  >> on ARM/PowerPC platforms), and find a better place for this.
>>  >
>>  >
>>  >  However, I think the "needs to be written up properly" aspect should
>> not stop a piece of documentation to be added to the manual. Even if it
>> is not written up properly, it will be useful for some people.
>>
>> Right.
>>
>> To move forward on this, I'd like to have people's opinion about a couple
>> of questions:
>> 1- what is the best place in the manual for such a section?
>>    - between the current chapters 3 - "Working with Buildroot" - and 4 -
>> the FAQ/troubleshooting;
>>    - or in the "Beyond Buildroot" chapter
>>    - or in appendices
>>    - somewhere else
>
>
>  I think 'Beyond buildroot' is the proper place. Only, that chapter should
> be called "Deploying the buildroot images". The introductory text you added
> looks really good. It is just missing the following at the end:
>
> For some of the off-the-shelf boards that buildroot supports, you can find a
> specific explanation in a readme file in the _board_ directory.
>
>
>> 2- should we put the "network boot" in another section, rather than just
>> aside the disk image creation? (so, split the main addition of the patch
>> in 2 clearly distinguished section/chapter?)
>
>
>  No, looks like the right place to me. It is a way of deploying the
> kernel/rootfs to the target.
>
>
>> 3- should we add a chapter focus on booting the image?
>
>
>  I think that is part of using/deploying the images, so it is the same
> chapter. Also there is usually a tight relation between how the image is
> installed and how it is booted.
>
>
>> 4- where should the VM disk image creation section belong to?
>
>
>  Same chapter.
>
>
>> 5- how do you think the manual should be organized about these topics
>> (which are: "booting images", "generating disk image for device or vm")?
>> what should be the perimeter these sections?
>>
>>
>>
>> Eventually, I think the manual needs something right after the chapters 3
>> - "Working with Buildroot" - dealing with booting the image (title
>> suggestion is more than welcome).
>> This chapter could include:
>> - generic things about deployment on the actual hardware (rougthly:
>> "refer to the readme in the board directory of the vendor instructions");
>
>
>  Exactly :-)
>
>
>> - booting the qemu images;
>> - boot over nfs (as a way to speed up the development process);
>> - and redirect to the "Beyond Buildroot" chapter for less common ways
>> (chroot, etc).
>
>
>  I don't see why that shouldn't be in the same chapter.
>
>
>>
>> The "Beyond Buildroot" chapter could talk about:
>> - chroot/binfmt/etc;
>> - generating disk image for specific device (e.g. a disk image for a RPi,
>> containing several partitions, and so on. IIRC, Yann quickly talked about
>> it months ago, maybe he could fill some gaps in the doc or provide sample
>> scripts...);
>
>
>  I think if it is really for a specific device, then it belongs in the
> board/ directory.
>
>
>> - generating disk image for a VM (like Willy already wrote it down).
>
>
>  Except for binfmt, I think all of this fits in the deployment chapter.
>
>
>>
>> In this view, I don't know yet to what section/chapter PXE boot belongs
>> to because it's something rather x86-oriented to me...
>
>
>  PXE itself is, but after that it's exactly the same as a tftp/nfs boot. PXE
> just adds the step of getting the actual bootloader to the device. So maybe
> it could be rewritten to focus more on the tftp aspect, and just mention the
> three references for more PXE information.
>


I pretty much agree with Arnout's input on the above questions.
Regarding the title, Arnout's suggestion was
Deploying the buildroot images
which is much better than 'Beyond buildroot', but here are some
variations to consider:

Deploying the target images
Deploying target images built with buildroot
Deploying the output images
Deploying the resulting images on target


I also would like to take this opportunity to thank you for all your
efforts in extending and improving the buildroot manual, and promoting
the work on the manual by other developers. It clearly has resulted in
a much improved manual since before, and I hope we as a community can
continue supporting this activity.

Best regards,
Thomas
