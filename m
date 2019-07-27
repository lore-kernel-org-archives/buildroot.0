From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 26 Jul 2019 23:08:23 -0300
Subject: [Buildroot] [PATCH 2/2] package/python-fire: bump to version
 0.2.0
In-Reply-To: <20190726191041.1184-2-asafka7@gmail.com>
References: <20190726191041.1184-1-asafka7@gmail.com>
 <20190726191041.1184-2-asafka7@gmail.com>
Message-ID: <CAJ4jsadPrujha6A1Kh3Pg1edriOzWoFOvyady2wc9XXJKgedSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 26, 2019 at 4:10 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-fire/Config.in        | 1 +
>  package/python-fire/python-fire.hash | 4 ++--
>  package/python-fire/python-fire.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-fire/Config.in b/package/python-fire/Config.in
> index 2c6e55ab6b..9c816b0fd0 100644
> --- a/package/python-fire/Config.in
> +++ b/package/python-fire/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_FIRE
>         bool "python-fire"
>         select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_TERMCOLOR # runtime
>         help
>           A library for automatically generating command line
>           interfaces.
> diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
> index d6304369d5..6c48950b7a 100644
> --- a/package/python-fire/python-fire.hash
> +++ b/package/python-fire/python-fire.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fire/json
> -md5    44c51c634b61acc7ed42a413a64de38a  fire-0.1.3.tar.gz
> -sha256 c299d16064ff81cbb649b65988300d4a28b71ecfb789d1fb74d99ea98ae4d2eb  fire-0.1.3.tar.gz
> +md5    dccf1cbd740146d52d9896e4a5ba673e  fire-0.2.0.tar.gz
> +sha256 cdae28ea728d6cad487c900d534426d2cd09ddd2993287a885ff7c8accb097c8  fire-0.2.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256 a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
> diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
> index bdb5ee191c..2573a577db 100644
> --- a/package/python-fire/python-fire.mk
> +++ b/package/python-fire/python-fire.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_FIRE_VERSION = 0.1.3
> +PYTHON_FIRE_VERSION = 0.2.0
>  PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
> -PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/5a/b7/205702f348aab198baecd1d8344a90748cb68f53bdcd1cc30cbc08e47d3e
> +PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/40/6e/48cf0cffb7bf0bb58746bff99ed2d1a2769a32c4d74c06f988eb3e554f86
>  PYTHON_FIRE_SETUP_TYPE = setuptools
>  PYTHON_FIRE_LICENSE = Apache-2.0
>  PYTHON_FIRE_LICENSE_FILES = LICENSE
> --
> 2.20.1

Must select BR2_PACKAGE_PYTHON_ENUM

# python
Python 2.7.16 (default, Jul 26 2019, 21:32:02)
[GCC 8.2.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import fire
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python2.7/site-packages/fire/__init__.py", line 21, in <module>
  File "usr/lib/python2.7/site-packages/fire/core.py", line 65, in <module>
  File "usr/lib/python2.7/site-packages/fire/completion.py", line 25,
in <module>
  File "usr/lib/python2.7/site-packages/fire/inspectutils.py", line
22, in <module>
  File "usr/lib/python2.7/site-packages/fire/docstrings.py", line 61,
in <module>
ImportError: No module named enum

--
Carlos Santos <unixmania@gmail.com>
