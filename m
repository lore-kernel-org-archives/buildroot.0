From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 2 Nov 2013 16:51:19 +0000
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <20131102122618.18eb2f00@skate>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
 <20131102122618.18eb2f00@skate>
Message-ID: <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Alexander.

On 2 November 2013 11:26, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I did a minimal test case, and even by specifying -march and -mpart,
> sync_add_and_fetch_2 remains an undefined symbol. Interestingly, if you
> use sync_add_and_fetch() on a pointer to a 4 bytes value, there's no
> problem, but if it's a pointer to a 2 bytes value, then the intrinsics
> uses sync_add_and_fetch_2, which doesn't work.

Interesting. Alexander: are we missing a trick here? How did you get
the compiler to use the correct intrinsics?

Simon.
