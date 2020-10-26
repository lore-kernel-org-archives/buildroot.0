From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 17:09:36 +0100
Subject: [Buildroot] [PATCH v2] configs/arcturus_ucp1020: Enabling
 gcc-8.x & support for BR2_powerpc_8548 cores
In-Reply-To: <b5cbb9bf-5507-d5b1-9679-4ea0b5767f99@ArcturusNetworks.com>
References: <977a0251-8239-1ec8-268c-4bf9b1c0498a@ArcturusNetworks.com>
 <b5cbb9bf-5507-d5b1-9679-4ea0b5767f99@ArcturusNetworks.com>
Message-ID: <20201026170936.7c783021@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for following up quickly with a new proposal!

The commit title is incorrect: it is not related to
configs/arcturus_ucp1020.

On Mon, 26 Oct 2020 11:52:27 -0400
Michael Durrant <mdurrant@ArcturusNetworks.com> wrote:

> ?package/gcc/Config.in.host | 2 +-
> ?package/gcc/gcc.mk???????? | 4 ++++
> ?2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 74999c800b..a21ba006ce 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -27,7 +27,7 @@ config BR2_GCC_VERSION_8_X
> ??????? depends on !BR2_or1k
> ??????? # powerpc spe support has been deprecated since gcc 8.x.
> ??????? # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> -?????? depends on !BR2_powerpc_SPE
> +?????? depends on !BR2_powerpc_SPE || BR2_powerpc_8548

Is there a reason here to make this conditional on BR2_powerpc_8548 and
not just drop the !BR2_powerpc_SPE dependency ?

> ?config BR2_GCC_VERSION_9_X
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index f372857916..0c5d30d55c 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -219,6 +219,10 @@ ifeq ($(BR2_powerpc_SPE),y)
> ?HOST_GCC_COMMON_CONF_OPTS += \
> ??????? --enable-e500_double \
> ??????? --with-long-double-128
> +ifeq ($(BR2_powerpc_8548),y)
> +HOST_GCC_COMMON_CONF_OPTS += \
> +?????? --enable-obsolete
> +endif

Same question.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
