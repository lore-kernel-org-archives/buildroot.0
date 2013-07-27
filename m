From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 15:17:22 +0200
Subject: [Buildroot] [PATCH] dpkg: new package and host package
In-Reply-To: <2e7a58f00720bcfba517.1374659463@BEANTN0L019720>
References: <2e7a58f00720bcfba517.1374659463@BEANTN0L019720>
Message-ID: <20130727151722.13406a87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 24 Jul 2013 11:51:03 +0200, Thomas De Schampheleire wrote:
> dpkg is the debian package manager. On target, it is useful to install
> .deb files containing certain software. On host, it is useful to create
> such .deb files. The creation of such .deb files could happen from a
> post-build script, or from project-specific packages.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Thanks. Unfortunately, it doesn't build with a minimal uClibc ARM
toolchain, apparently because dpkg doesn't recognize the
linux-uclibcgnueabi tuple fragment as a valid operating system. I get:

checking for posix_fadvise... yes
checking dpkg cpu type... arm
configure: WARNING: arm not found in cputable
checking dpkg operating system type... linux-uclibcgnueabi
configure: WARNING: linux-uclibcgnueabi not found in ostable
checking dpkg architecture name... configure: error: cannot determine host dpkg architecture
make: *** [/home/thomas/projets/buildroot/output/build/dpkg-1.16.10/.stamp_configured] Erreur 1

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
