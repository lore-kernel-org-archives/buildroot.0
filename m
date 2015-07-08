From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 14:29:53 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-28
In-Reply-To: <1436357726.3043.10.camel@synopsys.com>
References: <20150629063017.4326F10013E@stock.ovh.net>
 <1436194278.3246.42.camel@synopsys.com>
 <20150706174356.6d6471c9@free-electrons.com>
 <1436357726.3043.10.camel@synopsys.com>
Message-ID: <20150708142953.7c615412@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Wed, 8 Jul 2015 12:15:26 +0000, Alexey Brodkin wrote:

> > I don't know if your mailer allows that, but if you could avoid
> > wrapping the text you are replying to, it would be great. Because
> > you're wrapping the quoted text, all URLs to build reports are broken.
> 
> Well I used to use Evolution with auto-wrapping on 72 character.
> Now I relaxed this limitation to much higher value. Let's see how it goes.

It's actually more complicated than that. You generally need to wrap
the text you write when it's normal text, but not wrap text that is
code example, log files, etc.

> BTW I think we discussed it already - if there's a way to find out details of
> a particular build machine? At least it's Linux distro flavor and version.
> Preferably output of "gcc -v" and maybe other common tools.
> 
> That will allow to reconstruct exactly the same build environment. Remember
> we saw a problem with binutils and gdb building that was not reproducible
> on Fedora 21/22 but happened on your build machines? 

Would be useful. Can you define the exact commands for which you would
like to see the output saved as a description of the "environment"?
Then I could add then to autobuild-run so that they are generated for
each build and pushed as part of the build result to
http://autobuild.buildroot.org.


> Hm, once again it's probably my different build environment but I have
> exactly the same failure with this pre-built ARM toolchain.

No, the difference is that we didn't use the same configuration.

> That's my output of "make savedefconfig". Basically it's
> http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
> plus BR2_PACKAGE_EMPTY=y:
> ------------------------------->8----------------------------
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="
> http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2015.05-496-g85945aa.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_EMPTY=y
> ------------------------------->8----------------------------

I have changed
http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
just yesterday. You're using the new version, I was using the previous
version. Try again with this defconfig, and you will see the build
succeed:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2015.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_EMPTY=y

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
