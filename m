From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Mar 2013 17:07:03 +0100
Subject: [Buildroot] Q. How to use a custom kernel tree?
In-Reply-To: <625541783.243878.1362758451151.JavaMail.root@openwide.fr>
References: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
 <625541783.243878.1362758451151.JavaMail.root@openwide.fr>
Message-ID: <20130308170703.66d093d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

Please don't top-post, this is annoying.

On Fri, 8 Mar 2013 17:00:51 +0100 (CET), Jeremy Rosen wrote:
> simplest is to set a local.mk containing
> 
> LINUX_OVERRIDE_SRCDIR=<path to your uncompressed source>
> 
> this will use your directory as the sources.
> 
> there is also an option to specify the config file.
> 
> with those two you should be good

This doesn't really answers Chris question. The LINUX_OVERRIDE_SRCDIR
mechanism is usually meant to be useful during development, when you're
actively modifying your kernel tree.

Apparently, Chris is in a situation where he has some kernel sources
that don't change, and therefore he creates a tarball from them, and
expect Buildroot to be able to use this tarball. This can normally be
achieved using the BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION option,
which Chris rightly tried to use.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
