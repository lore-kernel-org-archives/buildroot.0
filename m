From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Jul 2021 11:07:37 +0200
Subject: [Buildroot] python2, polkit, duktape, spidermonkey,
 and Buildroot
In-Reply-To: <CAFSsvmrPc6r1hAgj=gFQLM_1LCMG9h57afodCNTem0YpycnGWA@mail.gmail.com>
References: <CAFSsvmrPc6r1hAgj=gFQLM_1LCMG9h57afodCNTem0YpycnGWA@mail.gmail.com>
Message-ID: <20210704110737.15d4e764@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Jul 2021 19:28:37 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> The Polkit package currently requires Spidermonkey which in turn
> requires Python2.
> There has been a pending patch for quite some time to enable ducktape
> as an alternative javascript engine which can be found here:
> https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/35

As I am subscribed to notifications on this merge request, I have been
following the intermittent discussions taking place on this topic. And
indeed, discussions have been sparse, and the polkit maintainers
reaction has not been very supportive, it even feels like they're
trying to find every possible argument or small issue to not merge the
duktape integration. <sarcasm> Somehow they must have taken too much
inspiration from the Buildroot maintainers :-) </sarcasm>

> I hoped that the maintainers would be more responsive to such a patch
> and hoped to wait for a new version of polkit with duktape as an
> optional backend. However, there seems to be no urgency by the
> maintainers of polkit.
> 
> This is now a problem.
> 
> Spidermonkey, apart from being huge, slow to compile, and a 20MB
> shared library (stripped!), which polkit currently requires, relies on
> Python2, which as we all know is EOL. Furthermore, python2 is
> deprecated in Buildroot, and there is a wiki page on  elinux
> (https://elinux.org/Buildroot:Python2Packages) with a list of packages
> that still require python2.

spidermonkey is definitely a nightmare.

> The question I am proposing is this:
> Would the buildroot maintainers (and the heavy users I know which I
> included on the list) be against a patch series that:
>  - Updates polkit to 0.119
>  - Changed the build system to meson (autotools can't detect C++17 and
> meson works, so it's the path of least resistance.)
>   - Add the ducktape patch from above with a slight refactor for the
> new commits (Small changes)
>   - Drop the spidermonkey package completely and of course, update the
> packages that depend on polkit

Considering how long this has been on-going and how messy the
spidermonkey stuff is, I would definitely be OK to make an exception
here, and have those patches on polkit in Buildroot.

But perhaps it would make sense to have a polkit-duktape project on
Github/Gitlab, which forks polkit, and regularly rebases the duktape
integration on top of newer polkit releases? Considering the interest
from other distributions/build systems, this fork could potentially be
used by others, and the mere existence of this fork would be another
pressure on the polkit maintainers to finally act on this.

> Let me know your thoughts. If we decide that such a patch would be
> accepted into upstream I will submit one to the mailing list!

Please submit, but also consider the idea of having a polkit-duktape
project up on Github/Gitlab, that could be a useful alternative.

Thanks for your work on this, it would definitely be great to no longer
have polkit be this massively heavy beast that it is today.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
