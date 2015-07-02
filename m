From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Jul 2015 07:56:19 +0000
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig: define
	KCONFIG_EDITORS_MAKE_ENV
In-Reply-To: <20150702095217.6813b8c5@free-electrons.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
 <1435582227-26345-2-git-send-email-talz@ezchip.com>
 <1435823045.2966.23.camel@synopsys.com>
 <20150702095217.6813b8c5@free-electrons.com>
Message-ID: <1435823779.2966.31.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2015-07-02 at 09:52 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Thu, 2 Jul 2015 07:44:05 +0000, Alexey Brodkin wrote:
> 
> > I'm wondering why did you put 2 patches in one series?
> >  [1] https://patchwork.ozlabs.org/patch/489307/
> >  [2] https://patchwork.ozlabs.org/patch/489306/
> > 
> > I'd say these 2 patches solve completely different problems and so
> > should be posted as 2 separate patches compared to your [PATCH 
> > 1/2],
> > [PATCH 2/2].
> 
> I agree they are not related.
> 
> > The problem with series patches within series could not be applied
> > separately, that means chances are you may not get either applied
> > because:
> 
> That's not really true. I tend to try to apply all patches I can from 
> a
> series, even if certain other patches of the series cannot be 
> applied.
> Look at the SELinux series for example. I have not applied some of 
> the
> first patches of the series, but already applied some patches later 
> in
> the series.
> 
> So while I agree it's a bit weird to mix completely independent stuff 
> in
> one single patch series, it's not actually that problematic.

Makes sense.

What about mentioned problem with patch rebase that is only required
because of line number changes?

In this particular case a few more lines were added in the file and so
"git am" fails while "patch" succeeds with message about offset like
that:
----------------->8-----------------
patching file package/pkg-kconfig.mk
Hunk #1 succeeded at 109 with fuzz 2 (offset 33 lines).
----------------->8-----------------

Is my proposal for resend is valid or you may handle it yourself?

-Alexey
