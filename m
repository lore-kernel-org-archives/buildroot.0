From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Thu, 14 Sep 2017 11:11:54 +0700
Subject: [Buildroot] [RFC] scanpypi: convert to Python 3 syntax
In-Reply-To: <98b793ed-680b-2eda-382c-885c65cdb26f@mind.be>
References: <20170913133633.8477-1-yegorslists@googlemail.com>
 <98b793ed-680b-2eda-382c-885c65cdb26f@mind.be>
Message-ID: <CALFoz4ZyRgn6Zem7QQBGbsgtD-PE68NZgcV2MXhdBXZDj684cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>- don't specify a version in the shebang (use system default);
>- document somewhere that the script may fail on python2/3-only packages,
and
>that you have to run it explicitly with 'python3 utils/scanpypi' in that
case.
Agree.

I was thinking about some sort of heuristics (detecting py2/py3), but now I
see this one is the better approach.

On 14 September 2017 at 04:09, Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 13-09-17 15:36, yegorslists at googlemail.com wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Some Python 3 only packages have Python 3 syntax in their setup.py
> > files. Besides setup.py files can have UTF-8 encoding. Both cases
> > would make scanpypi fail.
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  utils/scanpypi | 63 +++++++++++++++++++++++++++++-
> ----------------------------
> >  1 file changed, 32 insertions(+), 31 deletions(-)
> >
> > diff --git a/utils/scanpypi b/utils/scanpypi
> > index 02384f2569..9e632c3024 100755
> > --- a/utils/scanpypi
> > +++ b/utils/scanpypi
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python2
> > +#!/usr/bin/env python3From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Some Python 3 only packages have Python 3 syntax in their setup.py
> files. Besides setup.py files can have UTF-8 encoding. Both cases
> would make scanpypi fail.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 63 +++++++++++++++++++++++++++++-
> ----------------------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 02384f2569..9e632c3024 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python2
> +#!/usr/bin/env python3
>
>  This doesn't sound like the right approach to me...
>
>  The same problem you mention could happen when a setup.py uses some
> python2
> construct, which would make scanpypi fail now. So what I would do is:
> - make sure it can run in either python2 or python3;
> - don't specify a version in the shebang (use system default);
> - document somewhere that the script may fail on python2/3-only packages,
> and
> that you have to run it explicitly with 'python3 utils/scanpypi' in that
> case.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>



-- 
With best regards,
  Alexey Roslyakov
Email: alexey.roslyakov at gmail.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170914/1b899d73/attachment.html>
