From: Jonathan Haws <Jonathan.Haws@sdl.usu.edu>
Date: Tue, 17 May 2011 17:02:23 +0000
Subject: [Buildroot] Building x86_64 Toolchain
In-Reply-To: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DF530@Mercury.usurf.usu.edu>
References: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEBC@Mercury.usurf.usu.edu>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEFA@Mercury.usurf.usu.edu>
	<20110517085847.46aa97fc@surf>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DE492@Mercury.usurf.usu.edu>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DF530@Mercury.usurf.usu.edu>
Message-ID: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DF609@Mercury.usurf.usu.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>Turns out I am now getting new errors.  I upgraded buildroot to the latest snapshot and reworked my config file (which I have attached).  The main change is I went to uClibc 0.9.32-rc3 from 0.9.31.  
>
>Here's an update - I changed the config file to only run one task at a time (BR2_JLEVEL = 1 now).  Here is the latest output and the gcc-4.4.6-final config.log.
>
>Any ideas?
>
>
>Checking multilib configuration for libstdc++-v3...
>mkdir -p -- x86_64-unknown-linux-uclibc/libstdc++-v3
>Configuring in x86_64-unknown-linux-uclibc/libstdc++-v3
>configure: creating cache ./config.cache checking build system type... x86_64-unknown-linux-gnu checking host system type... x86_64-unknown-linux-uclibc checking target system type... x86_64->unknown-linux-uclibc checking for a BSD-compatible install... /usr/bin/install -c checking whether build environment is sane... yes checking for gawk... gawk checking whether /usr/bin/make sets >$(MAKE)... yes checking for x86_64-unknown-linux-uclibc-strip... /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/strip
>checking how to run the C preprocessor... /lib/cpp checking for egrep... grep -E checking for x86_64-unknown-linux-uclibc-gcc... >/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/./gcc/xgcc -B/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/./gcc/ ->B/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ ->B/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/lib/ -isystem >/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/include -isystem >/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sys-include
>checking for suffix of object files... configure: error: in `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/x86_64-unknown-linux-uclibc/libstdc++-v3':
>configure: error: cannot compute suffix of object files: cannot compile See `config.log' for more details.
>make[2]: *** [configure-target-libstdc++-v3] Error 1
>make[2]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final'
>make[1]: *** [all] Error 2
>make[1]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final'
>make: *** [/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/.compiled] Error 2

Turns out it was a bug in the compilation of GCC 4.4.6.  I reverted back to 4.3.x in my configuration and things are building now.  Is this something that needs to be filed as a bug or is it something in my setup?

Thanks for the help!

Jonathan
