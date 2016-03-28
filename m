From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 22:28:56 +0200
Subject: [Buildroot] [PATCH 1/1] python-m2crypto:bump to 0.23.0
In-Reply-To: <1459161916-21579-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
 (Nitin Mendiratta's message of "Mon, 28 Mar 2016 16:15:16 +0530")
References: <1459161916-21579-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
Message-ID: <877fgm9wjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nitin" == Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com> writes:

 > Signed-off-by: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>
 > ---

 > diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
 > index 0416957..820100f 100644
 > --- a/package/python-m2crypto/python-m2crypto.mk
 > +++ b/package/python-m2crypto/python-m2crypto.mk
 > @@ -4,12 +4,16 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_M2CRYPTO_VERSION = 0.22.5
 > +PYTHON_M2CRYPTO_VERSION = 0.23.0
 >  PYTHON_M2CRYPTO_SITE = http://pypi.python.org/packages/source/M/M2Crypto
 >  PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
 >  PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 >  HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 
 > +# The license is a BSD-style license
 > +PYTHON_M2CRYPTO_LICENSE = BSD

License is actually MIT, E.G. 'old style with legal disclamer 3':

https://fedoraproject.org/wiki/Licensing:MIT?rd=Licensing/MIT

> +PYTHON_M2CRYPTO_LICENSE_FILE = LICENSE

The variable is called _LICENSE_FILES and the file is called LICENCE.

Committed with this fixed, thanks.

I also see that 0.24.0 has been released, so I've added a commit to bump
the version.

-- 
Bye, Peter Korsgaard
