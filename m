From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 19 Mar 2015 20:52:41 -0400 (EDT)
Subject: [Buildroot] [PATCH 0/5] media image generation
In-Reply-To: <550B5452.8080401@mind.be>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <550B5452.8080401@mind.be>
Message-ID: <922372444.1716533.1426812761607.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> > This patchset adds a minimal support to generate final images for a
> > medium (such as SD card or flash), by providing paths to some
> > genimage config files in a board directory.
> 
>  I agree with this idea, but I think the proposed implementation is
>  still a bit too ambitious.
> 
> 
> > The rationale behind using genimage as the first medium image
> > generation tool, is that while its configuration syntax is simple,
> > it requires a small overhead to use, like temporary directories,
> > host dependencies, and images path, that Buildroot is all aware of.
> > 
> > The first patch explains the convenience of this host tool, and adds
> > the mechanism to wrap and call genimage against optional config
> > file(s) specified in the board configuration, as well as the
> > appropriate documentation.
> > 
> > The subsequent patches adds genimage config files for the following
> > platforms: all Raspberry Pi models, BeagleBone Black, and the
> > Wandboard.
> 
>  I think this would be the first thing to do: add genimage config
>  files for these boards, and use them in their respective post-build
>  script.
> 
>  Then we can see if adding infrastructure to further support it is
>  worthwhile. A less invasive second step could be to put a genimage
>  wrapper script in support/scripts so that you don't need a new copy
>  for every board.
> 
> > They give good examples to show how Buildroot can be used to create
> > a fully functional SD card image with a bootloader, some firmware
> > files and a persistent rootfs, without the need to mount any
> > partition.
> > 
> > Finally, this support simplifies the user experience by providing
> > ready-to-use boot medium images, and lightening board documentation
> > with self documented configuration files.
> 
>  As part of that plan, I would remove the documentation from the
>  readme (just keep the reference to the website that explains it), and
>  instead move it to the configuration file.

I totally agree with your approach. I'll start the other way around with
one or two boards then we'll see how it goes. As long as the boards 
documentation and support are simplified, I'm happy :-)

Best,
-v
