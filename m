From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Aug 2016 15:32:29 +0300
Subject: [Buildroot] [PATCH] barebox: fix ARCH value for arm64
In-Reply-To: <1471000286-50321-1-git-send-email-poggi.raph@gmail.com>
References: <1471000286-50321-1-git-send-email-poggi.raph@gmail.com>
Message-ID: <20160812123229.GL845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Raphael,

On Fri, Aug 12, 2016 at 01:11:26PM +0200, Raphael Poggi wrote:
> Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>
> ---
>  boot/barebox/barebox.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 832297e..b02751d 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -61,6 +61,8 @@ else ifeq ($$(KERNEL_ARCH),x86_64)
>  $(1)_ARCH = x86
>  else ifeq ($$(KERNEL_ARCH),powerpc)
>  $(1)_ARCH = ppc
> +else ifeq ($$(KERNEL_ARCH), arm64)

Redundant space before "arm64".

Also, this is only applicable to version v2016.08.0 that adds initial support 
for aarch64 
(http://lists.infradead.org/pipermail/barebox/2016-August/027849.html). A user 
may set BR2_TARGET_BAREBOX_CUSTOM_VERSION to v2016.08.0+, so this may be 
applicable to Buildroot master.

baruch

> +$(1)_ARCH = arm
>  else
>  $(1)_ARCH = $$(KERNEL_ARCH)
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
