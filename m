From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 1 Oct 2014 17:07:07 +0200
Subject: [Buildroot] [PATCH 3/6] python-pyparsing: bump to version 2.0.2,
 enable on Python 3
In-Reply-To: <1412113141-17650-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1412113141-17650-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141001170707.34683a72@grp-cvubrugier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 30 Sep 2014 23:38:58 +0200, Thomas Petazzoni wrote :
> This commit bumps the pyparsing package to version 2.0.2, and
> therefore enables it usage with Python 3.

Tested with Python 3 on an x86_64 target:

  / # python
  Python 3.4.1 (default, Oct  1 2014, 16:25:09) 
  [GCC 4.7.3] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>> import pyparsing

Tested-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>


> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/python-pyparsing/Config.in           | 2 +-
>  package/python-pyparsing/python-pyparsing.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
> index 49a474b..0408e5e 100644
> --- a/package/python-pyparsing/Config.in
> +++ b/package/python-pyparsing/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PYPARSING
>  	bool "python-pyparsing"
> -	depends on BR2_PACKAGE_PYTHON
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  	help
>  	  The pyparsing module is an alternative approach to creating and
>  	  executing simple grammars, vs. the traditional lex/yacc approach,
> diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
> index 07dda58..82a907b 100644
> --- a/package/python-pyparsing/python-pyparsing.mk
> +++ b/package/python-pyparsing/python-pyparsing.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYPARSING_VERSION         = 1.5.6
> +PYTHON_PYPARSING_VERSION         = 2.0.2
>  PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
>  PYTHON_PYPARSING_SITE            = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
>  PYTHON_PYPARSING_LICENSE         = MIT


-- 
Christophe Vu-Brugier
