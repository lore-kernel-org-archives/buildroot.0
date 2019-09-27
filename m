From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:41:41 +0200
Subject: [Buildroot] [PATCH 01/08] package/python-django-enumfields: new
 package
In-Reply-To: <20190804011631.86261-2-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-2-aduskett@gmail.com>
Message-ID: <20190927234141.49ec9355@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 21:16:24 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This package lets you use real Python (PEP435-style) enums with Django.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-django-enumfields/Config.in         |  6 ++++++
>  .../python-django-enumfields.hash                  |  5 +++++
>  .../python-django-enumfields.mk                    | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-django-enumfields/Config.in
>  create mode 100644 package/python-django-enumfields/python-django-enumfields.hash
>  create mode 100644 package/python-django-enumfields/python-django-enumfields.mk

The setup.py contains:

    extras_require={
        ":python_version<'3.4'": ['enum34'],
    },

So, I've added:

+       select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime

to the Config.in file, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
