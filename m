From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 21 Feb 2013 19:36:08 +0000
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <87ppzthm85.fsf@dell.be.48ers.dk>
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 <87621mhs7d.fsf@dell.be.48ers.dk>
 <CAHt8ZCNf=k9LyXMob_DpzcOYtfBfhfNugr8n02vNwpB+s1fpkg@mail.gmail.com>
 <87y5eigchn.fsf@dell.be.48ers.dk>
 <59153487.35651.1361449720550.JavaMail.root@advansee.com>
 <87ppzthm85.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCNHZec838Ouh5tLtcxfhQJ1UHBQ1AhpaMGX1V+o-mjjkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 February 2013 12:42, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> writes:
>
>  Simon> The problem is that, for libmad to be usable on avr32, this
>  Simon> optimization patch really *is* needed.
>  >>
>  >> Ok, then lets fix it up instead.
>
>  Beno?t> To fix it up, you can check if libmad is provided with the ASF:
>  Beno?t> http://www.atmel.com/tools/AVRSOFTWAREFRAMEWORK.aspx
>
>  Beno?t> If so, it may have been cleaned up since the BuildRoot patch,
>  Beno?t> so generate a new patch from the ASF against mainline libmad,
>  Beno?t> and retest.
>
> Simon, will you look into this?

Unfortunately, this approach doesn't work: using a regenerated avr32
patch from ASF, the madplay build still fails in exactly the same
manner if the architecture-specific optimisations are disabled for
libmad.

A simpler approach would be to force the arch-specific optimisations
to be enabled for avr32; would that be an acceptable compromise?

Simon.
