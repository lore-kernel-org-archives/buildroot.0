From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 May 2009 10:39:50 +0200
Subject: [Buildroot] Getting problem when make
In-Reply-To: <2081969434.26061242292261158.JavaMail.root@mbr1.indiatimes.com>
	(bsudheer's message of "Thu\,
	14 May 2009 14\:41\:01 +0530 \(IST\)")
References: <2081969434.26061242292261158.JavaMail.root@mbr1.indiatimes.com>
Message-ID: <87bpppmqp5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bsudheer143" == bsudheer143  <bsudheer143@indiatimes.com> writes:

Hi,

 bsudheer143> Dear Mr, Peter Korsgaard
 bsudheer143> I want to port embedded linux in ARM board.

Please direct buildroot mails to the buildroot mailing list and not
directly to me.

 bsudheer143> I have started with buildroot download.
 bsudheer143> steps finished:
 bsudheer143> 1.downloaded buildroot-snapshot.tar.bz2 and untar done.
 bsudheer143> 2. cd /buildroot folder
 bsudheer143> then
 bsudheer143> 3.make menuconfig command
 bsudheer143> 4. Then make command , It takes more time and finally it gives the error like this
 bsudheer143> *** Unpacking kernel source
 bsudheer143> bzcat /root/sudheer/buildroot/dl/linux-2.6.29.3.tar.bz2 | tar -C /root/sudheer/buildroot/project_build_arm/uclibc   -xf -
 bsudheer143> touch /root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.unpacked
 bsudheer143> toolchain/patch-kernel.sh /root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3 toolchain/kernel-headers \
 bsudheer143> 		linux-2.6.29.3-\*.patch{,.gz,.bz2}
 bsudheer143> touch /root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.patched
 bsudheer143> cp -dpf  /root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.config
 bsudheer143> cp: missing destination file operand after `/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.config'
 bsudheer143> Try `cp --help' for more information.
 bsudheer143> make: *** [/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.configured] Error 1

 bsudheer143> please help me to solve this problem.

It seems like you haven't defined a kernel configuration file
(BR2_PACKAGE_LINUX_KCONFIG). See make menuconfig->Kernel->.config file

-- 
Bye, Peter Korsgaard
