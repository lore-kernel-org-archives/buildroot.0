From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:14:22 +0200
Subject: [Buildroot] [PATCH 1/3] package/llvm: bump to version 9.0.0
In-Reply-To: <20191005170412.4077137-1-romain.naour@gmail.com>
References: <20191005170412.4077137-1-romain.naour@gmail.com>
Message-ID: <20191005221422.12a6f280@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  5 Oct 2019 19:04:10 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The github download url doesn't contain the llvm 9.0.0 archive,
> so use the previous url.
> 
> Since v9.0.0, it was relicensed to the Apache License 2.0 with
> LLVM Exceptions. Update the license file hash.
> 
> Use host-python3 to build llvm [1]
> 
> Disable explicitely Z3 support since there is no such package
> in Buildroot.
> 
> [1] https://github.com/llvm-mirror/llvm/commit/213d1037e9f8b837d61eda9668112d17b0f956d0
> 
> See:
> http://releases.llvm.org/9.0.0/docs/ReleaseNotes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/llvm/llvm.hash |  4 ++--
>  package/llvm/llvm.mk   | 15 +++++++++------
>  2 files changed, 11 insertions(+), 8 deletions(-)

Series applied. To be honest, on the llvm patch, I was not sure about
forcing host-python3. Indeed, LLVM supports both Python 2 and Python 3,
and normally in such cases, we do something like this:

ifeq ($(BR2_PACKAGE_PYTHON3),y)
FOO_DEPENDENCIES += host-python3
else
FOO_DEPENDENCIES += host-python
endif

So that we re-use the same host-python as the one already being built
by Buildroot, if any. But I wasn't sure it was really useful in this
specific case, LLVM anyway takes ages to build.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
