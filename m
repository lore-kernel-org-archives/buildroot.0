From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Jul 2012 22:23:24 +0200
Subject: [Buildroot] [PATCH v4 09/22] manual: add advice about GPL
 compliance for Buildroot
In-Reply-To: <4FF59C1F.4000908@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <1337276001-26149-10-git-send-email-luca@lucaceresoli.net>
 <4FF59C1F.4000908@lucaceresoli.net>
Message-ID: <4FF5F7BC.8000208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/12 15:52, Luca Ceresoli wrote:
> The above text has been Acked-By two Buildroot developers and had no negative
> comments after ~6 weeks, which is good.
>
> Nevertheless, I think it lacks some parts that I would like to be clarified.
>
> A Buildroot tree is made up of the following parts:
>   1. the various makefiles and scripts that build the toolchain, handle
>      package compilation and generate a root filesystem, which is the heart
>      of Buildroot;
>   2. patches to packages;
>   3. small, proprietary, project-specific applications or libraries whose
>      source code resides in the Buildroot tree (not present in mainline).
>
> The above clarification text, as well as the COPYING text, obviously applies
> to point 1, but IMO points 2 and 3 need a different policy.
>
> Patches to packages are modifications to externally-developed code, so I
> think they fall under the same license as the package.

  Good point.  Without clarification, the patches would carry buildroot's
GPL and hence spread into the package's they're applied to.  OTOH the
Signed-off-by lines in the patches could be construed to imply that the
patch follows the license of the files that it's applied to (cfr. DCO).


> If this is correct, a clarification should be added to the above text and,
> more important, to COPYING, much like the note at the beginning of the
> Linux COPYING file.

  Ack.


> Point 3 refers to the method described by Thomas Petazzoni in
> http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf, page 30.
> The idea is that small "project-specific applications or libraries" can be
> kept inside the Buildroot tree to simplify its integration.
>
> Technically, it's how makedevs works in Buildroot. Is makedevs considered "a
> part of Buildroot"? It think it is.
> But one may want to develop another small utility in the same way inside the
> Buildroot tree, but keeping it proprietary. As such, it should be clear
> whether or not it is allowed to keep such code inside the Buildroot tree
> without it falling under the Buildroot license.

  I would say that this falls under the 'mere aggregation' clause.  Whether
the source code of a proprietary program is in package/foo or in ../foo
really makes no difference at all.

  That said, it would be good to clarify that point.


> My personal feeling is that Buildroot should allow to keep such proprietary
> code in the tree, but with a clear way to determine that they are not
> considered a derived work of Buildroot.
> The discrimination could be: whatever is a package (in the Buildroot
> meaning) *and* has <PKG>_LICENSE = PROPRIETARY in its .mk is considered not
> to be a part of Buildroot and can have a different license.

  *Very* good point.  The GPL itself is too vague to really be sure of what
constitutes a derived work of buildroot.

  What about the finalize script?  Is that part of the derived work?  For sure,
whether it is or not should not depend on whether the file is within or
outside of the tree...


> This clause should be part of COPYING and documented in the manual too.
> The legal-info code does not currently save the Buildroot tree, but when it
> will be able to do so it should also be able to skip such packages.
>
> Of course this would allow a more flexible usage of Buildroot in real life,
> but at the cost of making the licensing policy more complex.

  The licensing of buildroot _is_ complex.  For the moment, it looks simple
because it is fuzzy, all the complexity is hidden.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
