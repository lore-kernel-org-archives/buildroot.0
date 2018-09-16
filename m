From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix build with i586
In-Reply-To: <20180916120116.2835-1-fontaine.fabrice@gmail.com>
References: <20180916120116.2835-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916155838.6fa689bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Sep 2018 14:01:16 +0200, Fabrice Fontaine wrote:
> https://github.com/randombit/botan/commit/513d19781a558fbd1ff03c7152f61b5e7f294297
> removed support for i586, put it back otherwise the following build
> failure is raised:
> 
> (cd /accts/mlweber1/instance-0/output/build/botan-2.7.0; PATH="/accts/mlweber1/instance-0/output/host/bin:/accts/mlweber1/instance-0/output/host/sbin:/usr/bin:/bin" ./configure.py --cpu="i586" --os=linux --cc=gcc --cc-bin="/accts/mlweber1/instance-0/output/host/bin/i586-linux-g++" --prefix=/usr --disable-static-library --enable-shared-library --without-stack-protector --with-boost --with-bzip2 --with-openssl --with-sqlite --with-lzma --with-zlib --disable-altivec --disable-neon)
>    INFO: ./configure.py invoked with options "--cpu=i586 --os=linux --cc=gcc --cc-bin=/accts/mlweber1/instance-0/output/host/bin/i586-linux-g++ --prefix=/usr --disable-static-library --enable-shared-library --without-stack-protector --with-boost --with-bzip2 --with-openssl --with-sqlite --with-lzma --with-zlib --disable-altivec --disable-neon"
>    INFO: Autodetected platform information: OS="Linux" machine="x86_64" proc="x86_64"
>   ERROR: Unknown or unidentifiable processor "i586"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aaa2ea8c3fb5fe954c0af0061f83ad70e0a862f9

I don't believe this is really the right fix. Indeed, why should botan
specifically support all the BR2_ARCH values ?

Are you sure it's not the job of botan.mk to map the BR2_ARCH value to
whatever botan expects ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
