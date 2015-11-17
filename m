From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 23:16:34 +0100
Subject: [Buildroot] [PATCH v3] python3: add patch to fix PEP 3147 issue
 with automake built packages
In-Reply-To: <1447516470-27853-1-git-send-email-cvubrugier@fastmail.fm>
References: <1447516470-27853-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20151117231634.6b4366e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Sat, 14 Nov 2015 16:54:30 +0100, Christophe Vu-Brugier wrote:
> Packages built with automake use a `py-compile` helper to byte-compile
> Python source files. This script uses the "py_compile" module from the
> standard library. In turn, the compile() function in the "py_compile"
> module invokes the cache_from_source() function provided by importlib.
> 
> This commit adds a new patch named "020-importlib-no-pep3147.patch"
> that changes cache_from_source() and source_from_cache() in importlib
> to get rid of the "__pycache__" directory.
> 
> This commit fixes the following import error in kmod when the module
> is built for Python 3:
> 
>   >>> from kmod import Kmod
>   Traceback (most recent call last):
>     File "<stdin>", line 1, in <module>
>   ImportError: cannot import name 'Kmod'
> 
> Moreover, this commit removes two patches that are no longer necessary
> since modifying cache_from_source() and source_from_cache() disables
> PEP 3147 for the standard library and distutils / setuptools.
> 
>  * 004-old-stdlib-cache.patch
>  * 016-distutils-no-pep3147.patch
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes since v2:
>  * prevent importlib.h regeneration to fix an issue reported by Thomas
>    Petazzoni

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
