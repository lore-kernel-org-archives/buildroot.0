From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 6 Nov 2013 19:18:19 +0000
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <20131106183947.0b078df7@skate>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
 <20131102122618.18eb2f00@skate>
 <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
 <CAAHaz6HvxQR0g9CpfvRTJN2FAoGmgR_z6uWVar93AXjENH-vbQ@mail.gmail.com>
 <20131106183947.0b078df7@skate>
Message-ID: <CAHt8ZCOAy7vcbfUC9eg1AETz7D=9HR1=it8ZgjvNxX-3Q+R0cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 November 2013 17:39, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> However, as Simon said, maybe it would anyway be useful to pass
> -march=ap when building things, since that's the only AVR32 processor
> variant that ever had Linux support. So something like the following
> change would maybe be good to have. Simon, if you're interested in
> picking this up, giving it a test and submitting it, it would be great!
>
> diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
> index 199c150..8429589 100644
> --- a/arch/Config.in.avr32
> +++ b/arch/Config.in.avr32
> @@ -3,3 +3,6 @@ config BR2_ARCH
>
>  config BR2_ENDIAN
>         default "BIG"
> +
> +config BR2_GCC_TARGET_ARCH
> +       default "ap"

Okay; I think this is worth doing --- will submit a patch.

Simon.
