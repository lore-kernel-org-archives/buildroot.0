From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 5 Oct 2015 23:13:30 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <56116029.7000204@mind.be>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <56116029.7000204@mind.be>
Message-ID: <CAHkwnC_AZORjwySNrhuxsaN0+_9ZzTTpMDuEZbe6SVpJM-z-0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 4, 2015 at 7:21 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 28-06-15 20:42, Fabio Porcedda wrote:
> > Hi all,
> > this patch set aims to improve build reproducibility by using a
> > per-package staging directory.
> > Also this feature aims to enable the top-level parallel make.
> >
> > This patch set is available at:
> > https://github.com/fabio-porcedda/buildroot/tree/pps-v4
> >
> >
> > Every package instead of installing the files in the shared staging
> > directory (STAGING_DIR) install all files in a subdirectory of the
> > STAGINGPKG_DIR.
>
> [snip]
>
> > TODO:
> >  - use the toolchaing wrapper even for the internal toolchain
> >  - rebase over master (this patch set is based on 2015.05-161-gca5f11e).
> >  - more testing (tested only for arm target).
>
> [snip]
>
>  Hi Fabio,
>
>  Now that we have a toolchain wrapper for the internal toolchain, would
> you care
> to rebase this series and use the toolchain wrapper for pps support?
>
>
Thanks for the toolchain wrapper for the internal toolchain.

I will rebase this patch for sure and send an updated version.



>  Thomas commented that there should also be a per-package host directory,
> but
> after some discussion here at the BR developer meeting we decided that we
> could
> start with just a per-package staging and see how far we get. We anyway
> don't
> have complete reproducibility at the moment, since the build of host
> packages
> depends on what is installed on the system.
>
>  Note that we are really excited about the possibilities of per-package
> staging
> and top-level parallel build, so we hope you'll continue working on it.
>

Great, it's nice to hear it!


>  I've marked this series as Changes Requested in patchwork.
>
Ok

BR
-- 
Fabio Porcedda
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151005/83693684/attachment-0001.html>
