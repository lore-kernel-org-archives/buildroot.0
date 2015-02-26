From: Crast, Nicholas <Nicholas.Crast@saabsensis.com>
Date: Thu, 26 Feb 2015 18:29:54 +0000
Subject: [Buildroot] Kernel Patches Not Applied
Message-ID: <36A43B0E1E88D84791516F9D44BC48331B4A722A@corpmail01.corp.sensis.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am currently using buildroot-2014.11, and I am having issues patching my kernel. My kernel is a custom (untarred) source, so the build output is in output/build/linux-custom.

My patch is in the following folder:
board/sensis/patches/linux-custom-0001-spi.patch

I have tried the filename linux-0001-spi.patch as well.

Here is the relevant section of my .config file:
BR2_GLOBAL_PATCH_DIR=""
BR2_LINUX_KERNEL_PATCH="board/sensis/patches"

When I run make linux-dirclean linux-patch, I get the following output:
rm -Rf /home/nick/buildroot-2014.11/output/build/linux-custom
>>> linux custom Syncing from source dir linux/linux-socfpga-socfpga-3.16-94ca8d7
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS linux/linux-socfpga-socfpga-3.16-94ca8d7/ /home/nick/buildroot-2014.11/output/build/linux-custom
touch /home/nick/buildroot-2014.11/output/build/linux-custom/.stamp_rsynced


I see nothing about it even attempting to patch. Any ideas what I am doing wrong?

Thanks,
Nick

---------------------------------------
Nick Crast
Software Engineer
Saab Sensis Corporation
Phone: 315-445-5703
Email: Nicholas.Crast at saabsensis.com<mailto:Nicholas.Crast@saabsensis.com>


This message is intended only for the addressee and may contain information that is company confidential or privileged. Any technical data in this message may be exported only in accordance with the U.S. International Traffic in Arms Regulations (22 CFR Parts 120-130) or the Export Administration Regulations (15 CFR Parts 730-774). Unauthorized use is strictly prohibited and may be unlawful. If you are not the intended recipient, or the person responsible for delivering to the intended recipient, you should not read, copy, disclose or otherwise use this message. If you have received this email in error, please delete it, and advise the sender immediately.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150226/0f1e32c7/attachment.html>
