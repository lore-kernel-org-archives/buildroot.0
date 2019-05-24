From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 23:16:37 +0200
Subject: [Buildroot] [PATCH 1/3] package/intel-microcode: install into
 images for early loading support
In-Reply-To: <20190520221712.22564-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 21 May 2019 00:17:10 +0200")
References: <20190520221712.22564-1-peter@korsgaard.com>
Message-ID: <87o93rpn7u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Microcode based security mitigation (E.G.  MDS) requires that the microcode
 > gets loaded very early. This can be handled by one of:

 > - Concatenating (a subset of) the intel-microcode files and write to
 >   kernel/x86/microcode/GenuineIntel.bin in the initrd.  Requires that the
 >   (first) initrd is external from the kernel and NOT compressed.

 > - Build (a subset of) the intel-microcode files into the kernel using the
 >   CONFIG_EXTRA_FIRMWARE option.

 > Install the microcode files into images to support these use cases (E.G.
 > through a post-build script for the initrd, or by pointing
 > CONFIG_EXTRA_FIRMWARE_DIR to ${BR_BINARIES_DIR}, similar to how we include
 > the .cpio image inside the kernel).

As pointed out by Thomas on IRC, there may be licensing concerns when
embedding non-GPL firmware inside the kernel.

Committed after adding a note about that, thanks.

-- 
Bye, Peter Korsgaard
