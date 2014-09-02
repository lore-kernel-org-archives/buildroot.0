From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 2 Sep 2014 22:01:52 +0200
Subject: [Buildroot] [PATCH] Add support for Flattened Image Trees
In-Reply-To: <CAGm1_ktr5MGQcFUAys1VSA7MY9OOSANFmTVcosckAyy-i9K_SA@mail.gmail.com>
References: <1409604784-8156-1-git-send-email-yegorslists@googlemail.com>
 <CAAXf6LUDfWrxabCaGjFVq6mr8w3QbBxEawb5ugRreD6brHwSDA@mail.gmail.com>
 <CAGm1_ktFrnQeNyVpmjHhhXkO8GKhOqij1SbKhexssiFtCj_utw@mail.gmail.com>
 <CAGm1_ktr5MGQcFUAys1VSA7MY9OOSANFmTVcosckAyy-i9K_SA@mail.gmail.com>
Message-ID: <CAAXf6LWLeigPOiUFi5x1OhT-fGvG5FJMv1xArA35HQVrNKTSoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Tue, Sep 2, 2014 at 9:31 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
...
>>>
>>> Clearly the above comments are just some quick notices.
>>> Overall, I agree with ThomasP that FIT support should not be in
>>> linux/. In one of our projects the FIT images contain both the kernel,
>>> u-boot, and some text file.
>>
>> Thanks for review. I will rework the patch and place this option to fs
>> image configuration.
>
> I want to cover following use cases:
>
> 1. simple FIT image lying in output/images

What do you mean with 'simple' FIT image? What does it contain?

> 2. simple FIT image, that will be installed to /boot instead of kernel image

What do you mean with 'installed to /boot'? Buildroot does not install
anything to /boot, and if you were talking about the target itself,
many targets do not work with such a /boot partition/directory.

> 3. FIT image with embedded initramfs (referenced via *.its)
> 4. FIT image, where initrams is embedded into kernel directly

If the user is to supply an .its file himself (which I found most
logical so that he/she has most flexibility) then we don't have to
treat any of these cases directly right?

The user specifies in an its file which components it contains, and
whether the vmlinux image contains initramfs or not is not relevant
for us, we just call 'mkimage' on it.

I may be missing something, so please clarify.

Thanks,
Thomas
