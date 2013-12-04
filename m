From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 09:11:34 +0100
Subject: [Buildroot] Bug in the grub patches
In-Reply-To: <OFA9DEB6A7.487A9EC5-ON86257C36.007BBF5E-86257C36.007CA347@rockwellcollins.com>
References: <1386108927-12612-1-git-send-email-yann.morin.1998@free.fr>
 <OFA9DEB6A7.487A9EC5-ON86257C36.007BBF5E-86257C36.007CA347@rockwellcollins.com>
Message-ID: <20131204091134.526e0558@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

Please do not reply to an existing e-mail when you're starting a new
discussion. You're breaking discussion threads by doing so. When you
start a new discussion, simply create a new e-mail.

On Tue, 3 Dec 2013 16:41:22 -0600, Matthew Weber wrote:

> It looks like since (nov30) 9b3904543ca04c5d5fe5f6974539eed376de2290 the 
> grub pkg now fails when build on a x86_64 for a x86 target.  While using 
> an external glibc codesourcery_x86 201209 toolchain.

> This last error looks like a 32 vs 64bit issue.
> 
> I'm guessing the build for x86 on a x86_64 patches introduced this, but I 
> haven't made it through all recent grub updates yet.

Thanks for this report! However, I have been unable to reproduce: I am
building on a 64 bits machine (uname -m reports x86_64), and grub
builds fine with the codesourcery x86 2012.09 toolchain. More
specifically, I've built the following configuration:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB=y

Can you give me your Buildroot .config, as well as the complete build
log of Grub, and the Grub config.log file?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
