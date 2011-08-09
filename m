From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Aug 2011 08:31:55 +0200
Subject: [Buildroot] Problems with udev buildroot
In-Reply-To: <9BFF739A-9E25-4A0D-B689-418A498734F3@gmx.net> (Heiko Helmle's
 message of "Mon, 8 Aug 2011 22:56:19 +0200")
References: <20110808200716.101270@gmx.net>
 <9BFF739A-9E25-4A0D-B689-418A498734F3@gmx.net>
Message-ID: <87pqkfjdt0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:

 Heiko> aah sorry - the rookie found his mistake:

 Heiko> I'm using a cpio'd filesystem as initramfs - and that disables
 Heiko> devtmpfs_mount - according to kernel doc, initramfs has to to
 Heiko> mount devtmpfs manually to use it.

 Heiko> So I'm still not quite sure if it'd be better to edit the
 Heiko> inittab to mount devtmpfs or just put the basic nodes statically
 Heiko> into /dev...

We have native initramfs support in BR, which contains a workaround for
the kernel not mounting devtmpfs - Why are you not using that?

-- 
Bye, Peter Korsgaard
