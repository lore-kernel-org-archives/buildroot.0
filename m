From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Nov 2013 10:17:20 +0100
Subject: [Buildroot] [PATCH] libcap-ng: disable on avr32 which lacks TLS
In-Reply-To: <20131122100515.3743af6c@skate>
References: <1385107694-2132-1-git-send-email-s.martin49@gmail.com>
 <20131122100515.3743af6c@skate>
Message-ID: <CAHXCMM+F+H6xTA7iH27Lf6Rkq-69nb4DrtNzU7X4bu-RrE_9Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


2013/11/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Fri, 22 Nov 2013 09:08:14 +0100, Samuel Martin wrote:
> > libcap-ng needs TLS support, which is not available on avr32.
> > Also, disable reverse dependencies.
> >
> > Fixes:
> >
> http://autobuild.buildroot.net/results/73c/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/
> >
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  package/libcap-ng/Config.in | 1 +
> >  package/ofono/Config.in     | 1 +
> >  2 files changed, 2 insertions(+)
>
> See the discussion at http://patchwork.ozlabs.org/patch/288051/.
>

> However, this patch is better in that it takes into account reverse
> dependencies. But it still isn't perfect because it isn't updating
> ofono comment so that it doesn't get shown on AVR32.
>
Indeed.

If I resubmit the patch, would it be merged or do we prefer just having the
solution in which
TLS knob is driven by thread support (as discussed in the thread you
mentioned above)?

IMHO, this patch (with the comment fixed) can be integrated for the
release, and a more long
term solution can be implement later for the next release.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131122/0f0c022a/attachment.html>
