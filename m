From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Oct 2019 18:15:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-crossbar: bump version
 to 19.10.1
In-Reply-To: <20191019145111.32571-1-mc5686@mclink.it>
References: <20191019145111.32571-1-mc5686@mclink.it>
Message-ID: <CALFsTFXxK=aZohHxqDO=jT11hNJvEUK48YUOSUrB_L3yHYpm7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 19, 2019 at 5:51 PM Mauro Condarelli <mc5686@mclink.it> wrote:
>
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/python-crossbar/python-crossbar.hash | 4 ++--
>  package/python-crossbar/python-crossbar.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
> index f956dc27e1..d2de09009d 100644
> --- a/package/python-crossbar/python-crossbar.hash
> +++ b/package/python-crossbar/python-crossbar.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/crossbar/json
> -md5    462a204da3c776cbb770b98f9047e8e7  crossbar-19.1.2.tar.gz
> -sha256 269d534a65c136a5c952a6accccf256f457569f731ee65e201e5a14e69db471a  crossbar-19.1.2.tar.gz
> +md5    67edd9ab6a2f99d0028844cea6f30045  crossbar-19.10.1.tar.gz
> +sha256 2107fe005f056dfa2702fc72fa2e2c17caef0e972989d3518734081007766483  crossbar-19.10.1.tar.gz
>  # Locally computed
>  sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  LICENSE
> diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
> index 064d2d92b6..de37a5c21f 100644
> --- a/package/python-crossbar/python-crossbar.mk
> +++ b/package/python-crossbar/python-crossbar.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_CROSSBAR_VERSION = 19.1.2
> +PYTHON_CROSSBAR_VERSION = 19.10.1
>  PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
> -PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/86/19/54c7bd9da1ac70643b9ae7d3d4592a73391f62fcb376fcd30f8328c1c5ce
> +PYTHON_CROSSBAR_SITE = https://files.pythonhosted.org/packages/47/9e/c67e1d20e20e477146221329cd5f0bbf256fc49fb66d26f9fc89bb6f79ae
>  PYTHON_CROSSBAR_LICENSE = AGPL-3.0
>  PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
>  PYTHON_CROSSBAR_SETUP_TYPE = setuptools
> --
> 2.24.0.rc0
>

It seems like the current dependency list of crossbar contains some
packages which aren't listed in our Config.in:
https://github.com/crossbario/crossbar/blob/master/requirements-min.txt
Some of them can be easily selected (urllib3, bcrypt, wsaccel), but
the others are not currently in Buildroot (like zlmdb),
I guess our dependency list should be updated accordingly.

Regards,
Asaf.
