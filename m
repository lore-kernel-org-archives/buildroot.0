From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 04 Aug 2017 22:07:03 +0200
Subject: [Buildroot] [PATCH 00/10] libssl: new package
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <7o0f5ex2tj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 04 Aug 2017 14:55:11 -0400 schrieb Adam Duskett:

> After spending over 20 hours building, testing, and compiling all of the
> packages currently in Buildroot that select or depend on OpenSSL against
> libressl, I believe it would be a good fit for a Virtual package.

Hi Adam,

tested your patch series on both master and next branch and saw these 
errors after "make menuconfig":

package/libssl/Config.in:8:error: recursive dependency detected!
package/libssl/Config.in:8:	choice <choice> contains symbol 
BR2_PACKAGE_LIBSSL
package/libssl/Config.in:1:	symbol BR2_PACKAGE_LIBSSL is selected by 
BR2_PACKAGE_PYTHON_SSL
package/python/Config.in:76:	symbol BR2_PACKAGE_PYTHON_SSL is selected 
by BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
package/python-cryptography/Config.in:1:	symbol 
BR2_PACKAGE_PYTHON_CRYPTOGRAPHY depends on BR2_PACKAGE_OPENSSL
package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is part of 
choice <choice>

Regards, Bernd
