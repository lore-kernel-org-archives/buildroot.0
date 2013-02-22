From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri, 22 Feb 2013 12:55:09 +0100 (CET)
Subject: [Buildroot] [PATCH 1/1] libmad: force architecture-specific
 optimisations on AVR32
In-Reply-To: <CAHt8ZCNfxNTptRTohRX24h9Gbm89jWfaWAS89yGv6-B68AAjQA@mail.gmail.com>
References: <1361494881-27134-1-git-send-email-gilles.talis@gmail.com>
 <CAHt8ZCNfxNTptRTohRX24h9Gbm89jWfaWAS89yGv6-B68AAjQA@mail.gmail.com>
Message-ID: <1754953585.57239.1361534109750.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, February 22, 2013 9:21:49 AM, Simon Dawson wrote:
> Hi Gilles,
> 
> On 22 February 2013 01:01, Gilles Talis <gilles.talis@gmail.com> wrote:
> > Fixes:
> > http://autobuild.buildroot.net/results/e01f5a5484299dce1797966445f3972583c67b22
> > http://autobuild.buildroot.net/results/7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d
> >
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> 
> This looks fine, but wouldn't it be simpler to just do
> 
> config BR2_PACKAGE_LIBMAD
>   bool "libmad"
>   select BR2_PACKAGE_LIBMAD_ASO if BR2_avr32
> 
> in the libmad Config.in?

I agree, all the more looking only at Config.in, one could think that this is
doing exactly the opposite.

Best regards,
Beno?t
