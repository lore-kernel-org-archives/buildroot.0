From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Jul 2017 11:11:07 +0100
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <20170727094528.10745-1-joerg.krause@embedded.rocks>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
Message-ID: <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg, maintainers,

shouldn't we add a "package/pkg-meson.mk" file and then use "$(eval
$(meson-package))" for Meson packages?

Vincent

On 27/07/17 10:45, J?rg Krause wrote:
> Last year, Eric Le Bihan already proposed patches to support the Meson build
> system [1], but the patches were rejected, as no package in Buildroot
> required a Meson build.
> 
> This has changed, as the libmpdclient package has switched from autotools to
> Meson.
> 
> Therefore, the patches from Eric are resubmitted with some changes as suggested
> by Yann E. Morin.
> 
> [1] http://patchwork.ozlabs.org/patch/646685/
> 
> Eric Le Bihan (2):
>   meson: new package
>   docs/manual: document meson-based packages
> 
> J?rg Krause (1):
>   libmpdclient: bump to version 2.13
> 
>  docs/manual/adding-packages-meson.txt   | 80 +++++++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt         |  2 +
>  package/libmpdclient/libmpdclient.hash  |  4 +-
>  package/libmpdclient/libmpdclient.mk    | 26 +++++++++--
>  package/meson/cross-compilation.conf.in | 15 +++++++
>  package/meson/meson.hash                |  2 +
>  package/meson/meson.mk                  | 30 +++++++++++++
>  7 files changed, 154 insertions(+), 5 deletions(-)
>  create mode 100644 docs/manual/adding-packages-meson.txt
>  create mode 100644 package/meson/cross-compilation.conf.in
>  create mode 100644 package/meson/meson.hash
>  create mode 100644 package/meson/meson.mk
> 
