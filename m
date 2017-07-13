From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 13 Jul 2017 10:25:13 +0200
Subject: [Buildroot] [PATCH 5/8] python-json-schema-validator: needs
 versiontools on the host
In-Reply-To: <20170712162801.31131-6-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
 <20170712162801.31131-6-thomas.petazzoni@free-electrons.com>
Message-ID: <CAGm1_kvtMzM8Qv3B9fnLpnxcFw1t0wV9yVTudEauF-r8SEb4HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 12, 2017 at 6:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> python-json-schema-validator does not need versiontools on the target,
> but only on the host, as it's listed in setup_requires in setup.py.
>
> This was not noticed so far because host Python interpreter is started
> with a PYTHONPATH that contains a directory with target Python
> packages, so versiontools was found there. But as we are about to fix
> PYTHONPATH to no longer include such a directory,
> python-json-schema-validator would fail due to versiontools being
> missed on the host.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-json-schema-validator/Config.in                       | 1 -
>  package/python-json-schema-validator/python-json-schema-validator.mk | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/python-json-schema-validator/Config.in b/package/python-json-schema-validator/Config.in
> index dbc5328..e50e8ee 100644
> --- a/package/python-json-schema-validator/Config.in
> +++ b/package/python-json-schema-validator/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
>         bool "python-json-schema-validator"
> -       select BR2_PACKAGE_PYTHON_VERSIONTOOLS
>         help
>           JSON Schema Validator
>
> diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
> index 6accbd6..c0a335c 100644
> --- a/package/python-json-schema-validator/python-json-schema-validator.mk
> +++ b/package/python-json-schema-validator/python-json-schema-validator.mk
> @@ -9,6 +9,6 @@ PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA
>  PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
>  PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
>  PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
> -PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = python-versiontools
> +PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = host-python-versiontools
>
>  $(eval $(python-package))
> --
> 2.9.4
>
