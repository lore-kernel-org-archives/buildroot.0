From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:28:31 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: upgrade to v0.8.2 and expand
 architecture support
In-Reply-To: <1454599563-8296-1-git-send-email-casantos@datacom.ind.br>
References: <1454593238-5352-1-git-send-email-casantos@datacom.ind.br>
 <1454599563-8296-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160205232831.029063f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Santos,

On Thu,  4 Feb 2016 13:26:03 -0200, Carlos Santos wrote:
> When libbsd still supported uClibc as a C library, we added the architecture
> exclusions because uClibc's a.out.h includes linux/a.out.h. The latter only
> exists for the specified architectures.
> 
> However, glibc doesn't include linux/a.out.h, it instead has its own
> implementation and it adds a flag to indicate if a.out is supported on this
> architecture or not.
> 
> Since libbsd currently only supports glibc-based toolchains, the architecture
> exclusions are no longer valid.
> 
> On microblaze, the build still fails, but this time because of ELF support.
> libbsd explicitly handles architectures and microblaze is not one of them (see
> local-elf.h).
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/libbsd/Config.in   | 6 ++----
>  package/libbsd/libbsd.hash | 2 +-
>  package/libbsd/libbsd.mk   | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
