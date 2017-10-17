From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:06:11 +0200
Subject: [Buildroot] [git commit] libressl: fix musl build with older
	kernel headers
In-Reply-To: <20171006184939.E64E881150@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Fri, 6 Oct 2017 20:39:15 +0200")
References: <20171006184939.E64E881150@busybox.osuosl.org>
Message-ID: <8760bejg8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7adc268b58a1eea9967ed5c7a3b7b4471575d73a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
 > This breaks the build with kernel headers older than v3.17. Add a patch
 > adding a local definition of GRND_NONBLOCK to fix the build.

 > The following defconfig reproduces the build failure:

 > BR2_x86_pentium_mmx=y
 > BR2_TOOLCHAIN_BUILDROOT_MUSL=y
 > BR2_KERNEL_HEADERS_3_12=y
 > BR2_PACKAGE_LIBRESSL=y

 > The getentropy_linux.c file is in upstream tarball, but not in its git
 > repository. It originates from OpenBSD. For this reason the patch is
 > against the tarball, but not git formatted.

 > Cc: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > [Arnout: change filename to correspond to how git creates it]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
