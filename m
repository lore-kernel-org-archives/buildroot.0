From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Apr 2013 22:09:10 +0200
Subject: [Buildroot] [PATCHv2 3/3] python-m2crypto: new package
In-Reply-To: <1365625766-11256-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 10 Apr 2013 17:29:26 -0300")
References: <1365625766-11256-1-git-send-email-gustavo@zacarias.com.ar>
 <1365625766-11256-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9oviot5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in                          |  1 +
 Gustavo>  package/python-m2crypto/Config.in          | 10 ++++++++
 Gustavo>  package/python-m2crypto/python-m2crypto.mk | 40 ++++++++++++++++++++++++++++++
 Gustavo>  3 files changed, 51 insertions(+)
 Gustavo>  create mode 100644 package/python-m2crypto/Config.in
 Gustavo>  create mode 100644 package/python-m2crypto/python-m2crypto.mk

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index 2e7dc67..0537ffa 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -327,6 +327,7 @@ menu "external python modules"
 Gustavo>  source "package/python-bottle/Config.in"
 Gustavo>  source "package/python-dpkt/Config.in"
 Gustavo>  source "package/python-id3/Config.in"
 Gustavo> +source "package/python-m2crypto/Config.in"
 Gustavo>  source "package/python-mad/Config.in"
 Gustavo>  source "package/python-meld3/Config.in"
 Gustavo>  source "package/python-netifaces/Config.in"
 Gustavo> diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..2ee4ab1
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/python-m2crypto/Config.in
 Gustavo> @@ -0,0 +1,10 @@
 Gustavo> +config BR2_PACKAGE_PYTHON_M2CRYPTO
 Gustavo> +	bool "python-m2crypto"
 Gustavo> +	depends on BR2_PACKAGE_PYTHON
 Gustavo> +	select BR2_PACKAGE_OPENSSL
 Gustavo> +	select BR2_PACKAGE_PYTHON_ZLIB
 Gustavo> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 Gustavo> +	help
 Gustavo> +	  M2Crypto is the most complete Python wrapper for OpenSSL.
 Gustavo> +
 Gustavo> +	  http://chandlerproject.org/Projects/MeTooCrypto

Thanks, but it doesn't seem to build here (arma8, internal toolchain):

creating build/temp.linux-x86_64-2.7/SWIG
/home/peko/source/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -I/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/python2.7 -I/usr/include -I/home/peko/source/buildroot/output/build/python-m2crypto-0.21.1/SWIG -c SWIG/_m2crypto_wrap.c -o build/temp.linux-x86_64-2.7/SWIG/_m2crypto_wrap.o -DTHREADING
In file included from /usr/include/limits.h:27:0,
                 from /home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/python2.7/Python.h:19,
                 from SWIG/_m2crypto_wrap.c:126:
/usr/include/features.h:323:26: fatal error: bits/predefs.h: No such file or directory

It ends up using host includes.

-- 
Bye, Peter Korsgaard
