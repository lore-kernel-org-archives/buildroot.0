From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 21 Sep 2018 18:32:51 +0300
Subject: [Buildroot] [PATCH 1/1] python-django: bump version to 2.1.1
In-Reply-To: <20180921150825.1986-1-aduskett@gmail.com>
References: <20180921150825.1986-1-aduskett@gmail.com>
Message-ID: <CALFsTFW2-B2wjeJ6Fmv=wUWPNOUGQgPhHE8ZV-zSA+FojgznDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I don't use django regularly, but it seems django needs pytz (
https://github.com/django/django/blob/2.1.1/setup.py).
Moreover, django has dropped support in python2 since 2.0 (
https://docs.djangoproject.com/en/dev/faq/install/#what-python-version-can-i-use-with-django),
so I guess the definition in Config.in should be changed to depend
on BR2_PACKAGE_PYTHON3.

Asaf.

On Fri, Sep 21, 2018 at 6:08 PM Adam Duskett <aduskett@gmail.com> wrote:

> Tested with python3.7
> Fixes
> http://autobuild.buildroot.net/results/7ea/7ea58b0909ea1871b3735f8671686ce0eece2e7c/build-end.log
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/python-django/python-django.hash | 7 ++++---
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-django/python-django.hash
> b/package/python-django/python-django.hash
> index bc7aed9479..c472e69500 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,3 +1,4 @@
> -# From https://www.djangoproject.com/m/pgp/Django-1.11.15.checksum.txt
> -sha256 b18235d82426f09733d2de9910cee975cf52ff05e5f836681eb957d105a05a40
> Django-1.11.15.tar.gz
> -sha256 b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669
> LICENSE
> +# # From https://pypi.org/pypi/Django/json
> +md5 06e7c47864e0a38cd99ddabb152b9e9b Django-2.1.1.tar.gz
> +sha256  e1cc1cd6b658aa4e052f5f2b148bfda08091d7c3558529708342e37e4e33f72c
> Django-2.1.1.tar.gz
> +sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669
> LICENSE
> diff --git a/package/python-django/python-django.mk
> b/package/python-django/python-django.mk
> index ae604dbc97..151f5d86c2 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>
>  ################################################################################
>
> -PYTHON_DJANGO_VERSION = 1.11.15
> +PYTHON_DJANGO_VERSION = 2.1.1
>  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE =
> https://files.pythonhosted.org/packages/43/b5/b44286e56a5211d37b4058dcd5e62835afa5ce5aa6a38b56bd04c0d01cbc
> +PYTHON_DJANGO_SITE =
> https://files.pythonhosted.org/packages/14/c8/b6f5c67cf34ae7586258af110e53657da671325b146fcc67ac64a4daace5
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE
>  PYTHON_DJANGO_SETUP_TYPE = setuptools
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180921/8e17de06/attachment.html>
