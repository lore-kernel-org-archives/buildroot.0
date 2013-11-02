From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 2 Nov 2013 08:03:51 +0000
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
Message-ID: <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander.

On 1 November 2013 20:21, Alexander Lukichev
<alexander.lukichev@gmail.com> wrote:
> The compiler (that particular toolchain) has those intrinsic functions but
> is able to generate them only if the exact CPU sub architecture is
> specified, not just AVR32 (their implementations differ for each of the two
> sub architectures). This is impossible to specify unless we introduce it in
> the buildroot configuration system (like several flavors of ARM). And this,
> in turn, seems too much to make just one package happy.

I might be wrong, but is it not the case that only one of the two
micro-architectures --- specifically, avr32b as used by the ap7 core
--- is relevant for Buildroot? (I'm not aware of a Linux port for the
avr32a architecture, as used by the uc3 core.)

If so, then it seems to me that it would be well worth calling the
compiler with the precise micro-architecture specified. This might be
expected to have a positive impact beyond just the openpgm package.

Simon.
