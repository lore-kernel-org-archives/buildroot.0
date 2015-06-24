From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Jun 2015 00:56:48 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: add patches
 to build with kernel headers 3.2
In-Reply-To: <55891190.7080800@mind.be>
References: <1434969830-31251-1-git-send-email-vorel@jablocom.com>
 <55891190.7080800@mind.be>
Message-ID: <20150624225647.GR28656@t61>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

> On 06/22/15 12:43, Petr Vorel wrote:
> > From: Petr Vorel <petr.vorel@gmail.com>

>  "works" as in run-time tested?
I've done some brief tests, I'll do more testing probably this week. Ok, I should have
wait and post the patch after more testing. Anyway I need to get it work even on lower
kernel than 3.2 (obviously some features will be missing, but NetworkManager cannot
crash). Upstream is willing to accept simple patches which fixes behaviour on older
kernels.

>  Upstream status?
Not sure if I understand your question. The patch was taken from upstream.

> > -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

>  Basically it _may_ also work with lower kernel headers but hasn't been tested,
> right? Ideally, it would be nice to do a (build-)test with 2.6.34-ish.
Why 2.6.34-ish? The minimum kernel version in toolchain/toolchain-common.in after
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 is 2.6, which is unspecified.

> Or else, you could add a comment saying that it could work with lower headers. The
> minimal headers version was anyway only introduced to fix an autobuild failure.
Do you mean to keep BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 and mention in "help" lower
versions?

>  Regards,
>  Arnout

Kind regards,
Petr
