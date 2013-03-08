From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 08 Mar 2013 17:07:44 +0100
Subject: [Buildroot] Q. How to use a custom kernel tree?
In-Reply-To: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
References: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
Message-ID: <513A0CD0.2060205@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 08.03.2013 16:47, schrieb Chris Wilkinson:
>
> I have a customized, patched kernel tree which I'd like BR to use.
>
> I tar'd the custom kernel tree, selected custom tarball for the kernel
> version and put the full URL/path to the archive in
> BR2_LINUX_KERNEL_CUSTOM_TARBALL.
>
> The custom tree also contains a defconfig for my arch. I set
> BR2_LINUX_KERNEL_USE_DEFCONFIG=y and gave it's name in
> BR2_LINUX_KERNEL_DEFCONFIG.
>
> Using make, BR error'ed out thus.
>
> >>> linux custom Extracting
> cat /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar | tar
> --strip-components=1 -C
> /home/chrisw/embedded/buildroot/output/build/linux-custom  -xf -
> cat: /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar: No such
> file or directory
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
>
> It appears that BR expects to find the custom tarball in <BR>/dl, not
> the path I specified.
>
> What should I do to have BR use my custom kernel tree and config?
Hello Chris,

unfortunatelly, buildroot always assumes that the "custom tarball" is on
a server where it can be fetched using wget. I submitted a patch
(http://patchwork.ozlabs.org/patch/217204/) some time ago to improve
this, but noone responded.

You can use Source Override (see docu) to use your local kernel tree
(not gzipped).

Regards

Stephan
>
> -- 
> -Chris-
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130308/7959605e/attachment.html>
