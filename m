From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Dec 2014 09:22:32 +0100
Subject: [Buildroot] Need HDF5 Package for buildroot
In-Reply-To: <938dd60bbeb74a7ba18f7a54eb215760@exch13-mail06.win.slac.stanford.edu>
References: <938dd60bbeb74a7ba18f7a54eb215760@exch13-mail06.win.slac.stanford.edu>
Message-ID: <20141230092232.4974fa12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ernesto,

On Tue, 30 Dec 2014 04:06:12 +0000, Williams Jr., Ernest L. wrote:

> I am using "buildroot-2014.11" with the uclibc toolchain for  "x86" and "x86_64" targets.
> 
> I do notice the packages along with the configuration files :)
> 
> I have also looked at the documentation on how to add a new package.
> 
> So, I am not re-inventing the wheel; does anyone already have package configs for the following:
> I need to have hdf5 support on my target.  hdf5 depends on both szip and zlib.

I am not aware of any effort to package hdf5 at this point. I had a
quick look, and it uses the autotools, so you could use the
autotools-package infrastructure in Buildroot to create a package for
hdf5, it should be fairly straightforward.

Note that the dependencies on zlib and szip are optional, according to
http://www.hdfgroup.org/ftp/HDF5/current/src/unpacked/release_docs/INSTALL.

If you create a package for hdf5 and/or szip, please remember to submit
them upstream. This has several benefits: people with a strong
Buildroot expertise will review your changes and point to potential
issues/mistakes, and others will be able to benefit from the work
you've done.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
