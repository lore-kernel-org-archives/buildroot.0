From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 20 Dec 2007 14:55:16 +1100
Subject: [Buildroot] ARM build question/issue
In-Reply-To: <5970ab460712191859m276e036exa6ff7b519ec30f8a@mail.gmail.com>
References: <5970ab460712191859m276e036exa6ff7b519ec30f8a@mail.gmail.com>
Message-ID: <20071220035516.GA17349@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 19, 2007 at 09:59:29PM -0500, Martin Bures wrote:
> So I applied the fakeroot patch and the build for an ARM 920T system stopped
> here:
> touch -c /home/martin/buildroot/build_arm/staging_dir/usr/bin/fakeroot
> rm -rf /home/martin/buildroot/build_arm/makedevs
> mkdir /home/martin/buildroot/build_arm/makedevs
> cp target/makedevs/makedevs.c /home/martin/buildroot/build_arm/makedevs
> /usr/bin/gcc -Wall -Werror -O2
> /home/martin/buildroot/build_arm/makedevs/makedevs.c -o
> /home/martin/buildroot/build_arm/makedevs/makedevs
> touch -c /home/martin/buildroot/build_arm/makedevs/makedevs
> /usr/bin/install -m 755 /home/martin/buildroot/build_arm/makedevs/makedevs
> /home/martin/buildroot/build_arm/staging_dir/bin/makedevs
> touch -c /home/martin/buildroot/build_arm/staging_dir/bin/makedevs
> make: *** No rule to make target `mtd-host', needed by
> `/home/martin/buildroot/binaries/uclibc/rootfs.arm_nofpu.jffs2'.  Stop.
> 
> Any thoughts?
> 
> Here is my .config file.
[..]
> BR2_PACKAGE_MTD=y
> # BR2_AUDIO_SUPPORT is not set
> # BR2_GRAPHIC_SUPPORT is not set
> # BR2_COMPRESSOR_SUPPORT is not set
> # BR2_SCRIPTING_SUPPORT is not set
> # BR2_GAMES is not set

Once MTD is selected there are some other options to set which version.
None of those are mentioned in your .config, so the correct makefile is
not being included.

I don't know how you could enable BR2_PACKAGE_MTD=y without setting the
other options (unless you edited your .config by hand to enable it).


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
