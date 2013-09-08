From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Sep 2013 17:31:10 +0200
Subject: [Buildroot] [RFCv1 03/11] toolchain-external: make ext-tool.mk
 includable in all cases
In-Reply-To: <1378416469-17708-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWNG0FRfahqAoS_h_5t+u0Hgi1qaQfC+kvibytwDUhpYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The ext-tool.mk logic uses the TOOLCHAIN_EXTERNAL_PREFIX variable
> unconditionally, even if the external toolchain is not used. Until now
> this wasn't a problem since ext-tool.mk was only included when the
> external toolchain backend was selected, but the next patches are
> going to include this file unconditionally.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/ext-tool.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index e92afbd..fbcbe6c 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -1,4 +1,3 @@
> -
>  #
>  # This file implements the support for external toolchains, i.e
>  # toolchains that have not been produced by Buildroot itself and that
> @@ -112,8 +111,10 @@ TOOLCHAIN_EXTERNAL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
>  endif
>
>  ifeq ($(TOOLCHAIN_EXTERNAL_DIR),)
> +ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>  # if no path set, figure it out from path
>  TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
> +endif
>  else
>  ifeq ($(BR2_bfin),y)
>  TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
