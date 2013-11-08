From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 8 Nov 2013 09:26:41 +0000
Subject: [Buildroot] [PATCH] avr32: disable kernel headers
In-Reply-To: <20131108082243.1a889fee@skate>
References: <1383859843-3549-1-git-send-email-spdawson@gmail.com>
 <20131108082243.1a889fee@skate>
Message-ID: <CAHt8ZCM+eWqdsfoXQ1qe9bsyph58NyjN06fRqdOfKPn33nsvxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

On 8 November 2013 07:22, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> How much effort is it to instead fix uClibc to not break with more
> recent kernel headers? It seems a little bit annoying to me that we
> need to carry this !BR2_avr32 dependency for all new kernel headers
> version. If the fix is one or two simple patches for uClibc 0.9.31, it
> might be worthwhile.

I did actually submit a patch to fix this some time ago; see

  http://patchwork.ozlabs.org/patch/213384/

However, the patch was not accepted, and the discussion degenerated
into a debate about gcc versions. I can revive that patch if you think
it appropriate...?

> And if it's not the case, I believe I'd prefer the dependency to be on
> the uClibc version (i.e 'depends on !BR2_PACKAGE_UCLIBC_0_9_31')
> instead of on the architecture, because the problem seem more related
> to the uClibc version rather than the architecture.

Yes, agreed.

Simon.
