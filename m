From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:16:55 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/python-pyyaml: add a
 host-python3 dependency for host variant
In-Reply-To: <20191026152943.122511-4-titouan.christophe@railnova.eu>
References: <20191026152943.122511-1-titouan.christophe@railnova.eu>
 <20191026152943.122511-4-titouan.christophe@railnova.eu>
Message-ID: <20191026191655.0fd012d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yegor, Asaf, your input is welcome.

On Sat, 26 Oct 2019 17:29:42 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> host-python-pyyaml on host-python3 is needed for mongodb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [Titouan: Fix comment line contains UTF-8 characters]
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/python-pyyaml/python-pyyaml.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
> index 165a938f11..e74405c065 100644
> --- a/package/python-pyyaml/python-pyyaml.mk
> +++ b/package/python-pyyaml/python-pyyaml.mk
> @@ -13,5 +13,8 @@ PYTHON_PYYAML_LICENSE_FILES = LICENSE
>  PYTHON_PYYAML_DEPENDENCIES = libyaml
>  HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
>  
> +# Needed to build mongodb
> +HOST_PYTHON_PYYAML_NEEDS_HOST_PYTHON = python3

I'm a bit worried about this. It means that if BR2_PACKAGE_PYTHON=y,
then the default host python is host-python (i.e Python 2.x), and
therefore all host Python modules are installed for Python 2.x...
except now this pyyaml module.

It doesn't sound good. I think our solution in this case is to add a
separate python3-pyyaml package, like we have for python3-mako and
python3-setuptools.

My comment also applies to PATCH 1/4 on this series, adding a host
variant of python-psutil, but making it available only for Python 3.x.

Yegor, Asaf, I would very much welcome your feedback on this topic.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
