From: Chris Wilkinson <winstonian36@gmail.com>
Date: Fri, 8 Mar 2013 10:47:42 -0500
Subject: [Buildroot] Q. How to use a custom kernel tree?
Message-ID: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a customized, patched kernel tree which I'd like BR to use.

I tar'd the custom kernel tree, selected custom tarball for the kernel
version and put the full URL/path to the archive in
BR2_LINUX_KERNEL_CUSTOM_TARBALL.

The custom tree also contains a defconfig for my arch. I set
BR2_LINUX_KERNEL_USE_DEFCONFIG=y and gave it's name in
BR2_LINUX_KERNEL_DEFCONFIG.

Using make, BR error'ed out thus.

>>> linux custom Extracting
cat /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar | tar
--strip-components=1 -C
/home/chrisw/embedded/buildroot/output/build/linux-custom  -xf -
cat: /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar: No such file
or directory
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

It appears that BR expects to find the custom tarball in <BR>/dl, not the
path I specified.

What should I do to have BR use my custom kernel tree and config?

-- 
-Chris-
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130308/61d4cd23/attachment-0001.html>
