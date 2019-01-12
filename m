From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 17:51:21 +0100
Subject: [Buildroot] [PATCH 1/3] package/gnu-efi: get rid of patch
In-Reply-To: <20190111100111.17867-1-peter@korsgaard.com>
References: <20190111100111.17867-1-peter@korsgaard.com>
Message-ID: <20190112175121.1d01ae7e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 11:01:09 +0100, Peter Korsgaard wrote:
> Pass TARGET_CONFIGURE_OPTS in the environment instead of on the make command
> line, so 'CFLAGS +=' does the right thing in the Makefile without patching.
> 
> TARGET_CONFIGURE_OPTS includes TARGET_MAKE_ENV, so drop that.
> 
> This does require us to pass CROSS_COMPILE to ensure the native tools are
> not used though.
> 
> Add a GNU_EFI_MAKE_OPTS and use in both the build and install steps, instead
> of repeating the various arguments.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...S-CPPFLAGS-to-be-completed-from-the-envir.patch | 103 ---------------------
>  package/gnu-efi/gnu-efi.mk                         |  15 +--
>  2 files changed, 8 insertions(+), 110 deletions(-)
>  delete mode 100644 package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
