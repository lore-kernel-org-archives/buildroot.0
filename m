From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Mar 2016 09:02:34 +0100
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
	staging
In-Reply-To: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LWRgoW3rGLNvUCcd3NDSYaq28paXXKgwPCntbvfvQs+PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 12, 2016 at 8:20 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> As discussed on the Buildroot developer days, Buildroot installs some libraries
> in a different location in target than in staging. This is specifically seen for
> libstdc++ and libatomic.
>
> This patch series tackles that problem and performs related cleanup.
>
>
>
> Thomas De Schampheleire (5):
>   toolchain-external: blackfin: install FDPIC libraries also to staging
>   toolchain-external: remove unused calculation of ARCH_SUBDIR
>   toolchain-external: extract installation of gdbserver to separate
>     define
>   toolchain-external: align library locations in target and staging dir
>   toolchain-external: unify LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS
>
>  package/glibc/glibc.mk                             |  2 +-
>  toolchain/helpers.mk                               | 57 ++---------------
>  toolchain/toolchain-external/Config.in             |  3 +-
>  toolchain/toolchain-external/toolchain-external.mk | 71 ++++++++++------------
>  4 files changed, 40 insertions(+), 93 deletions(-)


It occurred to me that there has not been any feedback on this
toolchain-related patch series :-)
Anyone could spare some time to look at it?

Thanks,
Thomas
