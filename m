From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 10 Mar 2011 16:11:53 +0100
Subject: [Buildroot] Patching kernel with a tarball containing multiple
	patches
Message-ID: <4D78EA39.6000904@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

During the buildroot developer day on Friday 29th October, you have 
talked about the ability to use tarball containing multiple patches.

I have seen that something was done to allow to use a space-separated 
list of patches. It's a good thing since I could download one patch and 
a second one. The problem is that the second one is a tarball containing 
multiples patches. The tar.bz2 file was not a problem for 
patch-kernel.sh but it simply uses a bunzip2 -cd command. Using this one 
instead of extracting the archive into a folder introduces some troubles 
since the order of the patches is not conserved.

It will be great to use this option as following :
BR2_LINUX_KERNEL_PATCH="ftp://my_patches.tar.bz2 patches_to_apply"
Then we have all our patches for kernel 2.6.35 for example but if some 
of them are integrated into next revisions as 2.6.35.2, we can skip 
integrated patches by changing only the list.

What is your point of view about it? Do I miss something (maybe I can 
already do that) ?


Regards

Ludovic Desroches
