From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2009 17:34:01 +0200
Subject: [Buildroot] MSB vs LSB mips library files
In-Reply-To: <147166.24870.qm@web53506.mail.re2.yahoo.com>
References: <147166.24870.qm@web53506.mail.re2.yahoo.com>
Message-ID: <20090702173401.6078dadf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 2 Jul 2009 06:40:15 -0700 (PDT),
jing han <jing_han_66@yahoo.com> a ?crit :

> After the make is finished, I checked through the mips files in my
> mips environment, I found that all the files in
> buildroot-2009.05/build_mips/staging_dir/usr/bin/* directory are LSB
> files, all the library files in
> buildroot-2009.05/build_mips/staging_dir/usr/lib/* directory are MSB
> files, which supprise me a lot and I don't want. 

Some of the files in build_mips/staging_dir/usr/bin/ are the
cross-compiler and other cross-compilation tools. So they are compiled
for x86 and generate code for MIPS. Or can you provide an example of a
binary in this directory that is LSB, but not for x86 ?

In build_mips/staging_dir/usr/lib/, are the libraries compiled to run
on the target, so compiled for the MIPS architecture.

> Could you tell me which option I could choose in order to avoid MSB
> library files?

Use mipsel instead of mips ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
