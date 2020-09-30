From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 21:56:46 +0200
Subject: [Buildroot] [PATCH] package/python-werkzeug: bump version to
 1.0.1
In-Reply-To: <20200930073204.32070-1-buildroot@heine.tech>
References: <20200930073204.32070-1-buildroot@heine.tech>
Message-ID: <20200930195646.GT11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-09-30 09:32 +0200, Michael Nosthoff via buildroot spake thusly:
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/python-werkzeug/python-werkzeug.hash | 6 +++---
>  package/python-werkzeug/python-werkzeug.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
> index cc90fe140b..1d6de8a0c7 100644
> --- a/package/python-werkzeug/python-werkzeug.hash
> +++ b/package/python-werkzeug/python-werkzeug.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/werkzeug/json
> -md5	5b23b4953efc4f52b1d0b33af6f7cd2d  Werkzeug-0.16.0.tar.gz
> -sha256	7280924747b5733b246fe23972186c6b348f9ae29724135a6dfc1e53cea433e7  Werkzeug-0.16.0.tar.gz
> +md5  5d499cfdd30de5d9c946994783772efd  Werkzeug-1.0.1.tar.gz
> +sha256  6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c  Werkzeug-1.0.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
> +sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
> diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
> index fea25f8ee8..1013f8af80 100644
> --- a/package/python-werkzeug/python-werkzeug.mk
> +++ b/package/python-werkzeug/python-werkzeug.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_WERKZEUG_VERSION = 0.16.0
> +PYTHON_WERKZEUG_VERSION = 1.0.1

It's been pointed out on IRC that "there were a number of breaking
changes in that jump", further pointing to the release notes:

    https://werkzeug.palletsprojects.com/en/1.0.x/changes/#version-1-0-0

We have two packages in Buildroot, that use werkzeug: crossbar and
flask.

Could you investigate how they are both impacted, if at all, by this
bump, please?

Note that your patch has already been applied, and we'd like to know
if we also need to update crossbar or flask, or if we need to revert.

Regards,
Yann E. MORIN.

>  PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
> -PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/5e/fd/eb19e4f6a806cd6ee34900a687f181001c7a0059ff914752091aba84681f
> +PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04
>  PYTHON_WERKZEUG_SETUP_TYPE = setuptools
>  PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
>  PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
