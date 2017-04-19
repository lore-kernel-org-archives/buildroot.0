From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Apr 2017 23:05:11 +0200
Subject: [Buildroot] python-json-schema-validator,
 python-versiontools: Remove depends on BR2_PACKAGE_PYTHON
In-Reply-To: <CAALS7HacsNUd7wUfKsZDLgwoCoBKVpV5qtZZq61cnH=TduWq2w@mail.gmail.com>
References: <CAALS7HacsNUd7wUfKsZDLgwoCoBKVpV5qtZZq61cnH=TduWq2w@mail.gmail.com>
Message-ID: <CAGm1_ks9bFJyeJ2ORqKf5yY1uV5QVAHh_a7x3A_zSwebSaSgEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 19, 2017 at 7:44 PM, Matthew Carruth <carruthm@gmail.com> wrote:
> From 13ff8c8b88a9b8c6d91c658d52105695bf09ea13 Mon Sep 17 00:00:00 2001
> From: Matthew Carruth <carruthm@gmail.com>
> Date: Wed, 19 Apr 2017 10:39:20 -0700
> Subject: [PATCH] Remove depends on BR2_PACKAGE_PYTHON in 2 packages
>
> python-json-schema-validator, python-versiontools: Remove depends on
> BR2_PACKAGE_PYTHON. Both have valid python3 implementations as well
>
> Signed-off-by: Matthew Carruth <carruthm@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Just forgot to tell, that you should split this patch in two to handle
both packages separately.

Yegor

> ---
>  package/python-json-schema-validator/Config.in | 1 -
>  package/python-versiontools/Config.in          | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/package/python-json-schema-validator/Config.in
> b/package/python-json-schema-validator/Config.in
> index 6ae1eb1..dbc5328 100644
> --- a/package/python-json-schema-validator/Config.in
> +++ b/package/python-json-schema-validator/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
>   bool "python-json-schema-validator"
> - depends on BR2_PACKAGE_PYTHON
>   select BR2_PACKAGE_PYTHON_VERSIONTOOLS
>   help
>    JSON Schema Validator
> diff --git a/package/python-versiontools/Config.in
> b/package/python-versiontools/Config.in
> index cb260c1..d15de1f 100644
> --- a/package/python-versiontools/Config.in
> +++ b/package/python-versiontools/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_PYTHON_VERSIONTOOLS
>   bool "python-versiontools"
> - depends on BR2_PACKAGE_PYTHON
>   help
>    Smart replacement for plain tuple used in __version__.
>
> --
> 2.9.3
>
