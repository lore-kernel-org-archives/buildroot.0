From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Wed, 6 Nov 2013 19:27:46 +0200
Subject: [Buildroot] [PATCH v2 1/1] openpgm: disable on AVR32
In-Reply-To: <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
References: <1383329548-8528-1-git-send-email-alexander.lukichev@gmail.com>
 <20131101192027.1ea4c1bc@skate>
 <CAAHaz6GXiQAMuoK2eo0=EjmE509P98zuuAuN7f_T5TYeK6W1QA@mail.gmail.com>
 <CAHt8ZCO2OEtWe8NrDYSTkmu7uqQGpQbWjAEJg+jHVGzsWsF9Mg@mail.gmail.com>
 <20131102122618.18eb2f00@skate>
 <CAHt8ZCOVSKMynxFe9WQuei-FKuB8BAJE2+dtEQreqwZokkTWdw@mail.gmail.com>
Message-ID: <CAAHaz6HvxQR0g9CpfvRTJN2FAoGmgR_z6uWVar93AXjENH-vbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon, Thomas,

2013/11/2 Simon Dawson <spdawson@gmail.com>

> On 2 November 2013 11:26, Thomas Petazzoni wrote:
> > I did a minimal test case, and even by specifying -march and -mpart,
> > sync_add_and_fetch_2 remains an undefined symbol. Interestingly, if you
> > use sync_add_and_fetch() on a pointer to a 4 bytes value, there's no
> > problem, but if it's a pointer to a 2 bytes value, then the intrinsics
> > uses sync_add_and_fetch_2, which doesn't work.
>
> Interesting. Alexander: are we missing a trick here? How did you get
> the compiler to use the correct intrinsics?
>
>
No, you don't. I must have hallucinated the whole thing.

I have now tried to check with a locally built toolchain, and it also could
not
generate 2-byte versions of those functions, for all 3 -march= alternatives
(ap,
ucr1, ucr2; I remember that I used ucr2 previously). Nor could I find the
code
for them in GCC sources (I remember vaguely that I stumbled upon it during
my
initial attempts to pacify openpgm).

In addition, the document http://www.atmel.com/Images/doc32074.pdf on page 8
indeed claims to support 4-byte (int) versions of those functions, saying
nothing
about other data types.

I apologize both for the delay and for making other people wasting time on
this.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/18718b0e/attachment.html>
