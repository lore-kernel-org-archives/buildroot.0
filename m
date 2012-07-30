From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 30 Jul 2012 16:56:40 -0500
Subject: [Buildroot] populating an initramfs
In-Reply-To: <CAHqTa-0ovAeKYSiDqqmy54=odMEA-6h=LXhENUHjR29L5+_DYQ@mail.gmail.com>
References: <CAE9DZURcJ-4nb5-xA+yVyLf8msVr=ca6DAX2ZTY_OD0w+1n6vQ@mail.gmail.com>
 <CAHqTa-0Ek0+Tc8E6TgcS9acDe6NDhABoHadxEdRArKf3WurzWA@mail.gmail.com>
 <CAE9DZUShfQcSCGpvimXDr86rF26qo9oOsjZVMW=q2Mv5UO9WOQ@mail.gmail.com>
 <CAHqTa-0ovAeKYSiDqqmy54=odMEA-6h=LXhENUHjR29L5+_DYQ@mail.gmail.com>
Message-ID: <CAE9DZURuYndVEsc_ugjUjB2Vqv8Xaw=4bpxPY7nyz1kmHA+e-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sounds great.  Thanks again!

On Mon, Jul 30, 2012 at 4:41 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
> We just switched to devtmpfs and have been happy ever since :)  I
> highly recommend it.  Much less insane than udev.
>
> On Mon, Jul 30, 2012 at 5:37 PM, Dallas Clement
> <dallas.a.clement@gmail.com> wrote:
>> Thanks Avery.  This helps tremendously.
>>
>> One more question:  How did you create device nodes in your initramfs?
>>
>> On Mon, Jul 30, 2012 at 4:34 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
>>> On Mon, Jul 30, 2012 at 5:13 PM, Dallas Clement
>>> <dallas.a.clement@gmail.com> wrote:
>>>> Forgive me in advance for asking a newb question.  I'm in the process
>>>> of converting from Yocto/OE.
>>>>
>>>> I have the need to populate both an initramfs as well as a rootfs with
>>>> the contents of packages I build using buildroot.  What is the best
>>>> way to do this?   Should I create two separate projects, one for the
>>>> initramfs and one for the rootfs?  Or is there a way to select which
>>>> contents go in each and keep it all in the same project?
>>>
>>> What we did on our project is we made a new package that we called
>>> simpleramfs.  It hand-copies a specific list of filenames from the
>>> "real" output/target/ directory into the simpleramfs project, then
>>> generates an initramfs cpio in time for the kernel to be compiled.
>>>
>>> We experimented with building twice (once for initramfs and once for
>>> rootfs), but that's both slow and a maintenance nightmare, and
>>> resulted in much huger initramfs than we wanted (as well as a lot of
>>> duplication between initramfs and rootfs).
>>>
>>> Hope this helps.
>>>
>>> Have fun,
>>>
>>> Avery
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
