From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Apr 2017 19:10:31 +0200
Subject: [Buildroot] BR patch: python-json-schema-validator,
 python-versiontools: Add BR2_PACKAGE_PYTHON3 as option to fulfill
 dependency.
In-Reply-To: <CAALS7HaOb8RUJi1k8M_F=k9Dg3vnAP+XDtvF3LpYBq3HCsdD7Q@mail.gmail.com>
References: <CAALS7HaOb8RUJi1k8M_F=k9Dg3vnAP+XDtvF3LpYBq3HCsdD7Q@mail.gmail.com>
Message-ID: <CAGm1_ktiQdAZiDj=8Yjiqt_160mJ+jAbOR5XUmnKR-vDU5arDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Wed, Apr 19, 2017 at 7:07 PM, Matthew Carruth <carruthm@gmail.com> wrote:
> From d447ce24416226688e7c285308ad3e93b3b3fe61 Mon Sep 17 00:00:00 2001
> From: Matthew Carruth <carruthm@gmail.com>
> Date: Wed, 19 Apr 2017 09:53:09 -0700
> Subject: [PATCH] python-json-schema-validator, python-versiontools: Add
>  BR2_PACKAGE_PYTHON3 as option to fulfill dependency.
>
> Both packages above depended solely on BR2_PACKAGE_PYTHON but have valid
> python3 versions. The lack of python3 in the depends on rendered a
> python3-only project unable to use json-schema-validator. Versiontools comes
> along because json-schema-validator requires it and this is a minor, atomic
> change.
>
> Signed-off-by: Matthew Carruth <carruthm@gmail.com>
> ---
>  package/python-json-schema-validator/Config.in | 2 +-
>  package/python-versiontools/Config.in          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/python-json-schema-validator/Config.in
> b/package/python-json-schema-validator/Config.in
> index 6ae1eb1..8831a1b 100644
> --- a/package/python-json-schema-validator/Config.in
> +++ b/package/python-json-schema-validator/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
>   bool "python-json-schema-validator"
> - depends on BR2_PACKAGE_PYTHON
> + depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

just remove depends on BR2_PACKAGE_PYTHON, no need to add or dependency

>   select BR2_PACKAGE_PYTHON_VERSIONTOOLS
>   help
>    JSON Schema Validator
> diff --git a/package/python-versiontools/Config.in
> b/package/python-versiontools/Config.in
> index cb260c1..838e236 100644
> --- a/package/python-versiontools/Config.in
> +++ b/package/python-versiontools/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PYTHON_VERSIONTOOLS
>   bool "python-versiontools"
> - depends on BR2_PACKAGE_PYTHON
> + depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

same here

Yegor

>   help
>    Smart replacement for plain tuple used in __version__.
>
> --
> 2.9.3
>
