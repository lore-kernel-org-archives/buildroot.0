From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 11 Oct 2013 08:47:20 +0100
Subject: [Buildroot] [PATCH] uboot: support -p option for mkenvimage
In-Reply-To: <20131010170658.68908aae@skate>
References: <1381399545-30713-1-git-send-email-spdawson@gmail.com>
 <20131010170658.68908aae@skate>
Message-ID: <CAHt8ZCNgAtSnbHZGv21Qw=OZZvBWUHRztOsFNNLAOHYfxu32Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10 October 2013 16:06, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Maybe a few more words like in which cases this is useful, would be
> nice to have I believe (I myself don't know when this option should be
> used).

I have been using a crappy script to generate a u-boot environment
image, and that script was padding with 0x00 bytes instead of 0xff
(which is the default used by the mkenvimage tool). Having looked into
this a bit more, it appears that the 0xff padding works just fine in
my particular use case.

So, I no longer consider this patch necessary, and cannot provide a
justification for it.

I have, however, found that I need to pass the -r (redundant
environment) flag to mkenvimage; so I propose exposing that flag in
the Buildroot menu.

Simon.
