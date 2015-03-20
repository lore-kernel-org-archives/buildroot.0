From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:54:58 +0100
Subject: [Buildroot] [PATCH] package: add powertop 2.7
In-Reply-To: <CAKbGBLiMuNMLZp+7pbPYrS4XZTzge-+gB4a331sCU33yW53BUA@mail.gmail.com>
References: <1426743621-1652-1-git-send-email-steven@uplinklabs.net>
 <20150320163316.695aa4ed@free-electrons.com>
 <CAKbGBLiMuNMLZp+7pbPYrS4XZTzge-+gB4a331sCU33yW53BUA@mail.gmail.com>
Message-ID: <20150320215458.6a154748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Fri, 20 Mar 2015 13:28:03 -0700, Steven Noonan wrote:

> >     [Thomas:
> >       - fix commit title
> >       - powertop wants libintl unconditionally, so make sure
> >         BR2_PACKAGE_GETTEXT is selected when BR2_NEEDS_GETTEXT is set,
> >         and add gettext to the dependencies.
> >       - add missing comment about thread dependency.
> >       - add missing dependency on host-pkgconf, without which powertop
> >         cannot find libnl.
> >       - patch src/Makefile.am to not pass -fstack-protector, which fails
> >         to build if the toolchain does not have SSP support.
> >       - rename patch powertop-autotune.patch to confirm to the patch
> >         naming convention.]
> 
> Yes, I agree, that number of issues is ridiculous.

Well, I wouldn't use "ridiculous" : those are your first Buildroot
contributions, so it's kind of expected that you don't necessarily know
all the combinations we typically test before applying patches. I'm
very happy to see new contributors, and to see you and Mike Williams
taking care of the systemd stuff. So clearly I don't want to shoot down
your contributions :-)

> I appreciate the feedback. I had only been testing with x86_64 and x32
> glibc builds, and hadn't thought of uClibc issues. I'll be sure to try
> and test that in the future.

Yes, even though glibc is widely used, uClibc is still our default C
library, and so we continue to check that things build fine with it.
You have some configuration fragments that use pre-built uClibc
toolchains at http://autobuild.buildroot.org/toolchains/configs/, which
make it easy to test various situations without having to rebuild a
full toolchain each time.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
