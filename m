From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 22 Feb 2013 08:21:49 +0000
Subject: [Buildroot] [PATCH 1/1] libmad: force architecture-specific
 optimisations on AVR32
In-Reply-To: <1361494881-27134-1-git-send-email-gilles.talis@gmail.com>
References: <1361494881-27134-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <CAHt8ZCNfxNTptRTohRX24h9Gbm89jWfaWAS89yGv6-B68AAjQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gilles,

On 22 February 2013 01:01, Gilles Talis <gilles.talis@gmail.com> wrote:
> Fixes:
> http://autobuild.buildroot.net/results/e01f5a5484299dce1797966445f3972583c67b22
> http://autobuild.buildroot.net/results/7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d
>
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

This looks fine, but wouldn't it be simpler to just do

config BR2_PACKAGE_LIBMAD
  bool "libmad"
  select BR2_PACKAGE_LIBMAD_ASO if BR2_avr32

in the libmad Config.in?

Simon.
