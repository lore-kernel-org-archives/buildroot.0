From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Jul 2019 10:06:37 +0200
Subject: [Buildroot] [PATCH 0/4] libglib: fix build with NLS or in Thumb
 mode (branch yem/meson-per-pkg-flags)
In-Reply-To: <cover.1561407936.git.yann.morin.1998@free.fr>
References: <cover.1561407936.git.yann.morin.1998@free.fr>
Message-ID: <5adc2505-d376-7d63-9c48-1ad69e2516f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/06/2019 22:25, Yann E. MORIN wrote:
> Hello All!
> 
> With meson, it is impossible to pass extra CFLAGS or override them
> entirely from the command line (i.e. neither in the environment nor as
> command line arguments). Worse, if we were to do so, they would be
> passed to the host compiler, not the target compiler.
> 
> This series adds two changes to the meson infrastructure:
>   - a fix for when the *FLAGS variables are empty ut with spaces,
>   - the ability for packages to pass their own *FLAGS if they need to.
> 
> Finally, two changes are done in libglib2, that take advantage of this
> new feature:
>   - fix the build when the external gettext provides the i18n functions,
>   - fix the build on ARM in Thumb mode.
> 
> Thanks to Peter S. for the initial infra patch, thanks to Thomas for a
> previous review, and thanks to Adam for investigting a bug that led to
> the first patch and parts of the second patch, as well as proof-reading
> my crappy commit logs; any leftover typo is entirely his fault, now!
> Muahaha! ;-]
> 
> 
> Regards,
> Yann E. MORIN.

 Series applied to master, thanks!

 Regards,
 Arnout
