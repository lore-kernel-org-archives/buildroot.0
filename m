From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Mar 2012 22:19:21 +0100
Subject: [Buildroot] BeagleBone patches
In-Reply-To: <CA+-urNQF5PfTt_i1xhtPtOLSfpB=MOjWsvZ3U-FR6LQTRu6iJw@mail.gmail.com>
 (Frank Hunleth's message of "Thu, 8 Mar 2012 08:50:11 -0500")
References: <CA+-urNQF5PfTt_i1xhtPtOLSfpB=MOjWsvZ3U-FR6LQTRu6iJw@mail.gmail.com>
Message-ID: <87ipieeqp2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

Hi,

 Frank> I had been sitting on some patches for making br builds for the
 Frank> BeagleBone. I finally got the time to update and clean them up,
 Frank> and they should show up to the list soon. I hope that this is
 Frank> better late than never.

Great. I have a beaglebone as well now, but I haven't had much time to
play with it yet.

 Frank> There were some things that I wasn't sure about:

 Frank> 1. I could not avoid adding a couple files under a
 Frank> board/beaglebone directory. There aren't that many other
 Frank> configurations that do this, so I wasn't quite sure how everyone
 Frank> would like BeagleBone referenced.  Please let me know if the
 Frank> folder structure should change.

It's probably not a problem, but post your patches and I'll review in
detail.

 Frank> 2. You'll see that MLO gets built with U-boot rather than with
 Frank> the X-Loader package. I'm not familiar with why the two were
 Frank> integrated, but it seems to be the way that TI is doing it now
 Frank> with the bone so I added an option.

Yes, I believe MLO in u-boot is the "new" way, and X-loader is going
away long term.

 Frank> 3. There were a few Linux kernels to choose from. The one that I used
 Frank> is the currently released version from the beagleboard group (I just
 Frank> verified a couple days ago).

Do you mean git://github.com/hvaibhav/am335x-linux.git? Only very basic
am335x support is in mainline yet, so that imho makes sense at the
moment.

 Frank> Rather than commit the kernel configuration that I use with my
 Frank> project, I pulled in the one from the released kernel. This
 Frank> seemed more "right", but I did have to modify it to compile in
 Frank> EXT2 so that it could mount the generated rootfs. I also
 Frank> modified the kernel config to compress the kernel with gzip
 Frank> rather than lzo to avoid requiring the person compiling the code
 Frank> to install lzop.

Hmm, that sounds like a buildroot bug. We already build liblzo for the
host, so building lzop as well wouldn't be a big deal.

 Frank> The latter is probably completely trivial, but I have found br's
 Frank> minimalist dependencies really nice in the past and didn't want
 Frank> to add another. The one thing that I don't like about this
 Frank> kernel configuration is that enables an enormous number of
 Frank> features. I'm guessing that this is an Angstrom-ism, and I
 Frank> wanted to pass it by the list before spending any time modifying
 Frank> it.

Please post the patches, that will make it easier to give concrete
feedback.

-- 
Bye, Peter Korsgaard
