From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 22:05:44 +0200
Subject: [Buildroot] [PATCH 2/2] board/sifive: add support for the
 HiFive Unleashed board
In-Reply-To: <CAKmqyKPbCKJe_TE4Y0uxhfcoP5FDzVCBXAPkXRWc9qyaX43F3A@mail.gmail.com>
References: <20190414134307.24754-1-mark.corbin@embecosm.com>
 <20190414134307.24754-2-mark.corbin@embecosm.com>
 <7261729c-385b-8dd1-e969-72f95c9ac0be@mind.be>
 <32b6cdc6-3536-91de-206e-6059eed78b9c@embecosm.com>
 <c7f0cf15-5ed5-6ab0-2c36-dad0bcc9572e@mind.be>
 <CAKmqyKPbCKJe_TE4Y0uxhfcoP5FDzVCBXAPkXRWc9qyaX43F3A@mail.gmail.com>
Message-ID: <9fdeda2c-8b5a-5f25-e345-134bee52ef34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2019 01:29, Alistair Francis wrote:
> Unfortunately there is no "official" upstream fork. If using the 5.1
> kernel there are only 8 patches required
> (https://github.com/alistair23/linux/tree/hifive-unleashed-5.1). In OE
> we just apply those patches on top of mainline for 5.1
> (https://github.com/riscv/meta-riscv/tree/master/recipes-kernel/linux/files/freedom-u540)
> as that way we can still get updates from the kernel community.
> 
> I think the best bet is to use the latest kernel (maybe it's worth
> waiting until 5.1) and applying the patches on top. The diff is slowly
> shrinking so the newer the kernel the better. Those older kernels are
> not in a great shape and no one is maintaining them.

 Indeed, that seems like the best approach.

 The five patches are still pretty large, but instead of including them we can
just set the BR2_LINUX_KERNEL_PATCH variable and give the five github URLs:
https://github.com/alistair23/linux/commit/67c5007e487bdd629ea27b7df9016ce41bf7b422.patch
etc.


 Regards,
 Arnout
