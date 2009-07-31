From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 12:20:26 +0200
Subject: [Buildroot] linux .config : override: reassigning tosymbolAEABI
In-Reply-To: <F81DF98CADE6064F81A746D7C8323593782CC1@fr-ex009.groupinfra.com>
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<20090729132515.GM19257@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com>
	<20090729134234.GY13236@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CB2@fr-ex009.groupinfra.com>
	<20090729142610.GB9464@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CC1@fr-ex009.groupinfra.com>
Message-ID: <20090731122026.1c5d4b86@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

Le Wed, 29 Jul 2009 18:07:33 +0200,
"Courousse, Damien" <damien.courousse@logica.com> a ?crit :

> root=/dev/nfs rw
> nfsroot=10.84.34.52:/mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/root
> ip=10.84.34.8:10.84.34.52:10.84.34.1:255.255.255.192:debian_test:eth0:off

The /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/root
directory cannot be used to boot over NFS, because the /dev directory
doesn't contain any device file (Buildroot can create them, since it
requires root priviledges).

To boot over NFS, you have to do the following things:

 * Enable the generation of a tarball in the Buildroot configuration /
   Target filesystem options

 * Uncompress the tarball somewhere in your host, while being root (or
   using sudo), so that tar is allowed to create device files

 * Mount the location where you uncompressed the tarball over NFS

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
