From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 8 Mar 2012 22:53:18 -0500
Subject: [Buildroot] BeagleBone patches
In-Reply-To: <87ipieeqp2.fsf@macbook.be.48ers.dk>
References: <CA+-urNQF5PfTt_i1xhtPtOLSfpB=MOjWsvZ3U-FR6LQTRu6iJw@mail.gmail.com>
 <87ipieeqp2.fsf@macbook.be.48ers.dk>
Message-ID: <CA+-urNRqM69S8iWbXW_T2eDpx+sU5kSxocYGuka+3BiiCoGsbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 8, 2012 at 4:19 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
> ?Frank> 1. I could not avoid adding a couple files under a
> ?Frank> board/beaglebone directory. There aren't that many other
> ?Frank> configurations that do this, so I wasn't quite sure how everyone
> ?Frank> would like BeagleBone referenced. ?Please let me know if the
> ?Frank> folder structure should change.
>
> It's probably not a problem, but post your patches and I'll review in
> detail.

Hmm. It looked like everything worked when I sent the patches. I see
that they're posted at

http://lists.busybox.net/pipermail/buildroot/2012-March/051170.html
http://lists.busybox.net/pipermail/buildroot/2012-March/051169.html

But given that they don't have any replies, maybe they didn't get emailed out?

>
> ?Frank> 2. You'll see that MLO gets built with U-boot rather than with
> ?Frank> the X-Loader package. I'm not familiar with why the two were
> ?Frank> integrated, but it seems to be the way that TI is doing it now
> ?Frank> with the bone so I added an option.
>
> Yes, I believe MLO in u-boot is the "new" way, and X-loader is going
> away long term.
>
> ?Frank> 3. There were a few Linux kernels to choose from. The one that I used
> ?Frank> is the currently released version from the beagleboard group (I just
> ?Frank> verified a couple days ago).
>
> Do you mean git://github.com/hvaibhav/am335x-linux.git? Only very basic
> am335x support is in mainline yet, so that imho makes sense at the
> moment.

Jason Kridner told me that the hvaibhav git was the latest development
head, and that the latest release was at
https://github.com/koenkooi/linux/tree/linux-ti33x-psp-3.2-r5a+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91.

The "koenkooi" tree appears to have better support on the beagle
mailing list. It also runs well for me, so that's the one that I used
in the patch. I expect that the "official released kernel" will change
again in the coming months as more of the features from Koen's tree
get merged into the hvaibhav tree.

>
> ?Frank> Rather than commit the kernel configuration that I use with my
> ?Frank> project, I pulled in the one from the released kernel. This
> ?Frank> seemed more "right", but I did have to modify it to compile in
> ?Frank> EXT2 so that it could mount the generated rootfs. I also
> ?Frank> modified the kernel config to compress the kernel with gzip
> ?Frank> rather than lzo to avoid requiring the person compiling the code
> ?Frank> to install lzop.
>
> Hmm, that sounds like a buildroot bug. We already build liblzo for the
> host, so building lzop as well wouldn't be a big deal.
>
> ?Frank> The latter is probably completely trivial, but I have found br's
> ?Frank> minimalist dependencies really nice in the past and didn't want
> ?Frank> to add another. The one thing that I don't like about this
> ?Frank> kernel configuration is that enables an enormous number of
> ?Frank> features. I'm guessing that this is an Angstrom-ism, and I
> ?Frank> wanted to pass it by the list before spending any time modifying
> ?Frank> it.
>
> Please post the patches, that will make it easier to give concrete
> feedback.

If you don't see the patch emails, I'll resend them tomorrow morning.
It's weird that they didn't go through at the same time.

Thanks,
Frank
