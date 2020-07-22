From: DO <hi@senzilla.io>
Date: Wed, 22 Jul 2020 08:03:12 +0000
Subject: [Buildroot] [PATCH 1/1] boot/optee-os: Depend on host-python3
In-Reply-To: <20200720094645.5bb9c7ee@windsurf.home>
References: <20200719190244.30172-1-hi@senzilla.io>
 <20200720094645.5bb9c7ee@windsurf.home>
Message-ID: <qb4o-mMj9icXzr_K2o6uLvzXHjVYazjK_rfBs3A3RhnCWhP2yqU1bdBbViqJD_IWDRRfnRoq1fID0PucW2kDlF6DHMGfu9wJnXvVqg_Lh-I=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> If the scripts in OP-TEE do need python3, why don't they use it
> explicitly ?

Good question! The hashbangs in all their Python scripts
use "/usr/bin/env python3" but that's about as much build-time
enforcement there is on Python 3. The maintainers seem happy about
the upstream patch which enable more explicit control of the specific
interpreter used.

> > depends on BR2_ARM_CPU_ARMV8A || BR2_ARM_CPU_ARMV7A
> >
> > -   select BR2_PACKAGE_PYTHON3
>
> This is clearly annoying as it brings the python3 interpreter on the
> target, which clearly isn't a dependency of OP-TEE, so we definitely
> don't want that.

Addressed this in the new v2 series.


> Unless the OP-TEE scripts are changed to use python3, you will have to
> use CFG_PYTHON="$(HOST_DIR)/bin/python3" here.
>
> However, when you'll drop "select BR2_PACKAGE_PYTHON3", it means that
> python3 will no longer be the default host Python interpreter. And
> therefore, if you want to have host-python-pycryptodomex and
> host-python-pyelftools guaranteed to be installed for Python3, you have
> to use host-python3-pyelftools (which exists) and
> host-python3-pycryptodomex (which doesn't exist, you'll have to create
> it).

Addressed this in the new v2 series.

I marked this patch as superseded in Patchwork.



Cheers

Dick Olsson
