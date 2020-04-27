From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:35:52 +0200
Subject: [Buildroot] [Buildroot 2020.02.1] Problems with x86_64-jaguar
 buildroot-toolchain-built kernel
In-Reply-To: <BL0PR10MB286624EC6E8417F3DA28E257FFAF0@BL0PR10MB2866.namprd10.prod.outlook.com>
References: <BL0PR10MB2866A594CDE0E5FD74BC767BFFAE0@BL0PR10MB2866.namprd10.prod.outlook.com>
 <BL0PR10MB286624EC6E8417F3DA28E257FFAF0@BL0PR10MB2866.namprd10.prod.outlook.com>
Message-ID: <20200427213552.57ea2ac7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Apr 2020 06:49:35 +0000
"Olivier, Alain [COMRES/EUR/BLU]" <Alain.Olivier@Emerson.com> wrote:

> I am experiencing the following problem when building a basic environment for a board running on a AMD GX-222GC (should be Jaguar subarch).
> The default external toolchain is amd-2016.11-19 from CodeBench. Kernel built with that toolchain boots correctly.
> Instead, if I build the same kernel, same configuration, with the toolchain built by buildroot, the kernel doen not boot! Not even a kernel panic, machine just resets.

I assume you are the person who also asked the same question on StackOverflow:

  https://stackoverflow.com/questions/61457023/why-is-my-kernel-resetting-my-machine-immediately

The critical bit of information missing in your e-mail, but that you
gave as a reply on stack overflow is that you are testing on 4.4.57.

However, there was an issue in Linux where using a toolchain that uses
binutils >= 2.31 would generate a non-bootable kernel. This was fixed
upstream, and then backported to the 4.4.x stable branch in commit:

  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=073bb7ddd35ca8f17a170258dacbe384935a43c8

This commit is available in the 4.4.x branch as of 4.4.124.

How do I immediately know that? I debugged exactly this issue last
week, where a Linux 4.4.39 built with Buildroot 2019.11 was booting
fine, but not built with Buildroot 2020.02 :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
