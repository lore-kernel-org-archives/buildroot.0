From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 14:46:16 +0200
Subject: [Buildroot] [PATCHv2] Add some support for device tree kernels
 with appended trees
In-Reply-To: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120716144616.675e4f3b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue,  3 Jul 2012 12:01:12 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> This is a refactoring of the previous basic device tree
> options available for microblaze.
> 
> The previous option only made it possible for microblaze targets
> to give a path to an external device tree, and build a simpleImage
> with it. This involved using a custom target name as simpleImages
> are built with the simpleImage.dt_name.
> This is also the case on powerpc with cuImages.
> 
> This patchset replaces the existing mechanism with a more generic one.
> First, it allows to build device tree sources to blobs, both taking
> dts present in the kernel sources and external ones, using a path.
> 
> Then, it adds support for kernel images with appended device tree blobs.
> This option is only for ARM because it is the only architecture I can
> think of that has such feature.
> 
> Finally, it adds the simpleImage and cuImage as regular image variants,
> with the necessary logic to append the device tree name to use, while
> doing a bit of code factorisation for u-boot images along the way.

Thanks, I globally like this and find this much better than the
microblaze specific handling we had before. However, could you migrate
this nice cover letter description into the appropriate commit logs?
Your commit logs are really short and do not describe what the commit
is doing, but the commit logs is what is staying in the project
history, so this is where all the attention should be put, rather than
to the cover letter.

I'll reply to the individual patches for details.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
