From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:02:34 +0100
Subject: [Buildroot] [PATCH v3] package/tpm2-tss: fix build without C++
In-Reply-To: <20191223111321.12912-1-unixmania@gmail.com>
References: <20191223111321.12912-1-unixmania@gmail.com>
Message-ID: <20191223210234.4b1765a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Dec 2019 08:13:21 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> C++ is required only for the fuzzing tests but AC_PROG_CXX is included
> by configure.ac even when fuzzing is not enabled (which we don't do on
> Buildroot).
> 
> The patch applied upstream had issues and was reverted[1]. Use a local
> patch to solve the problem temporaryly.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
>     http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
>     http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
>     http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
>     http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
>     http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
>     http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
>     http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
> 
> 1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
> ---
> CC: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1->v2:
> - Use patch from upstream
> Changes v2->v3:
> - Use a local patch, since the upstream change was reverted
> ---
>  ...01-Temporary-fix-for-build-without-C.patch | 44 +++++++++++++++++++
>  package/tpm2-tss/tpm2-tss.mk                  |  2 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch

Having to keep a patch like this forever is not nice, but hopefully so
upstream acceptable solution will be merged at some point. So I've
applied your patch to fix the build failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
