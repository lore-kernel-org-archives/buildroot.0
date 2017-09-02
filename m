From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:53:45 +0200
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version
 R-2.15.3
In-Reply-To: <1504248347-24424-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1504248347-24424-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170902225345.0c6797b2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Sep 2017 08:45:47 +0200, Angelo Compagnucci wrote:

> -PYTHON_WEB2PY_DEPENDENCIES = python python-pydal host-python-pydal
> +PYTHON_WEB2PY_DEPENDENCIES = python-pydal host-python-pydal

We want to keep a dependency on Python here I believe, because this
package is not using python-package, but generic-package. So perhaps we
should do like python-package is doing, i.e:

$(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)

Yegor, what do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
