From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 17 Jan 2007 19:18:55 +0100
Subject: [Buildroot] build root error with nofpu
In-Reply-To: <005501c739d4$a189ef90$0696a8c0@Thomas>
References: <005501c739d4$a189ef90$0696a8c0@Thomas>
Message-ID: <20070117181855.GB29900@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2007 at 09:03:13AM +0800, thomas.luo wrote:
>[root at localhost buildroot]# make
>
>Checking build system dependencies:
>CC clean:                                       Ok
>CXX clean:                                      Ok
>CPP clean:                                      Ok
>CFLAGS clean:                                   Ok
>CXXFLAGS clean:                                 Ok
>sed works:                                      Ok
>which installed:                                Ok
>GNU make version '3.80':                        Ok
>C compiler '/usr/bin/gcc'
>C compiler version '3.4.6':                     Ok
>bison installed:                                Ok
>flex installed:                                 Ok
>gettext installed:                              Ok
>Build system dependencies:                      Ok
>
>make -C /mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc \
>       PREFIX= \
>       DEVEL_PREFIX=/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/ \
>       RUNTIME_PREFIX=/mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/ \
>       install_runtime install_dev
>make[1]: Entering directory 
>`/mnt/rootbb/buildroot/toolchain_build_arm_nofpu/uClibc'
>install -d /mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib
>install -m 644 lib/lib*-0.9.29.so \
>       /mnt/rootbb/buildroot/build_arm_nofpu/staging_dir/lib
>install: cannot stat `lib/lib*-0.9.29.so': No such file or directory

do a rm -rf build_arm_nofpu/* toolchain_build_arm_nofpu/*
then make sure that your BR2_JLEVEL=1 and invoke "make" again and paste
the first error you get.

Providing your .config and the uclibc.config would help, too.
