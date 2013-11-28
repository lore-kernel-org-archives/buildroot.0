From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 19:23:05 +0100
Subject: [Buildroot] [PATCHv2] e2fsprogs: Install libraries to staging
In-Reply-To: <1385661237-13975-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1385661237-13975-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20131128192305.154ec187@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Nystr?m,

On Thu, 28 Nov 2013 18:53:57 +0100, Daniel Nystr?m wrote:
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 0670c74..31e671b 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -8,6 +8,8 @@ E2FSPROGS_VERSION = 1.42.8
>  E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
>  E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
>  E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
> +E2FSPROGS_INSTALL_STAGING = YES
> +E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs

I must say I'd like to know *why* the normal "install" rule does not
install the .pc file. It seems to install everything else, including
the libraries, but not the .pc file, for some reason.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
