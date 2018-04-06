From: Bradley, Mike <mike_bradley@mentor.com>
Date: Fri, 6 Apr 2018 20:57:07 +0000
Subject: [Buildroot] make linux-menuconfig
Message-ID: <a0288febbc3c4ff89997c83587592e20@SVR-ORW-MBX-04.mgc.mentorg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello!

I'm trying to build for the Zynq 7000.  I need a particular tag.  Normally I can do:

% git clone https://github.com/Xilinx/linux-xlnx
% git checkout tags/zynq-soc-for-4.3

I'm trying to replicate this in buildroot with

% make nconfig

[cid:image001.png at 01D3CDC7.68197080]

Then
% make linux-menuconfig

But, it fails with:

Initialized empty Git repository in ...../buildroot-2016.11.3/output/build/.linux-zynq-soc-for-4.3.tar.gz.xSOjlD/linux-zynq-soc-for-4.3/.git/
remote: Counting objects: 812346, done.
remote: Compressing objects: 100% (317542/317542), done.
remote: Total 812346 (delta 664056), reused 602764 (delta 488026), pack-reused 0
Receiving objects: 100% (812346/812346), 639.34 MiB | 676 KiB/s, done.
Resolving deltas: 100% (664056/664056), done.
warning: Remote branch zynq-soc-for-4.3 not found in upstream origin, using HEAD instead
Could not fetch special ref 'zynq-soc-for-4.3'; assuming it is not special.

Unfortunately, debugging this is difficult, as each time I re-run "make linux-menuconfig" it starts the long download process again.  I see I have:

buildroot-2016.11.3> ls output/build/.
./                                     .linux-zynq-soc-for-4.3.tar.gz.6Hrdoh/ .linux-zynq-soc-for-4.3.tar.gz.xSOjlD/
../                                    .linux-zynq-soc-for-4.3.tar.gz.od7Dct/
.br2-external.in                       .linux-zynq-soc-for-4.3.tar.gz.Pu1bhX/

That is, it doesn't remember it has already downloaded the base repo.  But, the real issue, is somehow I'm not sure how to tell buildroot how to checkout a specific tag from the github.

Alternatively, I already have the kernel I need downloaded.  So, if I could just point to that somehow, it may suffice.  But, I'm trying to create a generic method I can pass to others, so, would be nice to do it from one area (e.g. have buildroot do it all).

Thanks,
-Mike


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180406/2da0c81a/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 9943 bytes
Desc: image001.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180406/2da0c81a/attachment.png>
