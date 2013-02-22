From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 22 Feb 2013 10:55:24 -0800
Subject: [Buildroot] [PATCH 1/1] libmad: force architecture-specific
 optimisations on AVR32
In-Reply-To: <87vc9keb14.fsf@dell.be.48ers.dk>
References: <1361494881-27134-1-git-send-email-gilles.talis@gmail.com>
 <CAHt8ZCNfxNTptRTohRX24h9Gbm89jWfaWAS89yGv6-B68AAjQA@mail.gmail.com>
 <87vc9keb14.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2xAU_+jHhxctzO_vxu6NJHpN4RmuKc20H4R3xbud6-Uxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon, Benoit and Peter,

2013/2/22 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:
>
>  Simon> Hi Gilles,
>  Simon> On 22 February 2013 01:01, Gilles Talis <gilles.talis@gmail.com> wrote:
>  >> Fixes:
>  >> http://autobuild.buildroot.net/results/e01f5a5484299dce1797966445f3972583c67b22
>  >> http://autobuild.buildroot.net/results/7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d
>  >>
>  >> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>
>  Simon> This looks fine, but wouldn't it be simpler to just do
>
>  Simon> config BR2_PACKAGE_LIBMAD
>  Simon>   bool "libmad"
>  Simon>   select BR2_PACKAGE_LIBMAD_ASO if BR2_avr32
>
>  Simon> in the libmad Config.in?
>
> Indeed. That or simply hiding (forcing) the option on avr32, E.G.:
>
> config BR2_PACKAGE_LIBMAD_ASO
>         bool "Architecture-specific optimizations" if !BR2_avr32
>         default y
>
> --
> Bye, Peter Korsgaard
Thanks for your valuable comments. Will send a second version of the
patch with your suggestions later on.

Gilles.
