From: lpdev at cordier.org <lpdev@cordier.org>
Date: Tue, 14 Aug 2018 22:08:06 +0200 (CEST)
Subject: [Buildroot] Intel MediaSDK package w. Quicksync (h264,
 h265 HW encoding)
Message-ID: <ea-mime-5b7336a6-c6c-5874a42@www-1.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot community,



Working on buildroot for 3 weeks now, I would like to congrat everyone that participated to this wonderful project.

Today I have finished to integrate the the Intel MediaSDK to buildroot. The Intel MediaSDK features Intel QuickSync through the libmfx API, allowing all the cool kids to make use of hardware encoding/decoding for popular video format such as h264, h265, jpeg, vp9, etc. Even though there are no real benchmark against vaapi, MFX layer promise better performances than the former. There is currently a working implementation of this layer in ffmpeg that is working very well even on little 'embedded' computers (I did some testing on an Intel Computestick STK2MV64CC).

Since version 2018 of the SDK, Intel has made huge effort to make the compilation easier, by integrating most of their patches on the mainstream kernel for instance.



I would like to submit a patch to buildroot for this new package, intel-mediasdk. However I am running into small issues that need to be addressed before the submission.



1. Currently there are some strong restriction around the kernel version that needs to be 4.14.16. 

  1.1 Is it possible for a package to force the Kernel version?

2. libva and libva-utils need to be recompiled using Intel forks (respectively https://github.com/intel/libva and https://github.com/intel/libva-utils). I have no idea of how I can switch the version in buildroot. I have currently modified the source site of both package using the repo above. 

? 2.1 Should I add a special switch like BR2_PACKAGE_LIBVA_INTEL_QUICKSYNC that switches between these 2 versions? 

? 2.2 Is it the cleaner way? 

? 2.3 Is wrapping these 2 packages into a virtual-package better? If not, how this can be integrated in Buildroot?

Thank you for your time,

Regards, Louis-Paul CORDIER



Resources:

https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack

https://github.com/Intel-Media-SDK/MediaSDK/releases/tag/MediaSDK-2018-Q2.2

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180814/4db26f36/attachment.html>
