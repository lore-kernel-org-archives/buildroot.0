From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 08:44:57 +0200
Subject: [Buildroot] [PATCH 2/2] python-numpy: fix make legal-info
 failure
In-Reply-To: <20180910222744.82143-3-giulio.benetti@micronovasrl.com>
References: <20180910222744.82143-1-giulio.benetti@micronovasrl.com>
 <20180910222744.82143-3-giulio.benetti@micronovasrl.com>
Message-ID: <20180911084457.4a6b467b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 00:27:44 +0200, Giulio Benetti wrote:
> Release 1.15.1 tarball doesn't contain all sublibraries license files
> listed in the base LICENSE.txt file.
> This makes python-numpy-legal-info incomplete.
> 
> Add patch to add missing sublibraries license files:
> - numpy/linalg/lapack_lite/LICENSE.txt
> - tools/npy_tempita/license.txt
> and therefore their sha256 into hash file.
> Update also PYTHON_NUMPY_LICENSE adding:
> BSD-2-Clause PSF Apache-2.0 MIT Zlib
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Why is this change titled "fix make legal-info failure" ? PATCH 1/2
does fix a legal-info failure, this one adds more detailed legal
information.


> diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
> index 7c7f446118..9df9f63f06 100644
> --- a/package/python-numpy/python-numpy.hash
> +++ b/package/python-numpy/python-numpy.hash
> @@ -2,3 +2,7 @@
>  sha256	3c1ccce5d935ef8df16ae0595b459ef08a5cdb05aee195ebc04b9d89a72be7fa	numpy-1.15.1.tar.gz
>  # License files, locally calculated
>  sha256	9e85ee1c3f11444243c9b7667721592a01f1cd90cb28ad937ac99f6241d6b685	LICENSE.txt
> +sha256	426a5a484480f57a295db48c2c04f47bb3274752dd82a7fd6541dfa2cb90f641	doc/sphinxext/LICENSE.txt

What about:

  doc/scipy-sphinx-theme/LICENSE.txt

In fact, the main LICENSE.txt itself, has a bug. Look:

"""
Name: Numpydoc
Files: doc/sphinxext/numpydoc/*
License: 2-clause BSD
  For details, see doc/sphinxext/LICENSE.txt

Name: scipy-sphinx-theme
Files: doc/scipy-sphinx-theme/*
License: 3-clause BSD, PSF and Apache 2.0
  For details, see doc/sphinxext/LICENSE.txt
"""

See how the path for the "scipy-spinx-theme" license file is wrong ?

> +PYTHON_NUMPY_LICENSE = BSD-3-Clause BSD-2-Clause PSF Apache-2.0 MIT Zlib

It should be comma-separated.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
