From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 8 Mar 2013 17:00:51 +0100 (CET)
Subject: [Buildroot] Q. How to use a custom kernel tree?
In-Reply-To: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
Message-ID: <625541783.243878.1362758451151.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

simplest is to set a local.mk containing

LINUX_OVERRIDE_SRCDIR=<path to your uncompressed source>


this will use your directory as the sources.

there is also an option to specify the config file.

with those two you should be good



    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> 
> 
> 
> 
> 
> I have a customized, patched kernel tree which I'd like BR to use.
> 
> I tar'd the custom kernel tree, selected custom tarball for the
> kernel version and put the full URL/path to the archive in
> BR2_LINUX_KERNEL_CUSTOM_TARBALL.
> 
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
> /home/chrisw/embedded/buildroot/output/build/linux-custom -xf -
> cat: /home/chrisw/embedded/buildroot/dl/linux-3.4-ss4000e.tar: No
> such file or directory
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> 
> It appears that BR expects to find the custom tarball in <BR>/dl, not
> the path I specified.
> 
> What should I do to have BR use my custom kernel tree and config?
> 
> 
> 
> --
> -Chris-
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
