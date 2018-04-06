From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 06 Apr 2018 20:58:03 -0300
Subject: [Buildroot] make linux-menuconfig
References: <a0288febbc3c4ff89997c83587592e20@SVR-ORW-MBX-04.mgc.mentorg.com>
Message-ID: <5ac8098b6ec7d_10912b11f9905ee4726db@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Apr 06, 2018 at 05:57 PM, Bradley, Mike wrote:

[snip]
> But, it fails with:
> 
> Initialized empty Git repository in ...../buildroot-2016.11.3/output/build/.linux-zynq-soc-for-4.3.tar.gz.xSOjlD/linux-zynq-soc-for-4.3/.git/
> remote: Counting objects: 812346, done.
> remote: Compressing objects: 100% (317542/317542), done.
> remote: Total 812346 (delta 664056), reused 602764 (delta 488026), pack-reused 0
> Receiving objects: 100% (812346/812346), 639.34 MiB | 676 KiB/s, done.
> Resolving deltas: 100% (664056/664056), done.
> warning: Remote branch zynq-soc-for-4.3 not found in upstream origin, using HEAD instead
> Could not fetch special ref 'zynq-soc-for-4.3'; assuming it is not special.

It succeeds here:

Buildroot 2016.11.3
git version 2.14.1

BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="zynq-soc-for-4.3"

>>> linux zynq-soc-for-4.3 Downloading
Doing shallow clone
Cloning into 'linux-zynq-soc-for-4.3'...
remote: Counting objects: 53876, done.
remote: Compressing objects: 100% (51004/51004), done.
remote: Total 53876 (delta 4351), reused 16173 (delta 2119), pack-reused 0
Receiving objects: 100% (53876/53876), 144.75 MiB | 972.00 KiB/s, done.
Resolving deltas: 100% (4351/4351), done.
Note: checking out 'e4a9288942392965bd5cfad93d9996b83c0dc4a6'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

Checking out files: 100% (50821/50821), done.
Could not fetch special ref 'zynq-soc-for-4.3'; assuming it is not special.
>>> linux zynq-soc-for-4.3 Extracting


[snip]
> Alternatively, I already have the kernel I need downloaded.  So, if I could just point to that somehow, it may suffice.  But, I'm trying to create a generic method I can pass to others, so, would be nice to do it from one area (e.g. have buildroot do it all).
[Side note: It is usual in mailing lists to use text only messages, with lines
wrapped at a reasonable column when it makes sense, i.e. around 80.]

Is this alternative method good for you?

[*] Linux Kernel
      Kernel version (Custom tarball)  --->
($(call github,Xilinx,linux-xlnx,zynq-soc-for-4.3)/linux-zynq-soc-for-4.3.tar.gz) URL

Inspired by: http://patchwork.ozlabs.org/patch/893965/


Regards,
Ricardo
