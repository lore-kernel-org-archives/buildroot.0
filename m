From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:38:10 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-external: libatomic
 should also be copied for musl toolchains
In-Reply-To: <20180116224808.1630-1-thomas.petazzoni@free-electrons.com>
References: <20180116224808.1630-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20180117223810.1863ea2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 23:48:08 +0100, Thomas Petazzoni wrote:
> libatomic, like libgcc_s, is provided by gcc, so there is no reason to
> copy it over only for the glibc and uclibc cases, it should also be
> copied for the musl case. Without this, a program linked with
> libatomic on a musl system will fail to run due to the missing
> library.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
