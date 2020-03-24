From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 24 Mar 2020 22:50:32 +0100
Subject: [Buildroot] [PATCH 3/8] package/python3-regex: add special
 package variant for the host build
In-Reply-To: <20200323104909.16765-3-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-3-yegorslists@googlemail.com>
Message-ID: <8bb7f566-1193-38c0-0e07-ac81ec6d82d7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

Le 23/03/2020 ? 11:49, yegorslists at googlemail.com a ?crit?:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Needed to build mongodb.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python3-regex/python3-regex.hash |  1 +
>  package/python3-regex/python3-regex.mk   | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 120000 package/python3-regex/python3-regex.hash
>  create mode 100644 package/python3-regex/python3-regex.mk
> 
> diff --git a/package/python3-regex/python3-regex.hash b/package/python3-regex/python3-regex.hash
> new file mode 120000
> index 0000000000..274f4dc277
> --- /dev/null
> +++ b/package/python3-regex/python3-regex.hash
> @@ -0,0 +1 @@
> +../python-regex/python-regex.hash
> \ No newline at end of file
> diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
> new file mode 100644
> index 0000000000..a2f67a144a
> --- /dev/null
> +++ b/package/python3-regex/python3-regex.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python3-regex
> +#
> +################################################################################
> +
> +# Please keep in sync with
> +# package/python-regex/python-regex.mk
> +PYTHON3_REGEX_VERSION = 2020.2.20
> +PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
> +PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/e8/76/8ac7f467617b9cfbafcef3c76df6f22b15de654a62bea719792b00a83195
> +PYTHON3_REGEX_SETUP_TYPE = setuptools
> +PYTHON3_REGEX_LICENSE = CNRI-Python
> +HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
> +HOST_PYTHON3_REGEX_NEEDS_HOST_PYTHON = python3

I don't think we should continue to add more python3 packages to provide host
python3 modules. Titouan what is the status of python2 removal ?

Best regards,
Romain

> +
> +$(eval $(host-python-package))
> 
