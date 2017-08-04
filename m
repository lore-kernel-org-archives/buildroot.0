From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 4 Aug 2017 07:21:21 +0200
Subject: [Buildroot] [PATCH 1/1] python-cryptography: bump to version
	2.0.2
In-Reply-To: <20170804012907.8668-1-Adamduskett@outlook.com>
References: <20170804012907.8668-1-Adamduskett@outlook.com>
Message-ID: <CAGm1_ks_p0ShG0wRJaq6=OfWgD8LNpFfKMFaUTnkwE6RorPoGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Fri, Aug 4, 2017 at 3:29 AM, Adam Duskett <aduskett@gmail.com> wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/python-cryptography/python-cryptography.hash | 4 ++--
>  package/python-cryptography/python-cryptography.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
> index a1162cf88..51ca6cb8c 100644
> --- a/package/python-cryptography/python-cryptography.hash
> +++ b/package/python-cryptography/python-cryptography.hash
> @@ -1,3 +1,3 @@
>  # md5 from https://pypi.python.org/pypi/cryptography/json, sha256 locally computed
> -md5 fade66de437392ed1ba6980768626204 cryptography-1.7.2.tar.gz
> -sha256 878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9 cryptography-1.7.2.tar.gz
> +md5 170fd846e78a4603febf40d55b605301 cryptography-2.0.2.tar.gz
> +sha256 3780b2663ee7ebb37cb83263326e3cd7f8b2ea439c448539d4b87de12c8d06ab cryptography-2.0.2.tar.gz
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 5373da820..69b568cd5 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_CRYPTOGRAPHY_VERSION = 1.7.2
> +PYTHON_CRYPTOGRAPHY_VERSION = 2.0.2
>  PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
> -PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/99/df/71c7260003f5c469cec3db4c547115df39e9ce6c719a99e067ba0e78fd8a
> +PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/0a/23/ffee389a45f752dc745706cdb2d354b91ddb71594506fac45236cf67af49
>  PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
>  PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
>  PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD

Have you tried to execute this example [1]? It throws following error:

# python
Python 3.6.1 (default, Aug  1 2017, 08:53:45)
[GCC 6.3.1 20170109] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from cryptography.fernet import Fernet
>>> key = Fernet.generate_key()
>>> f = Fernet(key)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python3.6/site-packages/cryptography/fernet.py", line
32, in __init__
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/backends/__init__.py",
line 15, in default_backend
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/backends/openssl/__init__.py",
line 7, in <module>
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/backends/openssl/backend.py",
line 53, in <module>
  File "usr/lib/python3.6/site-packages/cryptography/hazmat/bindings/openssl/binding.py",
line 13, in <module>
ImportError: /usr/lib/python3.6/site-packages/cryptography/hazmat/bindings/_openssl.abi3.so:
undefined symbol: pthread_atfork
>>>

So far I have no idea why it happens. Python is compiled with
pthread_atfork and I'm using Linaro ARM 2017.02 toolchain.

And cryptography dependencies have changed. I'll send an RFC patch.

[1] https://github.com/pyca/cryptography/blob/master/README.rst

Yegor
