From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 28 Apr 2019 00:09:59 +0200
Subject: [Buildroot] [PATCH] package/python-pytest: new package
In-Reply-To: <1556096379-32178-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556096379-32178-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <8b1274d9-2e63-823b-dfde-fba6b25b337e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jugurtha,

On 24/04/2019 10:59, Jugurtha BELKALEM wrote:
> ---
>  package/python-pytest/Config.in          |  9 +++++++++
>  package/python-pytest/python-pytest.hash |  2 ++
>  package/python-pytest/python-pytest.mk   | 15 +++++++++++++++

 package/Config.in update is missing, so this package cannot be selected.

 Please also add yourself to DEVELOPERS.

>  3 files changed, 26 insertions(+)
>  create mode 100644 package/python-pytest/Config.in
>  create mode 100644 package/python-pytest/python-pytest.hash
>  create mode 100644 package/python-pytest/python-pytest.mk
> 
> diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
> new file mode 100644
> index 0000000..db69027
> --- /dev/null
> +++ b/package/python-pytest/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PYTEST
> +	bool "python-pytest"

 Indentation is incorrect. Please use the check-package tool to verify before
submitting.

> +    help
> +	  The pytest framework makes it easy to write small tests, 
> +	  yet scales to support complex functional testing for 
> +	  applications and libraries.
> +
> +	  https://pypi.org/project/pytest/
> +
> diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
> new file mode 100644
> index 0000000..5e072d7
> --- /dev/null
> +++ b/package/python-pytest/python-pytest.hash
> @@ -0,0 +1,2 @@
> +# sha256 from https://pypi.org/project/pytest/#files
> +sha256 b7802283b70ca24d7119b32915efa7c409982f59913c1a6c0640aacf118b95f5 pytest-4.4.1.tar.gz

 Please also add a hash for the license file.

> diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
> new file mode 100644
> index 0000000..b6cafda
> --- /dev/null
> +++ b/package/python-pytest/python-pytest.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pytest
> +#
> +################################################################################
> +
> +PYTHON_PYTEST_VERSION = 4.4.1
> +PYTHON_PYTEST_SOURCE = pytest-$(PYTHON3_PYTEST_VERSION).tar.gz
> +PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/2b/b1/c9a84f79fc3bad226a9085289da11ecdd9bd2779a2c654195962b37d4110/
> +PYTHON_PYTEST_LICENSE = MIT
> +PYTHON_PYTEST_LICENSE_FILES = LICENSE
> +PYTHON_PYTEST_SETUP_TYPE = setuptools
> +PYTHON_DEPENDENCIES = python3-setuptools-scm

 That package doesn't exist (yet).

 Also, the 'python3' part is suspicious, since this package is supposed to work
both on python2 and python3.

 Also, it sounds like this should be a dependency on the host package rather
than the target package.


 Regards,
 Arnout

> +
> +$(eval $(python-package))
> 
