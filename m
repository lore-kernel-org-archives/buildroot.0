From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Oct 2012 00:11:20 +0100
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <50905E98.3080207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Although we'll discuss this at the BR devel day next Saturday, Yann won't be there
so we'd better have some discussion on the list as well (unless, Yann, you could
be available on chat?).

On 09/10/12 01:40, Yann E. MORIN wrote:
[snip]
> On the other hand, Arnout pointed out that only packages with depenencies on
> toolchain features should be converted, and in cascade, packages that depend
> on those, leaving alone packages that do not have any depednency at all (if
> I understood correctly):
>      http://lists.busybox.net/pipermail/buildroot/2012-August/058040.html
>
> Of course, no need to say I'm in favor of modifying all packages, if at least
> only for points 1&2 above. ;-) Of course, I understand Arnout's concerns about
> keeping simplicity and not adding cruft where it is not needed. This post is
> to request comments on this new deeply-impacting change.

  With the pkg-new script, my concern is much reduced.  The simplicity of having
the same pattern all over wins out in that case.

[snip]
> Again, this series is an _RFC_ on the _AVAILABLE mechanism, so the first
> question we must answer is:
>
>      Do we even want this mechanism in buildroot at all?
>
> Then, and only then, can we decide what to do, and how far to push it.

  There is still an alternative: patch Kconfig to "properly" handle
select/depend transitivity.  I.e., when a symbol selects another symbol,
this implies that all dependencies of the other symbol are inherited.  Did
anyone ever investigate the feasibility of such an feature?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
